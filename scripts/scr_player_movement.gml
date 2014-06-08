///Player Input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_down = keyboard_check(vk_down);
//Reaction
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

if (place_meeting(x, y+1, obj_wall))
{
    if (key_jump)
    {
        vsp = -jumpspeed;
    }
}
var hsp_final = hsp + hsp_carry;
hsp_carry = 0;
//-----------------------------------horizontal collision-----------------------------------------------------------------
if (place_meeting(x+hsp_final, y , obj_wall))
{
   while(!place_meeting(x+sign(hsp_final), y, obj_wall))
   {
    x += sign(hsp_final);
   }
   hsp_final = 0.0;
   hsp = 0;
}
x += hsp_final;
//-----------------------------------vertical collision-------------------------------------------------------------------
if (place_meeting(x, y+vsp, obj_wall))
{
   while(!place_meeting(x, y+sign(vsp), obj_wall))
   {
    y += sign(vsp);
   }
   vsp = 0.0;
}
y += vsp;
if (place_meeting(x, y+vsp, obj_tile_hazard))
{
    instance_destroy();
    scr_death();
}
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
    image_speed = 0.35;
}
    
else
{
    image_speed = 0.015;
}
    
if (keyboard_check(vk_left) && keyboard_check(vk_right)) // stops the running animation if both directional buttons are pressed
{
    image_speed = 0.015;
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
if (!place_meeting(x, y, obj_wall) && vsp != 0)
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
//--------------------------------death logic------------------------------------------------------------
if (y > room_height)
{
    instance_destroy();
    scr_death();
}
