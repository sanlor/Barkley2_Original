import os
import sys
from xml.dom import minidom

fileInput  = sys.argv[1]
fileOutput  = sys.argv[2]

projxml = minidom.parse(fileInput)

# Iterate through constants
constants = projxml.getElementsByTagName('constant')
f = open(fileOutput, 'w')
for c in constants:
    constName = c.attributes["name"].value
    constValue = c.childNodes[0].nodeValue
    print constName + ";" + constValue 
    f.write(constName + ";" + constValue + "\n");

