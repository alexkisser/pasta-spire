//step event for totem
if place_meeting(x,y-1,obj_player) and stompToggle and obj_player.pound
{
	stompToggle = false
	y += 16
}
else if !place_meeting(x,y,obj_player) and !stompToggle
{
	stompToggle = true
}

if instance_exists(obj_player)
{
	var angle = point_direction(x,y,obj_player.x,obj_player.y)
	show_debug_message(angle)
	if angle < 45 or angle > 270
	{
		image_index = 2 //actually third frame
	}
	else if angle < 135 and angle >= 45
	{
		if obj_player.pound
		{
			image_index = 3 //actually second frame
		}
		else
		{
			image_index = 1
		}
	}
	else if angle >= 135 and angle <= 270
	{
		image_index = 0 // actually first frame
	}
}
if y == ystart + 32 //needs toggle
{
	obj_control_main.pizzaTime = true
}