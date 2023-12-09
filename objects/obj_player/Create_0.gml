grav = 0.2;
fric = 0.1;
acc = 0.2;
hsp = 0;
vsp = 0;
spJump = -4;
spWalkMax = 2;
taunt = false;
depthInitial = depth;
jump = 0;
toggleBlockSpawn = true;
pound = false;

switchTeleport = false;

mask_index = spr_player_mask;

persistent = true;

obj_control_camera.target = id;

star = instance_create_depth(x,y,depth+1,obj_star)
star.persistent = true;
//create event of obj_player
machTimer = 0;
machTimerMax = 60*2
//create
machFireFrame = 0;
machFireFrameTimer = 0;
machFireFrameTimerMax = 2