///stays in place, slowly tracking the hero, in preparation for an assault or shot.
if(argument0 == "prep")
{
    aAI_tracking = 5;
    aAI_trackSpeed = 24;
    
    I_aAI_trackingLeft = 0;
}
else
{
    var _tx,_ty,_dir,_diff,target;
    target = argument1;
    _tx = target.x;
    _ty = target.y;

    if(I_aAI_trackingLeft < aAI_tracking)
    {
        I_aAI_trackingLeft += dt();
        _dir = point_direction(x,y,_tx,_ty);
        _diff = scr_math_rdif(faceDir,_dir);
        
        var track = aAI_trackSpeed * dt();
        if(_diff>track){faceDir -= track;}
        else if(_diff<0-track){faceDir += track;}
        else{faceDir = _dir;}
    }
}
