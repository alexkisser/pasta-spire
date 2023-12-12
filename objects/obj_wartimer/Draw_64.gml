if (addseconds <= 0)
    draw_set_font(global.wartimerfont1)
else
    draw_set_font(global.wartimerfont2)
var xx = 480
var yy = 540
if (obj_player.y > (room_height - 139))
    draw_set_alpha(0.3)
else
    draw_set_alpha(1)
draw_sprite(spr_wartimer, addseconds > 0, xx, yy)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var t = string(minutes)
if (string_length(t) < 2)
    t = concat("0", minutes)
var q = string(seconds)
if (string_length(q) < 2)
    q = concat("0", seconds)
var x2 = (xx - 34)
var y2 = (yy - 21)
for (var i = 0; i < string_length(t); i++)
    draw_text((x2 + (i * 43)), y2, string_char_at(t, (i + 1)))
x2 = (xx + 48)
for (i = 0; i < string_length(q); i++)
    draw_text((x2 + (i * 43)), y2, string_char_at(q, (i + 1)))
draw_set_alpha(1)

