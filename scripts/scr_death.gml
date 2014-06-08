if (global.checkpointR != 0)
{
   // room_goto(rm_death);
    if not instance_exists(obj_roomtransition)
{
    n = instance_create(0, 0, obj_roomtransition);
    n.room_ = global.checkpointR;
    n.trans = false;
    n.image_alpha = 0;
    global.t = true;

}
}
else
{
    room_restart();
}
