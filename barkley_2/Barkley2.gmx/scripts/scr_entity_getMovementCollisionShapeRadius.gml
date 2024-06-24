/// scr_entity_getMovementCollisionShapeRadius()

var shape_type = _sat_shape[0];
if (shape_type == SAT_SHAPE_AABB) return max(_sat_shape[4], _sat_shape[5]);
else if (shape_type == SAT_SHAPE_CIRCLE) return _sat_shape[4];
