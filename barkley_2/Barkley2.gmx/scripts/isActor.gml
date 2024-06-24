/// isActor(id)

if (instance_exists(argument0)) {
    return object_is_ancestor(argument0.object_index, Actor)
}
return false;
