//lerp to the target x and y, but snap if we're close 
if (abs(x - target_x) > 1) {
	x = lerp(x,target_x,0.2);
	depth = -1000;
}
else {
	x = target_x;
	depth = target_depth;
}
if (abs(y - target_y) > 1) {
	y = lerp(y,target_y,0.2);
	depth = -1000;
}
else {
	y = target_y;
	depth = target_depth;
}

if (face_up) {
	draw_card_sprite();
} else {
	sprite_index = spr_card;
}


//select card in room select
if (room == room_select) {
	//add card
	if (position_meeting(mouse_x,mouse_y,id) && mouse_y < 400) {
		global.card_to_add = id;
	} else if (global.card_to_add == id && !added) {
		global.card_to_add = noone;
	}
	
	if (mouse_check_button(mb_left) && global.card_to_add == id && !added) {
		added = true;
		ds_list_add(global.player_deck, type);
	}


	if (global.card_to_add == id) {
		draw_rectangle(x-2,y-2,x+sprite_width+2,y+sprite_height+2,true);
	}
	
	if (global.card_to_add == id && added) {
		draw_rectangle(x-2,y-2,x+sprite_width+2,y+sprite_height+2,true);
	}
	
	
	
	
	
	//remove card
	if (position_meeting(mouse_x,mouse_y,id) && mouse_y > 400) {
		global.card_to_remove = id;
	} else if (global.card_to_remove == id && !removed) {
		global.card_to_remove = noone;
	}
	
	if (mouse_check_button(mb_left) && global.card_to_remove == id && !removed) {
		removed = true;
		ds_list_delete(global.player_deck, remove_type);
	}


	if (global.card_to_remove == id) {
		draw_set_color(c_red);
		draw_rectangle(x-2,y-2,x+sprite_width+2,y+sprite_height+2,true);
		draw_set_color(c_white);
	}
	
	if (global.card_to_remove == id && removed) {
		draw_set_color(c_red);
		draw_rectangle(x-2,y-2,x+sprite_width+2,y+sprite_height+2,true);
		draw_set_color(c_white);
	}
}

//actually draw it
if (selected) {
	draw_set_alpha(0);
	draw_sprite(sprite_index, image_index, x, y);
	draw_set_alpha(1);
	if (placeable) {
		draw_set_color(c_white);
	} else {
		draw_set_color(c_red);
	}
	draw_sprite(obj_unit_collector.units[|type].sprite_index, image_index,x,y);
	draw_circle(x,y,obj_unit_collector.units[|type].range,true);
	draw_set_color(c_white);
} else {
	draw_sprite(sprite_index, image_index, x, y);
}
