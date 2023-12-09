if obj_control_input.rightHold
{
	if hsp < spWalkMax
	{
		hsp += acc;
	}
}
else if obj_control_input.leftHold
{
	if hsp > -spWalkMax
	{
		hsp -= acc;
	}
}

if obj_control_input.downHold
{
	if !place_meeting(x,y+vsp,obj_parent_solid) //in the air
	{
		pound = true
	}
	else
	{
		pound = false
	}
}
if place_meeting(x,y+vsp,obj_parent_solid) //on the ground
{
	pound = false
}
//set taunt to true if pressing the taunt button
if obj_control_input.tauntPress
{
	taunt = true;
}
else
{
	taunt = false;
}

//set white start to visible if taunting
if instance_exists(obj_star)
{
	if taunt
	{
		obj_star.visible = true;
	}
	else 
	{
		obj_star.visible = false;
	}
}

if taunt //if taunting
{
	// depth needs to be set to be above everything else temporarily when taunting to not get cut off by the ground
	depth = -9999
	star.depth = -9999 + 1
}
else if !taunt // if not taunting
{
	//reset depth to the initial values from the create event when not taunting
	depth = depthInitial
	star.depth = depthInitial + 1
	//move player if hsp is positive (right) or negative (left)
	if sign(hsp) == 1
	{
		if hsp > 0 //greater than 0 
		{
			hsp -= fric;
		}
	}
	else if sign(hsp) == -1
	{
		if hsp < 0
		{
			hsp += fric;
		}
	}

	// safety checks for small values
	if abs(hsp) < 0.1 // Add a small threshold to consider close-to-zero values as zero
	{ 
	    hsp = 0;
	}
	if abs(vsp) < 0.1 // Add a small threshold to consider close-to-zero values as zero
	{ 
	    vsp = 0;
	}
	if vsp < 10
	{
		vsp += grav
	}

	//jumping
	if place_meeting(x, y + 1, obj_parent_solid)
	{
		vsp = jump
	}
	jump = obj_control_input.jumpPress * spJump

	if place_meeting(x + hsp, y, obj_parent_solid) //horizontal stop
	{
		hsp = 0;
	}
	if place_meeting(x, y + vsp, obj_parent_solid) //vertical stop
	{
		vsp = 0;
	}

	//check if moving because positive or negative hsp means moving, while 0 hsp means still
	if sign(hsp) != 0
	{
		sprite_index = spr_player_run;
		//flip the player sprite based on if he's moving left or right
		if sign(hsp) == 1
		{
			image_xscale = -1;
		}
		else if sign(hsp) == -1
		{
			image_xscale = 1;
		}
	}
	else
	{
		sprite_index = spr_player_idle;
	}
	//actually move your character after all other calculations have been done
	x += hsp
	y += vsp
}

if place_meeting(x,y,obj_env_portal) and !switchTeleport
{
	switchTeleport = true;
	if room == rm_level_hub_floor_1
	{
		room = rm_level_two
	}
	else if room == rm_level_two
	{
		room = rm_level_hub_floor_1
	}
}
 if !place_meeting(x, y, obj_env_portal)
 {
	switchTeleport = false;
 }
 //obj_player step event at the END before the if pound code
if place_meeting(x, bbox_top + vsp, obj_spawner_stone) and toggleBlockSpawn
{
	var target = instance_place(x, bbox_top + vsp, obj_spawner_stone)
	with target
	{
		instance_create_depth(x, y, depth, obj_enemy_stone)
		other.toggleBlockSpawn = false
	}
}
else if !place_meeting(x, bbox_top + vsp, obj_spawner_stone) and !toggleBlockSpawn
{
	toggleBlockSpawn = true
}
 //very bottom of the step event
if pound
{
	sprite_index = spr_player_pound
}
//very bottom of the step event for the player
if obj_control_input.runHold and !place_meeting(x+hsp, y, obj_parent_solid)
{
	if machTimer != machTimerMax
	{
		machTimer++
	}
	else
	{
		machTimer = 0
		if spWalkMax <= 6
		{
			spWalkMax += 2
		}
	}
}
else if (obj_control_input.runHold and place_meeting(x+hsp, y, obj_parent_solid)) or !obj_control_input.runHold
{
	spWalkMax = 2 //reset
}