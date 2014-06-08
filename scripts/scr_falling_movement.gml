///Player Input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_kill = keyboard_check(vk_up);
//Reaction
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

if (place_meeting(x, y+1, obj_falling))
{
    vsp = key_jump * -jumpspeed;
}

//-----------------------------------horizontal collision-----------------------------------------------------------------
if (place_meeting(x+hsp, y , obj_falling))
{
   while(!place_meeting(x+sign(hsp), y, obj_falling))
   {
    x += sign(hsp);
   }
   hsp = 0.0;
}
x += hsp;
//-----------------------------------vertical collision-------------------------------------------------------------------
if (place_meeting(x, y+vsp, obj_falling))
{
   while(!place_meeting(x, y+sign(vsp), obj_falling))
   {
    y += sign(vsp);
   }
   vsp = 0.0;
}
y += vsp;
//---------------------------------horizontal animation----------------------------------------------------------------------------
if (keyboard_check(vk_right))
{
    sprite_index = spr_player_run_right;
}     
if (keyboard_check(vk_left))
{
    sprite_index = spr_player_run_left;
}
    
if (keyboard_check(vk_right) || keyboard_check(vk_left))
{
    image_speed = 0.40;
}
    
else
{
    image_speed = 0.025;
}
    
if (keyboard_check(vk_left) && keyboard_check(vk_right)) // stops the running animation if both directional buttons are pressed
{
    image_speed = 0.025;
    if (keyboard_lastkey == vk_left)
    {
        sprite_index = spr_player_idle_right;
    }
    if (keyboard_lastkey == vk_right)
    {
        sprite_index = spr_player_idle_left;
    }
}
//-----------------------------------idle animation-----------------------------------------------------
if (keyboard_check_released(vk_right))
{
    sprite_index = spr_player_idle_right;
}

if (keyboard_check_released(vk_left))
{
    sprite_index = spr_player_idle_left;
}
//----------------------------------jumping animation---------------------------------------------------
if (!place_meeting(x, y, obj_falling) && vsp != 0)
{
    if (keyboard_check(vk_right))
    {
        sprite_index = spr_player_jump_right;
    }
    if (keyboard_check(vk_left))
    {
        sprite_index = spr_player_jump_left;
    }
}
/*else
{
    if (keyboard_check_released(vk_right))
    {
        sprite_index = spr_player_idle_right;
    }
    if (keyboard_check_released(vk_left))
    {
        sprite_index = spr_player_idle_left;
    }
}*/
//--------------------------------death logic------------------------------------------------------------
if (y > room_height)
{
    instance_destroy();
    scr_death();
}
