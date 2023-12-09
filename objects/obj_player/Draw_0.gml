//draw event of the player
draw_self()
if abs(spWalkMax) >= 4
{
	if machFireFrameTimer != machFireFrameTimerMax
	{
		machFireFrameTimer++
	}
	else 
	{
		if machFireFrame == 0
		{
			machFireFrame = 1
		}
		else if machFireFrame == 1
		{
			machFireFrame = 0
		}
		machFireFrameTimer = 0
	}
	draw_sprite_ext(spr_machFire_1,machFireFrame,x,y,sign(-hsp),1,0,c_white,0.6)
}