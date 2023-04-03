/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if(place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -10;
	
	sprite_index = s_playerJ;
	image_speed = 1;
}

if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
	
}
x = x + hsp;

if(place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

if(hsp < 0)
{
 image_xscale = -.08;
}
else if(hsp > 0)
{
image_xscale = .08;
}
if(hsp != 0)
{
	sprite_index = s_playerR;
	image_speed = 1;
}

else if(hsp = 0 && vsp = 0)
{
	sprite_index = s_player;
	image_speed = 1;
}
else if(vsp != 0)
{
	sprite_index = s_playerJ;
	image_speed = 1;
}