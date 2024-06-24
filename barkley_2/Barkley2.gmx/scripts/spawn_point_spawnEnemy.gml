/// spawn_point_spawnEnemy(spawnPoint)

var spawnPoint = argument0;

var spawnX = spawnPoint[? "x"];
var spawnY = spawnPoint[? "y"];
var spawnObj = assetOrNull(spawnPoint[? "objectName"], asset_object);

if (spawnObj != NULL) {
    // Set current spawn point for reference by new enemy
    global.currentSpawnPoint = spawnPoint;
    
    var n = instance_create(spawnX, spawnY, spawnObj);
    
    global.currentSpawnPoint = NULL;
    return n;
} else {
    return NULL;
}
