upHold = keyboard_check(ord("W"));
downHold =  keyboard_check(ord("S"));
leftHold =  keyboard_check(ord("A"));
rightHold =  keyboard_check(ord("D"));
runHold = keyboard_check(vk_shift)
tauntPress = keyboard_check(ord("X"))

shootPress = keyboard_check_pressed(vk_control)
jumpPress = keyboard_check_pressed(vk_space);

reset = keyboard_check_pressed(vk_f1);
quit = keyboard_check_pressed(vk_escape);

fullscreen = keyboard_check_pressed(vk_f6)

if fullscreen and switchFullscreen
{
	switchFullscreen = false
	window_set_fullscreen(true)
}
else if fullscreen and !switchFullscreen
{
	switchFullscreen = true
	window_set_fullscreen(false)
}

if reset
{
	game_restart();
}
if quit
{
	game_end();
}