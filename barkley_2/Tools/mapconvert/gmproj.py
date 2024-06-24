from xml.dom import minidom

class GMProject:

    objects = {}
    sprites = {}

    def __init__(self):
        self.readProject()

    def readProject(self, path = 'Barkley2.gmx', projfile = 'Barkley2.project.gmx'):
        self.path = path
        self.projfile = projfile
        projxml = minidom.parse('%s/%s' % (path, projfile))

        # Iterate through objects
        objs = projxml.getElementsByTagName('object')
        for o in objs:
            oname = o.childNodes[0].toxml()
            oname = oname.replace('objects\\', '')
            self.readObject(oname)

        # Iterate through sprites
        sprs = projxml.getElementsByTagName('sprite')
        for s in sprs:
            sname = s.childNodes[0].toxml()
            sname = sname.replace('sprites\\', '')
            self.readSprite(sname)

    def readObject(self, objectname):
        obj = {}

        try:
            objxml = minidom.parse('%s/objects/%s.object.gmx' % (self.path, objectname))

            spriteNode = objxml.getElementsByTagName('spriteName')[0]
            obj['sprite'] = spriteNode.childNodes[0].toxml()
            self.objects[objectname] = obj

        except Exception, exc:
            print "Failed parsing object %s: %s" % (objectname, exc)


    def readSprite(self, spritename):
        spr = {}

        try:
            sprxml = minidom.parse('%s/sprites/%s.sprite.gmx' % (self.path, spritename))

            xorigNode = sprxml.getElementsByTagName('xorig')[0]
            spr['xorig'] = int(xorigNode.childNodes[0].toxml())
            yorigNode = sprxml.getElementsByTagName('yorigin')[0]
            spr['yorig'] = int(yorigNode.childNodes[0].toxml())
            self.sprites[spritename] = spr

        except Exception, exc:
            print "Failed parsing object %s: %s" % (spritename, exc)
