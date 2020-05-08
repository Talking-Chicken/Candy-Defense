event_inherited();

var en = instance_nearest(x,y,obj_enemy);

if (en != noone) {
	if (point_distance(x,y,en.x,en.y) <= range+10) {
			if (timer > 0) {
				timer--;
			} else {
				shooting = true;
				
				var bullet = instance_create_layer(x+20,y+20,"unit",obj_stone);
				bullet.speed = sp;
				bullet.direction = point_direction(x,y,en.x,en.y);
				bullet.atk = max(atk,5);
				timer = max(fire_rate,10);
				bullet.target = en;
				
				audio_play_sound(snd_shoot2,0,false);
			}
			target = en;
			//draw_line(x,y,target.x,target.y);
	} else {
		shooting = false;
		target = noone;
	}
}