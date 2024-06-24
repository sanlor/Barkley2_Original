/// deferredRender_deferEntities()
if (global.settingDeferred == 0) return 0;
with (Particle) {
    if (visible) {
        if (deferredRender_check(id)) {
            visible = false;
        }
    }
}

with (MiniEnviron) {
    if (visible) {
        if (deferredRender_check(id)) {
            visible = false;
        }
    }
}

with (Deferred) {
    if (visible) {
        if (deferredRender_check(id)) {
            visible = false;
        }
    }
}
