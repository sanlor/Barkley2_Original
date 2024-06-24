/// scr_event_find_root(event)
/// Finds and returns the root event based on the specified event.

var event = argument0;
while (event._type != EVENT_MAIN and event._type != EVENT_BACKGROUND and event._parent_event != NULL) {
    event = event._parent_event;
}

return event;
