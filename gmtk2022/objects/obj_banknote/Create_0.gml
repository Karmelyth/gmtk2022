
bounciness = .8
gravity_base = .2
target_direction = irandom_range(10, 30) * choose(-1, 1);
target_direction = clamp(target_direction, 270 - 45, 270 + 45)
gravity = gravity_base
friction = .2
hit_timer = 0;
maxspeed = 12
maxspeed_deviation = random_range(1, 1.5);
image_speed = random_range(.8, 1.2);
landed = false;
fade = round(room_speed);
value = 80;