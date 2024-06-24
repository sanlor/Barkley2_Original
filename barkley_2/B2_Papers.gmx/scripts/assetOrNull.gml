/// assetOrNull(assetName, assetType)

var name = argument0;
var type = argument1;

if (asset_get_type(name) == type) {
    return asset_get_index(name);
} else {
    return NULL;
}
