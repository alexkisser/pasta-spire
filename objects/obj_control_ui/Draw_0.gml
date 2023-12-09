//needs to be calculated in the draw event to prevent the TV floating
xTele = obj_control_camera.x+400
yTele = obj_control_camera.y+12

if obj_player.taunt
{
	draw_sprite(spr_tv_frame_taunt, 0, xTele, yTele)
}
else
{
	draw_sprite(spr_tv_frame_idle, 0, xTele, yTele)
}

draw_sprite(spr_tv_frame, 0, xTele, yTele)