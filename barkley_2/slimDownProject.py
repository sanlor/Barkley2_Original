# Slims down the project to reduce resource usage for dev purposes:
# - Points all sounds to a small ding sound
# - Unlinks all rooms except prespecified rooms
# - Unlinks all SPRITE_PATHS_DELETE matching certain patterns
#
# The current configuration sets the game up to run pretty much only for
# gauntlet combat. Feel free to make your own configurations.
#
# Make sure not to commit any of the changes this script makes!

import os
import re
import sys

# All rooms to keep
# (will keep if prefix matches room name)
ROOMS = [
    'r_scale',
    'r_logo',
    'r_gauntlet',
    'r_debug',
    'r_beastiary',
    'r_height',
    'r_deathscreen01',
    'r_tnn_testRoom'
]

# All sprite paths to remove from resource tree
SPRITE_PATHS_DELETE = [
    'InteractiveActors',
    'Minigames/BootyBass',
    'Minigames/Captcha',
    'Minigames/Challenge',
    'Minigames/Creepypasta',
    'Minigames/Defense',
    'Minigames/Document',
    'Minigames/Elevator',
    'Minigames/Finding Zs',
    'Minigames/GZ_Arcade',
    'Minigames/Hidden',
    'Minigames/Identity',
    'Minigames/Knocking',
    'Minigames/Organ Harvest',
    'Minigames/Psychicvision',
    'Minigames/Puzzlelock',
    'Minigames/Starscape',
    'Minigames/Stealth',
    'Minigames/VRW',
    'Minigames/Wait In Line',
    'Environs',
    'Duergars',
    'WIP_Workshop',
    'Cutscenes',
    'Dwarfnet',
    'Doors',
    'Combat/StatusEffectIcons',
    'Effects/Rain',
    
]

# All object paths to remove from resource tree
OBJECT_PATHS_DELETE = [
    'Doors',
    'Duergars',
    'Effects/Atmosphere',
    'Effects/Rain',
    'Effects/Sewers',
    'Effects/Sound',
    'Environs',
    'Minigames',
    'InteractiveActor/AiRuins',
    'InteractiveActor/BrainCity',
    'InteractiveActor/CuchulainsLair',
    'InteractiveActor/Mines',
    'InteractiveActor/MountainPass',
    'InteractiveActor/Sewers',
    'InteractiveActor/Swamp',
    'InteractiveActor/TirNaNog',
    'InteractiveActor/Wasteland',
    'InteractiveActor/YsKolob',
]

# All script paths to remove from resource tree
SCRIPT_PATHS_DELETE = [
    'InteractiveActor'
]

# Path to project GMX
PROJECT_ROOT = 'Barkley2.gmx/Barkley2.project.gmx'

def addConstant(proj, constant, value):
    pattern = re.compile(ur'  </constants>')
    return pattern.sub(u'    <constant name="%s">%s</constant>\n  </constants>' % (constant, value), proj)

def updateConstantCount(proj):
    count = proj.count(u'<constant ')
    pattern = re.compile(ur'<constants number=".*">')
    return pattern.sub(u'<constants number="%s">' % str(count), proj)

def getProjectFile():
    with open(PROJECT_ROOT, 'r') as f:
        proj = f.read()
        f.close()
        return proj

def saveProjectFile(proj):
    with open(PROJECT_ROOT, 'w') as f:
        f.write(proj)
        f.close()

def clearRooms(proj):
    pattern = re.compile(ur'<room>rooms\\(.*)</room>')
    lines = proj.split('\n')
    remain = []
    rooms = []
    for line in lines:
        match = pattern.search(line)
        if match:
            roomName = match.group(1)
            keep = False
            for roomPrefix in ROOMS:
                if roomName.startswith(roomPrefix):
                    keep = True
            if keep:
                remain.append(line)
            else:
                rooms.append(roomName)
        else:
            remain.append(line)
    proj = '\n'.join(remain)
    for room in rooms:
        proj = addConstant(proj, room, "r_scale")
    return proj

def clearObjects(proj):
    def checkDelPath(path):
        p = '/'.join(path)
        for objectPath in OBJECT_PATHS_DELETE:
            if p.startswith(objectPath):
                return True
        return False

    lines = proj.split('\n')
    remain = []
    objects = []
    path = []
    patternGroupStart = re.compile(ur'<objects name="(.*)">')
    patternGroupEnd = re.compile(ur'</objects>')
    patternObject = re.compile(ur'<object>objects\\(.*)</object>')
    for line in lines:
        match = patternGroupStart.search(line)
        if (match):
            if (match.group(1) != "objects"):
                path.append(match.group(1))

        if checkDelPath(path):
            match = patternObject.search(line)
            if match:
                objects.append(match.group(1))
        else:
            remain.append(line)

        match = patternGroupEnd.search(line)
        if (match and len(path) > 0):
            path.pop()

    proj = '\n'.join(remain)
    for o in objects:
        proj = addConstant(proj, o, "emptyObject")
    return proj

def clearScripts(proj):
    def checkDelPath(path):
        p = '/'.join(path)
        for objectPath in SCRIPT_PATHS_DELETE:
            if p.startswith(objectPath):
                return True
        return False

    lines = proj.split('\n')
    remain = []
    scripts = []
    path = []
    patternGroupStart = re.compile(ur'<scripts name="(.*)">')
    patternGroupEnd = re.compile(ur'</scripts>')
    script = re.compile(ur'<script>scripts\\(.*).gml</script>')
    for line in lines:
        match = patternGroupStart.search(line)
        if (match):
            if (match.group(1) != "scripts"):
                path.append(match.group(1))

        if checkDelPath(path):
            match = script.search(line)
            if match:
                scripts.append(match.group(1))
        else:
            remain.append(line)

        match = patternGroupEnd.search(line)
        if (match and len(path) > 0):
            path.pop()

    proj = '\n'.join(remain)
    for s in scripts:
        proj = addConstant(proj, s, "emptyScript")
    return proj

def clearSprites(proj):
    def checkDelPath(path):
        p = '/'.join(path)
        for spritePath in SPRITE_PATHS_DELETE:
            if p.startswith(spritePath):
                return True
        return False

    lines = proj.split('\n')
    remain = []
    sprites = []
    path = []
    patternGroupStart = re.compile(ur'<sprites name="(.*)">')
    patternGroupEnd = re.compile(ur'</sprites>')
    patternSprite = re.compile(ur'<sprite>sprites\\(.*)</sprite>')
    for line in lines:
        match = patternGroupStart.search(line)
        if (match):
            if (match.group(1) != "sprites"):
                path.append(match.group(1))

        if checkDelPath(path):
            match = patternSprite.search(line)
            if match:
                sprites.append(match.group(1))
        else:
            remain.append(line)

        match = patternGroupEnd.search(line)
        if (match and len(path) > 0):
            path.pop()

    proj = '\n'.join(remain)
    for s in sprites:
        proj = addConstant(proj, s, "emptySprite")
    return proj

if __name__ == '__main__':
    proj = getProjectFile()
    #proj = clearSprites(proj)
    #proj = clearObjects(proj)
    #proj = clearScripts(proj)
    proj = clearRooms(proj)
    proj = updateConstantCount(proj)
    saveProjectFile(proj)
