#Dependency on http://www.pythonware.com/products/pil/

import re
from PIL import Image
from xml.dom import minidom

class OgmoProject:

    zlayer_tile_re = re.compile('Tiles_Z(.*)', re.DOTALL)

    def __init__(self, projfile):
        self.layers = []
        self.tilesets = []
        self.entities = []

        self.projfile = projfile
        self.projxml = minidom.parse(projfile)

        self.read_layers(self.projxml)
        self.read_tilesets(self.projxml)
        self.read_entities(self.projxml)

    def read_layers(self, xml):
        depth_bg = 100
        depth_fg = -1000000
        fg_layers = ['FGDepthTiles', 'BGDepthTiles']
        for ldef in xml.getElementsByTagName('LayerDefinition'):
            l = {}
            l['node'] = ldef
            l['type'] = ldef.getAttribute('xsi:type')
            l['name'] = ldef.getElementsByTagName('Name')[0].childNodes[0].data
            l['gridw'] = ldef.getElementsByTagName('Width')[0].childNodes[0].data
            l['gridh'] = ldef.getElementsByTagName('Height')[0].childNodes[0].data
            #l['mode'] = ldef.getElementsByTagName('ExportMode')[0].childNodes[0].data
            match_tile = self.zlayer_tile_re.match(l['name'])
            if (l['name'] in fg_layers):
                l['depth'] = depth_fg
                depth_fg -= 1
            elif (match_tile != None):
                l['depth'] = -int(match_tile.groups()[0])
            else:
                l['depth'] = depth_bg
                depth_bg -= 1
            self.layers.append(l)


    def read_tilesets(self, xml):
        for tdef in xml.getElementsByTagName('Tileset'):
            ts = {}
            ts['name'] = tdef.getElementsByTagName('Name')[0].childNodes[0].data
            ts['path'] = tdef.getElementsByTagName('FilePath')[0].childNodes[0].data
            ts['tilew'] = int(tdef.getElementsByTagName('Width')[0].childNodes[0].data)
            ts['tileh'] = int(tdef.getElementsByTagName('Height')[0].childNodes[0].data)
            ts['tilesep'] = int(tdef.getElementsByTagName('TileSep')[0].childNodes[0].data)

            #Read tileset image
            path = r'Maps\%s' % ts['path']
            img = Image.open(path)
            imgw, imgh = img.size
            ts['tilesetw'] = imgw
            ts['tileseth'] = imgh

            self.tilesets.append(ts)

    def read_entities(self, xml):
        for edef in xml.getElementsByTagName('EntityDefinition'):
            e = {}
            e['name'] = edef.getAttribute('Name')
            e['width'] = int(edef.getElementsByTagName('Size')[0].getElementsByTagName('Width')[0].childNodes[0].data)
            e['height'] = int(edef.getElementsByTagName('Size')[0].getElementsByTagName('Height')[0].childNodes[0].data)
            self.entities.append(e)
