import os
import sys
import random
import string
import json


#for dirname, dirnames, filenames in os.walk('./AppData'):
#    print filenames

for fname in os.listdir('./AppData'):
    if fname.endswith('.spm'):
        path = './AppData/' + fname
        print "Converting: " + path

        points = {}

        with open(path) as f:
            lines = f.readlines()
            i = 0
            while i < len(lines)-4:
                uuid = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(30))
                point = {
                    'uuid': uuid,
                    'level': 1,
                    'resources': 1,
                    'objectName': lines[i+3].strip(),
                    'x': int(lines[i+2].split()[1]),
                    'y': int(lines[i+2].split()[2]),
                    'hue': 4235519
                }
                points[point['uuid']] = point
                i += 5

        os.remove(path)

        with open(path, 'w') as f:
            content = json.dumps(points, sort_keys=True, indent=4, separators=(',', ': '))
            f.write(content)
