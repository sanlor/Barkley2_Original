import traceback
import os
import re

from xml.dom import minidom
from Tools.mapconvert.mapdata import MapData
from Tools.mapconvert.grid import Grid


class OgmoMap(MapData):

    layer_solidsZ = re.compile('Solids_Z(.*)', re.DOTALL)
    layer_semiSolidsZ = re.compile('SSolids_Z(.*)', re.DOTALL)

    def __init__(self, ogmoproj, mapfile):
        super(OgmoMap, self).__init__()

        self.mapfile = mapfile
        self.xml = minidom.parse(mapfile)

        self.proj = ogmoproj
        self.parse()

    def parse(self):
        #Read basic map info
        level = self.xml.getElementsByTagName('level')[0]
        self.width = int(level.getAttribute('width'))
        self.height = int(level.getAttribute('height'))

        #Read layers
        for layer in self.proj.layers:
            name = layer['name']
            node = self.xml.getElementsByTagName(name)
            if len(node) == 0:
                print "ERROR: Layer missing (wrong project file?): %s" % name
                continue
            node = node[0]

            if name.startswith('Solids'):
                #print "Reading solids layer %s" % name
                z = 0
                match = self.layer_solidsZ.match(name)
                if (match != None):
                    z = int(match.groups()[0])
                self.read_colrects(node, int(layer['gridw']), False, z)

            elif (name.startswith('Semi-Solids') or name.startswith('SSolids')):
                #print "Reading semi-solids layer %s" % name
                z = 0
                match = self.layer_semiSolidsZ.match(name)
                if (match != None):
                    z = int(match.groups()[0])
                self.read_colrects(node, int(layer['gridw']), True, z)

            elif name.startswith('Wading'):
                print "Reading wading layer %s" % name
                self.read_wadingrects(node, int(layer['gridw']))

            elif 'TileLayerDefinition' in layer['type']:
                print "Reading tile layer %s" % name
                self.read_tileset(layer, node)

            elif 'EntityLayerDefinition' in layer['type']:
                #print 'Reading entities from layer "%s"' % name
                node = self.xml.getElementsByTagName(name)[0]
                self.read_entities(node)
            elif name.startswith('Shadows'):
                # Skip shadows layer
                pass
            else:
                print "--- UNKNOWN LAYER: %s" % name


    def read_entities(self, node):
        for entity in node.childNodes:
            if entity.nodeType == entity.TEXT_NODE:
                continue
            e = {}
            e['name'] = entity.nodeName
            e['x'] = int(entity.getAttribute('x'))
            e['y'] = int(entity.getAttribute('y'))
            w = entity.getAttribute('width')
            h = entity.getAttribute('height')

            eproj = None
            for ep in self.proj.entities:
                if ep['name'] == e['name']:
                    eproj = ep

            if (eproj is None):
                print "Could not find matching entity in project file: " + e['name']
                e['scalex'] = 1
                e['scaley'] = 1
            else:
                if (w == ''):
                    #Object is not scaled on X axis
                    e['scalex'] = 1
                else:
                    e['scalex'] = float(w) / float(eproj['width'])

                if (h == ''):
                    #Object is not scaled on Y axis
                    e['scaley'] = 1
                else:
                    e['scaley'] = float(h) / float(eproj['height'])
            #print '%s %d %d' % (e['name'], e['x'], e['y'])
            self.entities.append(e)


    def read_tileset(self, layer, node):
        tilesetName = node.getAttribute('tileset')
        tilesetsProj = [x for x in self.proj.tilesets if x['name'] == tilesetName]
        if (len(tilesetsProj) == 0):
            raise Exception("Tileset '%s' from %s is missing from %s" %
                    (tilesetName, os.path.basename(self.mapfile),os.path.basename(self.proj.projfile)))
        tilesetProj = tilesetsProj[0]

        #:name
        #:layer
        #:tileset
        #:tilew
        #:tileh
        #:tiles ([x, y, tileid])
        tileset = {}
        tileset['name'] = layer['name']
        tileset['layer'] = layer
        tileset['tileset'] = tilesetName
        tileset['tilew'] = tilesetProj['tilew']
        tileset['tileh'] = tilesetProj['tileh']
        tileset['tilesetw'] = tilesetProj['tilesetw']
        tileset['tileseth'] = tilesetProj['tileseth']
        tileset['path'] = tilesetProj['path']
        tileset['tiles'] = []
        tileset['depth'] = layer['depth']

        w = tileset['tilew']
        h = tileset['tileh']
        tw = tileset['tilesetw']
        th = tileset['tileseth']
        shift = tw / w


        tile_rows = len(node.childNodes[0].data.split('\n'))
        tile_cols = len(node.childNodes[0].data.split('\n')[0].strip().split(','))
        grid = Grid(tile_cols, tile_rows, -1)
        grid.outsideGridVal = -1

        y = 0
        for lines in node.childNodes[0].data.split('\n'):
            x = 0
            for t in lines.strip().split(','):
                tid = int(t)
                if (tid != -1):
                    grid.set(x, y, tid)
                x += 1
            y += 1

        for y in range(tile_rows):
            for x in range(tile_cols):
                tile = self.read_tile(grid, x, y, w, h, shift)
                if not (tile is None):
                    #Add tile
                    #print tile
                    tileset['tiles'].append(tile)
                x += 1
            y += 1
        self.tilesets.append(tileset)

    def read_tile(self, grid, x, y, w, h, tile_shift):
        tid = grid.get(x, y)
        if (tid == -1):
            return None;

        ty, tx = divmod(tid, tile_shift)

        r = grid.get(x+1, y)
        b = grid.get(x, y+1)
        stretchable = (r == tid) or (b == tid)
        batchable = (r == tid+1 and self.same_row(tid, r, tile_shift)) or (b == tid + tile_shift)
        if batchable:
            tile_w = 1
            tile_h = 1
            right = x
            bottom = y
            # Batch right
            while (grid.get(right+1, y) == grid.get(right, y) + 1 and
                   self.same_row(grid.get(right, y), grid.get(right+1, y), tile_shift)):
                right += 1
                tile_w += 1

            # Stretch down
            stretch = True
            while stretch:
                for check_x in range(x, right+1):
                    if grid.get(check_x, bottom+1) != grid.get(check_x, bottom) + tile_shift:
                        stretch = False
                if stretch:
                    bottom += 1
                    tile_h += 1

            grid.set_rect(x, y, right, bottom, -1)
            #print "Batched " + str(tile_w) + ", " + str(tile_h)
            return [x*w, y*h, tx*w, ty*h, w * tile_w, h * tile_h, 1, 1]
        if stretchable:
            right = x
            bottom = y
            # Stretch right
            while (grid.get(right+1, y) == tid):
                right += 1

            # Stretch down
            stretch = True
            while stretch:
                for check_x in range(x, right+1):
                    if grid.get(check_x, bottom+1) != tid:
                        stretch = False
                if stretch:
                    bottom += 1

            grid.set_rect(x, y, right, bottom, -1)
            #print "Stretched " + str(right-x+1) + ", " + str(bottom-y+1)
            return [x*w, y*h, tx*w, ty*h, w, h, right-x+1, bottom-y+1]
        else:
            grid.set(x, y, -1)
            return [x*w, y*h, tx*w, ty*h, w, h, 1, 1]

    def same_row(self, tid1, tid2, shift):
        ty1, tx1 = divmod(tid1, shift)
        ty2, tx2 = divmod(tid2, shift)
        return (ty1 == ty2)

    def read_colrects(self, node, gridsize, semisolid = False, z = 0):
        #print '---- Reading colrects from layer "%s"' % node.nodeName
        for rect in node.getElementsByTagName('rect'):
            x = int(rect.getAttribute('x')) * gridsize
            y = (int(rect.getAttribute('y')) * gridsize) + z
            w = int(rect.getAttribute('w')) * gridsize
            h = int(rect.getAttribute('h')) * gridsize
            #print '%d %d %d %d' % (x, y, w, h)
            if not semisolid:
                self.colrects.append([x, y, w, h])
            else:
                self.scolrects.append([x, y, w, h])

    def read_wadingrects(self, node, gridsize):
        #print '---- Reading colrects from layer "%s"' % node.nodeName
        for rect in node.getElementsByTagName('rect'):
            x = int(rect.getAttribute('x')) * gridsize
            y = int(rect.getAttribute('y')) * gridsize
            w = int(rect.getAttribute('w')) * gridsize
            h = int(rect.getAttribute('h')) * gridsize
            self.wading.append([x, y, w, h])
