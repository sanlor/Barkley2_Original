import os

import Tkinter
import tkFileDialog

from Tools.mapconvert.ogmoproj import OgmoProject
from Tools.mapconvert.ogmomap import OgmoMap
from Tools.mapconvert.gmproj import GMProject

#Hide main Tkinter window
root = Tkinter.Tk()
root.withdraw()

#Ask for OGMO project file
options1 = {}
options1['title'] = 'Select an OGMO Project file (.oep)'
options1['initialdir'] = r'Maps'
oprojfile = tkFileDialog.askopenfile(**options1)
if oprojfile is None:
    exit(1)

#Ask for OGMO map file
options2 = {}
options2['title'] = 'Select an OGMO Map file (.oel)'
options2['initialdir'] = r'Maps'
omapfile = tkFileDialog.askopenfile(**options2)
if omapfile is None:
    exit(1)

#Ask for output room.gmx file
options3 = {}
options3['title'] = 'Select a GM Room output file (.room.gmx)'
options3['initialdir'] = r'Barkley2.gmx\rooms'
options3['initialfile'] = 'output.room.gmx'
gmroom = tkFileDialog.asksaveasfilename(**options3)
if gmroom is '':
    exit(1)



#Read OGMO Project
ogmoproj = OgmoProject(oprojfile)

#Read OGMO MapData
ogmomap = OgmoMap(ogmoproj, omapfile)

#Read B2 project
gmproj = GMProject()

#Make test.room.gmx
ogmomap.save_room_gmx(gmroom, gmproj)

# Pause screen
raw_input("Press Enter to close...")
