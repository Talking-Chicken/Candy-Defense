/// @description Insert description here
// You can write your code in this editor
atk = obj_unit_collector.atk_list[|type] + atk_powerUp;
fire_rate = obj_unit_collector.fire_rate_list[|type] - fire_rate_powerUp;
range = obj_unit_collector.range_list[|type] + rangeUp;
sp = min(obj_unit_collector.sp_list[|type] + spUp, 50);