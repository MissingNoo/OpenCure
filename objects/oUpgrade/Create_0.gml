upg=global.null;
sprite_index=upg[?"sprite"];
speed=upg[?"speed"];
atk=upg[?"dmg"];
hits=upg[?"hits"];
a=0;
atk = oPlayer.atk;
hits=0;
if (upg[?"speed"] == 0) {
    switch (global.arrow_dir) {
            case 90:
                x = x + 32;
                break;
            case -90:
                x = x - 32;
                image_xscale = -1;
                break;
            case 0:
                y = y + 32;
                image_angle = point_direction(x, y, x, y + 90);
                break;
            case 180:
                y = y - 32;
                image_angle = point_direction(x, y, x, y - 90);
                break;
        }
}
