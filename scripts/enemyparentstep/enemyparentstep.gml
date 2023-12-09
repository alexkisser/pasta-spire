if !place_meeting(x+hsp, y, obj_parent_solid)
{
	x += hsp
}
else
{
	var dir = 0 //initialize
	if sign(hsp) == 1 //going right
	{
		dir = 16
	}
	else if sign(hsp) == -1 //going left
	{
		dir = -16
	}
	if !place_meeting(x+dir,y-16,obj_parent_solid) //empty space to the 
	{
		vsp = spJump //jump
	}
	else// if place_meeting(x+dir,y-16,obj_parent_solid)
	{
		hsp = -hsp //reverse direction
	}
}

if !place_meeting(x, y+vsp, obj_parent_solid)
{
	y += vsp
}
else
{
	vsp = 0;
}

if sign(hsp) == 1 //right
{
	image_xscale = 1; //flip
}
else if sign(hsp) == -1
{
	image_xscale = -1; //backwards flip
}

if vsp < 10
{
	vsp += grav
}
//animation
if place_meeting(x,y+1, obj_parent_solid)
{
	if sign(hsp) == 1 or sign(hsp) == -1
	{
		sprite_index = spr_enemy_stone_walk
	}
	else
	{
		sprite_index = spr_enemy_stone_idle
	}
}
else
{
	if sign(vsp) == 1
	{
		sprite_index = spr_enemy_stone_jump
	}
	else if sign(vsp) == -1
	{
		sprite_index = spr_enemy_stone_fall
	}
}