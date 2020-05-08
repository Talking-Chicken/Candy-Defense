// creating a ds list of unit that is corrosponding to card's type
units = ds_list_create();

ds_list_add(units, obj_unit_arrow); //0
ds_list_add(units, obj_unit_stone); //1
ds_list_add(units, obj_unit_atkUp); //2
ds_list_add(units, obj_unit_fire_rateUp); //3
ds_list_add(units, obj_unit_rangeUp); //4
ds_list_add(units, obj_unit_spUp); //5
ds_list_add(units, obj_unit_sniper); //6

//atk list
atk_list = ds_list_create();

ds_list_add(atk_list, 20); //0
ds_list_add(atk_list, 50); //1
ds_list_add(atk_list, 20); //2
ds_list_add(atk_list, 20); //3
ds_list_add(atk_list, 20); //4
ds_list_add(atk_list, 20); //5
ds_list_add(atk_list, 100); //6

//fire rate list
fire_rate_list = ds_list_create();

ds_list_add(fire_rate_list, 40); //0
ds_list_add(fire_rate_list, 80); //1
ds_list_add(fire_rate_list, 40); //2
ds_list_add(fire_rate_list, 40); //3
ds_list_add(fire_rate_list, 40); //4
ds_list_add(fire_rate_list, 40); //5
ds_list_add(fire_rate_list, 110); //6

//range list
range_list = ds_list_create();

ds_list_add(range_list, 500); //0
ds_list_add(range_list, 200); //1
ds_list_add(range_list, 150); //2
ds_list_add(range_list, 200); //3
ds_list_add(range_list, 120); //4
ds_list_add(range_list, 100); //5
ds_list_add(range_list, 800); //6

//speed list
sp_list = ds_list_create();

ds_list_add(sp_list, 10); //0
ds_list_add(sp_list, 30); //1
ds_list_add(sp_list, 10); //2
ds_list_add(sp_list, 10); //3
ds_list_add(sp_list, 10); //4
ds_list_add(sp_list, 10); //5
ds_list_add(sp_list, 25); //6

//ds lists to add all player and enemy units
global.player_chess = ds_list_create();
global.enemy_chess = ds_list_create();

//the current and total enemy on the play board
global.total_enemy_num = 3;
global.current_enemy_num = 0;