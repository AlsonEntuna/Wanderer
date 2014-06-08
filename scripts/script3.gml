if (place_meeting(x,y,obj_player))
{
    global.checkpoint  = id;
    global.checkpointx = x;
    global.checkpointy = y;
    global.checkpointR = room;
}

if (global.checkpointR == room)
{
    if (global.checkpoint == id)
    {
        sprite_index = spr_checkpoint_active;
    }
    else
    {
        sprite_index = spr_checkpoint_inactive;
    }
}
