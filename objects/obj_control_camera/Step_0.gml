xOffset = camera_get_view_width(view_camera[0]) / 2;
yOffset = camera_get_view_height(view_camera[0]) / 2;

x += target.x - x - xOffset // * sp; //multiplying by sp causes a "lazy camera"
y += target.y - y - yOffset // * sp;

// Clamp the camera position to prevent showing areas outside the room boundaries
x = clamp(x, 0, room_width - xOffset);
y = clamp(y, 0, room_height - yOffset);

camera_set_view_pos(view_camera[0],x,y)
