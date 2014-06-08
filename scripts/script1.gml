///Player Input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_kill = keyboard_check(vk_up);
//Reaction
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

if (place_meeting(x,y+1,obj_wall))
{
    vsp = key_jump * -jumpspeed;
}

//horizontal animation

if (keyboard_check(vk_right))
{
    sprite_index = spr_player_run_right;
}
    
if (keyboard_check(vk_left))
{
    sprite_index = spr_player_run_left;
}

if (keyboard_check(vk_left) && keyboard_check(vk_right))
{
    if (keyboard_lastkey == vk_left)
    {
        sprite_index = spr_player_idle_right;
    }
    if (keyboard_lastkey == vk_right)
    {
        sprite_index = spr_player_idle_left;
    }
}


//idle animation
if (keyboard_check_released(vk_right))
{
    sprite_index = spr_player_idle_right;
}

if (keyboard_check_released(vk_left))
{
    sprite_index = spr_player_idle_left;
}

//horizontal collision
if (place_meeting(x+hsp,y,obj_wall))
{
   while(!place_meeting(x+sign(hsp),y,obj_wall))
   {
    x += sign(hsp);
   }
   hsp = 0.0;
}
x += hsp;

if (place_meeting(x,y+vsp,obj_wall))
{
   while(!place_meeting(x,y+sign(vsp),obj_wall))
   {
    y += sign(vsp);
   }
   vsp = 0.0;
}
y += vsp;

if (vsp != 0)
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
else
{
    if (keyboard_check_released(vk_right))
    {
        sprite_index = spr_player_idle_right;
    }
    if (keyboard_check_released(vk_left))
    {
        sprite_index = spr_player_idle_left;
    }
}
if (y > room_height)
{
    instance_destroy();
    scr_death();
}
