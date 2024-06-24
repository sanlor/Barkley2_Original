/// scr_draw_motionblur(sprite, subimg, x, y, xscale, yscale, rot, color, alpha, motiondir, motiondist, mindist, maxdetail)

var motiondir = argument9;
var motiondist = argument10;
var mindist = argument11;
var maxdetail = argument12;

// Draw original sprite first, always
var _x = argument2;
var _y = argument3;
draw_sprite_ext(argument0, argument1, _x, _y, argument4, argument5, argument6, argument7, argument8);

// Motion blur if moving fast enough
if (motiondist >= mindist) {
    
    var distdiff, alphamod;
    var blurDist = (motiondist-mindist) / 3;
    var detail = floor(max(1, min(blurDist / 6, maxdetail)));
    var distPerDetail = blurDist / detail;
    for (var i = 0; i < detail; i++) {
        distdiff = distPerDetail * ((i+1) / detail);
        alphamod = (1 - ((i + 1) / (detail+1))) * .5;
        draw_sprite_ext(argument0, argument1,
                        _x - lengthdir_x(distdiff, motiondir),
                        _y - lengthdir_y(distdiff, motiondir),
                        argument4, argument5, argument6, argument7,
                        argument8 * alphamod);
    }
}
