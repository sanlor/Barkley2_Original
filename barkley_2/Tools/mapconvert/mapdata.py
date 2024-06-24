import os
import re
from xml.dom import minidom

from Tools.mapconvert.grid import RectSolver
from Tools.entityMapping import entityMapping
from Tools.mapconvert.gmxmlprinter import GMXMLPrinter

class MapData(object):

    printer = GMXMLPrinter()

    def __init__(self):
        #Map width + height
        self.width = 384
        self.height = 240

        #Layers and their tiles
        #:name
        #:layer
        #:tileset
        #:tilew
        #:tileh
        #:tilesetw
        #:tileseth
        #:depth
        #:tiles ([x, y, tx, ty])
        self.tilesets = []

        #Collision and semi-collision rects
        #[x, y, w, h]
        self.colrects = []
        self.scolrects = []

        #Wading
        self.wading = []

        #Entities
        #:name
        #:x
        #:y
        self.entities = []
        self.eid = 1
        self.instnames = []

    def nextInstanceId(self):
        while ('inst_%s' % ('{0:08d}'.format(self.eid)) in self.instnames):
            self.eid += 1
        s = 'inst_%s' % ('{0:08d}'.format(self.eid))
        self.instnames.append(s)
        self.eid += 1
        return s

    def add_node(self, doc, root, name, text = ''):
        e = doc.createElement(name)
        e.appendChild(doc.createTextNode(text))
        root.appendChild(e)

    def findInstanceNodes(self, xmldoc):
        objs = []
        objs.extend([entityMapping[e] for e in entityMapping])
        objs.extend(['o_solid8', 'o_solid16', 'o_semisolid8', 'o_semisolid16', 'o_wading8', 'o_wading16'])

        instances = []
        inst = xmldoc.getElementsByTagName('instances')[0]
        instChilds = inst.getElementsByTagName('instance')
        for i in instChilds:
            name = i.getAttribute('objName')
            if name in objs:
                instances.append(i)

        return instances

    def getEntitiesAsXmlNodes(self, xmldoc, gmproj):
        ents = []
        for ent in self.entities:
            en = xmldoc.createElement('instance')

            # Get mapped objectname
            objName = None
            for mapping in entityMapping:
                if (mapping == ent['name']):
                    objName = entityMapping[mapping]

            if objName is None:
                print "Entity has not been mapped to a GM object: %s" % ent['name']
                continue

            # Get X,Y with offsets
            ex = ent['x']
            ey = ent['y']
            scalex = ent['scalex']
            scaley = ent['scaley']
            if objName in gmproj.objects:
                obj = gmproj.objects[objName]
                sprName = obj['sprite']
                if sprName in gmproj.sprites:
                    spr = gmproj.sprites[sprName]
                    ex += spr['xorig'] * scalex
                    ey += spr['yorig'] * scaley

            en.setAttribute('x', str(int(ex)))
            en.setAttribute('y', str(int(ey)))
            en.setAttribute('locked', '0')
            en.setAttribute('code', '')
            en.setAttribute('scaleX', str(scalex))
            en.setAttribute('scaleY', str(scaley))
            en.setAttribute('colour', '4294967295')
            en.setAttribute('rotation', '0')
            en.setAttribute('objName', objName)

            # Generate instance ID (name)
            en.setAttribute('name', self.nextInstanceId())

            ents.append(en)
        return ents

    def filterOutMatchingInstances(self, list1, list2):

        def instanceEq(a, b):
            return a.getAttribute('code') == b.getAttribute('code') and \
                   float(a.getAttribute('x')) == float(b.getAttribute('x')) and \
                   float(a.getAttribute('y')) == float(b.getAttribute('y')) and \
                   float(a.getAttribute('scaleX')) == float(b.getAttribute('scaleX')) and \
                   float(a.getAttribute('scaleY')) == float(b.getAttribute('scaleY')) and \
                   a.getAttribute('locked') == b.getAttribute('locked') and \
                   a.getAttribute('colour') == b.getAttribute('colour') and \
                   a.getAttribute('rotation') == b.getAttribute('rotation') and \
                   a.getAttribute('objName') == b.getAttribute('objName')


        list1Filtered = []
        list2Filtered = []

        for inst1 in list1:
            match = False
            for inst2 in list2:
                if (instanceEq(inst1, inst2)):
                    match = True
            if (not match):
                list1Filtered.append(inst1)

        for inst2 in list2:
            match = False
            for inst1 in list1:
                if (instanceEq(inst1, inst2)):
                    match = True
            if (not match):
                list2Filtered.append(inst2)

        return (list1Filtered, list2Filtered)

    def save_room_gmx(self, gmxpath, gmproj, colrects = True, tiles = True, entities = True):
        # Parse or generate XML document
        if (os.path.exists(gmxpath)):
            xml = self.getXmlFromFile(gmxpath)
            os.remove(gmxpath)
        else:
            xml = self.makeNewXml()

        # Optimize collision rectangles
        if colrects:
            self.optimize_colrects(semi = False, invert = True)
            self.optimize_colrects(semi = True, invert = False)

        # Append room data to XML document
        self.appendToXml(xml, gmproj, colrects, tiles, entities)

        # Write XML to file
        f = open(gmxpath, 'w')
        f.write(self.printer.pretty_print(xml))
        f.close()

    def optimize_colrects(self, semi = False, invert = False, gridsize = 8):
        if semi:
            rects = self.scolrects
        else:
            rects = self.colrects

        grid = RectSolver(self.width / gridsize, self.height / gridsize)
        #print grid.w
        #print grid.h
        if invert:
            grid.reset(1)
        else:
            grid.reset(0)

        for r in rects:
            #print r
            x1 = r[0] / gridsize
            y1 = r[1] / gridsize
            x2 = x1 + (r[2] / gridsize)
            y2 = y1 + (r[3] / gridsize)
            v = 0 if invert else 1
            #print "set_rect(%d,%d,%d,%d,%d)" % (x1, y1, x2-1, y2-1, v)
            grid.set_rect(x1, y1, x2-1, y2-1, v)

        newrects = grid.solve()
        gs = gridsize
        newrects = [(r[0]*gs, r[1]*gs, r[2]*gs, r[3]*gs) for r in newrects]

        if semi:
            self.scolrects = newrects
        else:
            self.colrects = newrects


    def makeNewXml(self):
        doc = minidom.Document()
        root = doc.createElement('room')
        doc.appendChild(root)

        #Add standard tags
        self.add_node(doc, root, 'caption', '')
        self.add_node(doc, root, 'width', str(self.width))
        self.add_node(doc, root, 'height', str(self.height))
        self.add_node(doc, root, 'vsnap', str(16))
        self.add_node(doc, root, 'hsnap', str(16))
        self.add_node(doc, root, 'isometric', str(0))
        self.add_node(doc, root, 'speed', str(60))
        self.add_node(doc, root, 'colour', str(12632256))
        self.add_node(doc, root, 'showcolour', str(0))
        self.add_node(doc, root, 'code')
        self.add_node(doc, root, 'enableViews', str(-1))
        self.add_node(doc, root, 'clearViewBackground', str(-1))

        #Add backgrounds
        bgroot = doc.createElement('backgrounds')
        root.appendChild(bgroot)
        for i in range(8):
            bg = doc.createElement('background')
            bg.setAttribute('visible', '0')
            bg.setAttribute('foreground', '0')
            bg.setAttribute('name', '')
            bg.setAttribute('x', '0')
            bg.setAttribute('y', '0')
            bg.setAttribute('htiled', '-1')
            bg.setAttribute('vtiled', '-1')
            bg.setAttribute('hspeed', '0')
            bg.setAttribute('vspeed', '0')
            bg.setAttribute('stretch', '0')

        #Add views
        viewroot = doc.createElement('views')
        root.appendChild(viewroot)

        view = doc.createElement('view')
        view.setAttribute('visible', '-1')
        view.setAttribute('objName', '<undefined>')
        view.setAttribute('xview', '0')
        view.setAttribute('yview', '0')
        view.setAttribute('wview', '384')
        view.setAttribute('hview', '240')
        view.setAttribute('xport', '0')
        view.setAttribute('yport', '0')
        view.setAttribute('wport', '384')
        view.setAttribute('hport', '240')
        view.setAttribute('hborder', '32')
        view.setAttribute('vborder', '32')
        view.setAttribute('hspeed', '-1')
        view.setAttribute('vspeed', '-1')
        viewroot.appendChild(view)

        for i in range(7):
            view = doc.createElement('view')
            view.setAttribute('visible', '0')
            view.setAttribute('objName', '<undefined>')
            view.setAttribute('xview', '0')
            view.setAttribute('yview', '0')
            view.setAttribute('wview', '384')
            view.setAttribute('hview', '240')
            view.setAttribute('xport', '0')
            view.setAttribute('yport', '0')
            view.setAttribute('wport', '384')
            view.setAttribute('hport', '240')
            view.setAttribute('hborder', '32')
            view.setAttribute('vborder', '32')
            view.setAttribute('hspeed', '-1')
            view.setAttribute('vspeed', '-1')
            viewroot.appendChild(view)

        #Entities
        enroot = doc.createElement('instances')
        root.appendChild(enroot)

        #Tiles
        tileroot = doc.createElement('tiles')
        root.appendChild(tileroot)

        #Physics
        self.add_node(doc, root, 'PhysicsWorld', '0')
        self.add_node(doc, root, 'PhysicsWorldTop', '0')
        self.add_node(doc, root, 'PhysicsWorldLeft', '0')
        self.add_node(doc, root, 'PhysicsWorldRight', '640')
        self.add_node(doc, root, 'PhysicsWorldBottom', '0')
        self.add_node(doc, root, 'PhysicsWorldGravityX', '0')
        self.add_node(doc, root, 'PhysicsWorldGravityY', '10')
        self.add_node(doc, root, 'PhysicsWorldPixToMeters', '0.100000001490116')

        return doc

    input_re1 = re.compile('="([^"]*)\n([^"]*)"', re.DOTALL)
    def getXmlFromFile(self, path, colrects = True, tiles = True, entities = True):
        # Read text from file
        f = open(path)
        xmlstring = f.read()
        f.close()

        # Handle newlines in XML attributes
        res = 1
        while (res > 0):
            (xmlstring, res) = self.input_re1.subn('="\g<1>&#xA;\g<2>"', xmlstring)

        doc = minidom.parseString(xmlstring)

        if tiles:
            #Wipe tiles
            tiles = doc.getElementsByTagName('tiles')[0]
            tiles.childNodes = []

        return doc

    def appendToXml(self, doc, gmproj, colrects = True, tiles = True, entities = True):
        #Root elements
        root = doc.getElementsByTagName('room')[0]

        enroot = root.getElementsByTagName('instances')[0]

        # Prepare entity IDs
        instChilds = enroot.getElementsByTagName('instance')
        for i in instChilds:
            name = i.getAttribute('name')
            self.instnames.append(name)

        ### Entities
        toDel = self.findInstanceNodes(doc)
        toAdd = self.getEntitiesAsXmlNodes(doc, gmproj)

        #Collision rectangles
        if colrects:
            for c in self.colrects:
                if (c[2] == 0 or c[3] == 0):
                    continue

                if (c[2] < 16 or c[3] < 16):
                    size = 8
                    instname = "o_solid8"
                else:
                    size = 16
                    instname = "o_solid16"

                en = doc.createElement('instance')
                en.setAttribute('x', str(c[0]))
                en.setAttribute('y', str(c[1]))
                en.setAttribute('name', self.nextInstanceId())
                en.setAttribute('locked', '0')
                en.setAttribute('code', '')
                en.setAttribute('scaleX', str(c[2] / float(size)))
                en.setAttribute('scaleY', str(c[3] / float(size)))
                en.setAttribute('colour', '4294967295')
                en.setAttribute('rotation', '0')
                en.setAttribute('objName', instname)

                toAdd.append(en)

            for c in self.scolrects:
                if (c[2] == 0 or c[3] == 0):
                    continue

                if (c[2] < 16 or c[3] < 16):
                    size = 8
                    instname = "o_semisolid8"
                else:
                    size = 16
                    instname = "o_semisolid16"

                en = doc.createElement('instance')
                en.setAttribute('x', str(c[0]))
                en.setAttribute('y', str(c[1]))
                en.setAttribute('name', self.nextInstanceId())
                en.setAttribute('locked', '0')
                en.setAttribute('code', '')
                en.setAttribute('scaleX', str(c[2] / float(size)))
                en.setAttribute('scaleY', str(c[3] / float(size)))
                en.setAttribute('colour', '4294967295')
                en.setAttribute('rotation', '0')
                en.setAttribute('objName', instname)

                toAdd.append(en)

            for c in self.wading:
                if (c[2] == 0 or c[3] == 0):
                    continue

                if (c[2] < 16 or c[3] < 16):
                    size = 8
                    instname = "o_wading8"
                else:
                    size = 16
                    instname = "o_wading16"

                en = doc.createElement('instance')
                en.setAttribute('x', str(c[0]))
                en.setAttribute('y', str(c[1]))
                en.setAttribute('name', self.nextInstanceId())
                en.setAttribute('locked', '0')
                en.setAttribute('code', '')
                en.setAttribute('scaleX', str(c[2] / float(size)))
                en.setAttribute('scaleY', str(c[3] / float(size)))
                en.setAttribute('colour', '4294967295')
                en.setAttribute('rotation', '0')
                en.setAttribute('objName', instname)

                toAdd.append(en)

        # Filter instances to add and delete (to preserve order as far as possible)
        (toDel, toAdd) = self.filterOutMatchingInstances(toDel, toAdd)

        #Remove entities and colrects
        if (len(toDel) > 0):
            print "Instances that will be deleted from GM:S room: %d" % len(toDel)
            for d in toDel:
                enroot.removeChild(d)

        #Add entites and colrects
        if (len(toAdd) > 0):
            print "Instances that will be added to GM:S room: %d" % len(toAdd)
            for e in toAdd:
                enroot.appendChild(e)

        #Tiles
        if tiles:
            tileroot = root.getElementsByTagName('tiles')[0]
            root.appendChild(tileroot)
            tile_id = 10000000

            for tileset in self.tilesets:
                tsimg = os.path.basename(tileset['path'])
                tsimg = tsimg[:tsimg.find('.')]
                for tile in tileset['tiles']:
                    x = tile[0]
                    y = tile[1]
                    tx = tile[2]
                    ty = tile[3]
                    tw = tile[4]
                    th = tile[5]
                    tscale_w = tile[6]
                    tscale_h = tile[7]
                    t = doc.createElement('tile')
                    t.setAttribute('bgName', tsimg)
                    t.setAttribute('x', str(x))
                    t.setAttribute('y', str(y))
                    t.setAttribute('w', str(tw))
                    t.setAttribute('h', str(th))
                    t.setAttribute('xo', str(tx))
                    t.setAttribute('yo', str(ty))
                    t.setAttribute('id', str(tile_id))
                    t.setAttribute('name', 'inst_%d' % tile_id)
                    tile_id += 1
                    t.setAttribute('depth', str(tileset['depth']))
                    t.setAttribute('locked', '0')
                    t.setAttribute('colour', '4294967295')
                    t.setAttribute('scaleX', str(tscale_w))
                    t.setAttribute('scaleY', str(tscale_h))
                    tileroot.appendChild(t)


        return root
