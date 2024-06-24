if (scr_screenSurface_verifyBuffers())  // First ensure both buffers exist
{
    surface_copy(scr_screenSurface_getBufferNoHud(), 0, 0, application_surface);
}
