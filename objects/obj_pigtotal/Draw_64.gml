draw_sprite(spr_pigtotal, -1, 860, 440)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_text(860, 440, string((global.pigtotal - global.pigreduction)))

