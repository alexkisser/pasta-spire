//step event for obj_block
with(obj_player)
{
	if place_meeting(x, bbox_top, other) and vsp < 0
	{
		vsp = 0
		instance_destroy(other)
	}
	else if place_meeting(x,bbox_bottom,other) and vsp > 0 and pound
	{
		vsp = 0
		instance_destroy(other)
	}
}