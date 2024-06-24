import os
import re
from xml.dom import minidom

# Print map in XML format matching GMS outputs
class GMXMLPrinter():

    #Nodes containing only tet content shortened to 1 line
    text_re1 = re.compile('>\n\s+([^<>\s].*?)\n\s+</', re.DOTALL)
    #Remove extraneous whitespaces at end of line
    text_re2 = re.compile('>\s*\n([ ]*)<', re.DOTALL)
    #Fix newlines inside attributes
    input_re1 = re.compile('="([^"]*)\n([^"]*)"', re.DOTALL)

    #  Reordering of XML attributes
    instance_p1 = re.compile(ur'<instance code="(.*?)" colour="(.*?)" locked="(.*?)" name="(.*?)" objName="(.*?)" rotation="(.*?)" scaleX="(.*?)" scaleY="(.*?)" x="(.*?)" y="(.*?)"/>', re.DOTALL)
    instance_p2 = re.compile(ur'<instance colour="(.*)" locked="(.*)" name="(.*)" objName="(.*)" rotation="(.*)" scaleX="(.*)" scaleY="(.*)" x="(.*)" y="(.*)"/>')
    instance_subst1 = ur'<instance objName="\5" x="\9" y="\10" name="\4" locked="\3" code="\1" scaleX="\7" scaleY="\8" colour="\2" rotation="\6"/>'
    instance_subst2 = ur'<instance objName="\4" x="\8" y="\9" name="\3" locked="\2" scaleX="\6" scaleY="\7" colour="\1" rotation="\5"/>'
    scale_float_p = re.compile(ur'scale([XY])="([0-9]*)\.0"')
    scale_float_subst1 = ur'scale\1="\2"'

    background_p1 = re.compile(ur'<background foreground="(.*)" hspeed="(.*)" htiled="(.*)" name="(.*)" stretch="(.*)" visible="(.*)" vspeed="(.*)" vtiled="(.*)" x="(.*)" y="(.*)"/>')
    background_subst1 = ur'<background visible="\6" foreground="\1" name="\4" x="0" y="0" htiled="\3" vtiled="\8" hspeed="\2" vspeed="\7" stretch="\5"/>'

    view_p1 = re.compile(ur'<view hborder="(.*)" hport="(.*)" hspeed="(.*)" hview="(.*)" objName="(.*)" vborder="(.*)" visible="(.*)" vspeed="(.*)" wport="(.*)" wview="(.*)" xport="(.*)" xview="(.*)" yport="(.*)" yview="(.*)"/>')
    view_subst1 = ur'<view visible="\7" objName="\5" xview="\12" yview="\14" wview="\10" hview="\4" xport="\11" yport="\13" wport="\9" hport="\2" hborder="\1" vborder="\6" hspeed="\3" vspeed="\8"/>'

    tile_p1 = re.compile(ur'<tile bgName="(.*)" colour="(.*)" depth="(.*)" h="(.*)" id="(.*)" locked="(.*)" name="(.*)" scaleX="(.*)" scaleY="(.*)" w="(.*)" x="(.*)" xo="(.*)" y="(.*)" yo="(.*)"/>')
    tile_subst1 = ur'<tile bgName="\1" x="\11" y="\13" w="\10" h="\4" xo="\12" yo="\14" id="\5" name="\7" depth="\3" locked="\6" colour="\2" scaleX="\8" scaleY="\9"/>'

    physics_p = re.compile(ur'</instances>\n(.+?)  <tiles>(.*?)</tiles>\n</room>', re.DOTALL)
    physics_subst = ur'</instances>\n  <tiles>\2</tiles>\n\1</room>'

    def pretty_print(self, node):
        uglyXml = u'' + node.toprettyxml(indent='  ')

        prettyXml = self.text_re1.sub(ur'>\1</', uglyXml)
        prettyXml = self.text_re2.sub(ur'>\n\1<', prettyXml)

        # Correct property ordering
        prettyXml = self.instance_p1.sub(self.instance_subst1, prettyXml)
        prettyXml = self.instance_p2.sub(self.instance_subst2, prettyXml)
        prettyXml = self.scale_float_p.sub(self.scale_float_subst1, prettyXml)
        prettyXml = self.background_p1.sub(self.background_subst1, prettyXml)
        prettyXml = self.view_p1.sub(self.view_subst1, prettyXml)
        prettyXml = self.tile_p1.sub(self.tile_subst1, prettyXml)
        prettyXml = self.physics_p.sub(self.physics_subst, prettyXml)

        # Fix other things to match GMS output
        prettyXml = prettyXml.replace(u'<?xml version="1.0" ?>\n','')
        prettyXml = prettyXml.replace(u'<code/>','<code></code>')
        prettyXml = prettyXml.replace(u'<caption/>','<caption></caption>')

        res = 1
        while res > 0:
            (prettyXml, res) = self.input_re1.subn('="\g<1>&#xA;\g<2>"', prettyXml)

        return prettyXml
