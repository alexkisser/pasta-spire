var input = instance_create_depth(x,y,depth,obj_control_input);
var ui = instance_create_depth(x,y,depth,obj_control_ui);
var camera = instance_create_depth(x,y,depth,obj_control_camera);

persistent = true;
input.persistent = true;
ui.persistent = true;
camera.persistent = true;

room = rm_level_hub_floor_1;