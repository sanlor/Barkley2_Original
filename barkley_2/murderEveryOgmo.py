import gc
import json
import os
import traceback

from Tools.mapconvert.gmproj import GMProject
from Tools.mapconvert.ogmoproj import OgmoProject
from Tools.mapconvert.ogmomap import OgmoMap
from Tools.roomMapping import roomMapping

#Read B2 project
gmproj = GMProject()

# Path templates
pathtempl_proj = "Maps/%s.oep"
pathtempl_map  = "Maps/%s.oel"
pathtempl_room = "Barkley2.gmx/rooms/%s.room.gmx"

def convert(ogmo_project_file, ogmo_map_file, output_room_gmx,
            colrects = True, tiles = True, entities = True):
    print "-------------------------------------------------"
    print "- Reading Map:\n- OGMO Project: %s\n- OGMO Map:     %s\n- GMS Room:     %s" % (ogmo_project_file, ogmo_map_file, output_room_gmx)

    try:
        #Read OGMO Project
        ogmoproj = OgmoProject(pathtempl_proj % ogmo_project_file)
        #Read OGMO MapData
        mapdata = OgmoMap(ogmoproj, pathtempl_map % ogmo_map_file)
        #Save to output
        mapdata.save_room_gmx(pathtempl_room % output_room_gmx, gmproj,
                              colrects, tiles, entities)

        collected = gc.collect()
        print ""
        return True
    except Exception, e:
        print traceback.format_exc()
        print "ERROR: %s" % e
        raw_input("Press Enter to continue...")
        return False


if __name__ == "__main__":

    # File locations
    logfile = 'convertlog.json'
    roommap = 'Tools/roomMapping.py'
    entitymap = 'Tools/entityMapping.py'

    # Read conversion log
    try:
        if os.path.exists(logfile):
            f = open(logfile)
            logdata = f.read()
            f.close()
            log = json.loads(logdata)
        else:
            log = {}
    except Exception, exc:
        print "Failed loading conversion log: %s" % exc
        log = {}
    newlog = log.copy()

    # Check if room or entity mappings were updated, in that case rerun all files
    room_m = os.path.getmtime(roommap)
    entity_m = os.path.getmtime(entitymap)
    if ((not roommap in log) or (not entitymap in log)):
        log = {}
        newlog[roommap] = room_m
        newlog[entitymap] = entity_m
    elif (room_m != log[roommap] or entity_m != log[entitymap]):
        log = {}
        newlog[roommap] = room_m
        newlog[entitymap] = entity_m

    # Run all files
    for entry in roomMapping:
        try:
            oep = pathtempl_proj % entry[0]
            oel = pathtempl_map % entry[1]
            if (oep in log and oel in log):
                oep_mprev = log[oep]
                oel_mprev = log[oel]
            else:
                oep_mprev = None
                oel_mprev = None
            oep_m = os.path.getmtime(oep)
            oel_m = os.path.getmtime(oel)
            if (oep_m != oep_mprev or oel_m != oel_mprev):
                if convert(entry[0], entry[1], entry[2]):
                    newlog[oep] = oep_m
                    newlog[oel] = oel_m
            else:
                print "*************************************************"
                print "* Skipped Map:\n* OGMO Project: %s\n* OGMO Map:     %s\n* GMS Room:     %s" % (entry[0], entry[1], entry[2])
        except Exception, e:
            print "Failed converting (%s, %s) to %s: %s" % (oep, oel, pathtempl_room % entry[2], e)

    f = open(logfile, 'w')
    f.write(json.dumps(newlog))
    f.close()

# Pause screen
raw_input("Press Enter to close...")
