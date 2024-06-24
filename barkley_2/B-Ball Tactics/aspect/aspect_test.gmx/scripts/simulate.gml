//ALL ORIENTATIONS ARE IN LANDSCAPE MODE

if(argument0 == "PC Unscaled")
{
    // Native Resolution
    display_width  = 384;
    display_height = 240;
    idstring = "PC Unscaled (384x240 16:10)";
}

if(argument0 == "PC 18:10")
{
    // Native Resolution
    display_width  = 432;
    display_height = 240;
    idstring = "Widescreen+ Bleed Area (432x240 18:10)";
}

if(argument0 == "Nexus S")
{
    // Simulate Nexus S screen, 800x480
    display_width  = 800;
    display_height = 480;
    idstring = "Nexus S, Samsung Galaxy S/S2 (800x480 15:9)";
}

if(argument0 == "Galaxy S5")
{
    // Simulate Galaxy S5 screen, 1920x1080
    display_width  = 1920;
    display_height = 1080;
    idstring = "Samsung Galaxy S4/S5 (1920x1080 16:9)";
}

if(argument0 == "Galaxy S3")
{
    // Simulate Galaxy S3 screen, 1280x720
    display_width  = 1280;
    display_height = 720;
    idstring = "Samsung Galaxy S3 (1280x720 16:9)";
}

if(argument0 == "iPhone 4")
{
    // Simulate iPhone 4 screen, 960x640
    display_width  = 960;
    display_height = 640;
    idstring = "iPhone 4 (960x640 3:2)";
}

if(argument0 == "iPhone 5")
{
    // Simulate iPhone 5 screen, 1136x640
    display_width  = 1136;
    display_height = 640;
    idstring = "iPhone 5 (1136x640 16:9)";
}

if(argument0 == "iPad")
{
    // Simulate iPad Non-Retina screen, 1024x768
    display_width  = 1024;
    display_height = 768;
    idstring = "iPad (1024x768 4:3)";
}

if(argument0 == "iPad Retina")
{
    // Simulate iPad Non-Retina screen, 2048x1536 (this is 2x non-retina so it's the same aspect ratio for testing purposes)
    display_width  = 1024;
    display_height = 768;
    idstring = "iPad Retina (2048x1536 4:3) (0.5x)";
}

if(argument0 == "Your System")
{
    // Simulate this system
    display_width  = display_get_width();
    display_height = display_get_height();
    idstring = "Your System (" + string(display_width) + "x" + string(display_height) + ")";
}
