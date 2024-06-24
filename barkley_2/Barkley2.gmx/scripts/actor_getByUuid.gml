/// actor_getByUuid(uuid)

var uuidMatch = argument0;

with (Actor) {
    if (self.uuid == uuidMatch) {
        return self.id;
    }
}

return NULL;
