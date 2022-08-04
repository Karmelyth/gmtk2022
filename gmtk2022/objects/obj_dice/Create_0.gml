bounciness = .8
//Was .25, changed when removing friction
gravity_base = .26
gravity = gravity_base
//friction = .03
maxspeed = 14
max_fallspeed = 7;
extraspeed = 0;
hit_timer = 10;
damage = 1;
image_speed = 3;
alarm[0] = 10
landed = false;
touchedBottom = false;
nograv = false;

patience_enable = true;
last_bounce_coords = [x,y];
last_bounce_patience = 16;
last_bounce_patience_frame = current_time;
portal = -4;
launcher = -4;
canmove = true;