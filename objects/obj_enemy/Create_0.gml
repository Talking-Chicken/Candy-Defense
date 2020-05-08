hp = 80;
def = 0;
sp = 5;
atk = 5;

hp = hp + global.difficulty*5;
if (room == room1 || room == room0) path_start(path_room0,sp,path_end(),false);
if (room == room2) path_start(path_room2,sp,path_end(),false);
if (room == room3) path_start(path_room3,sp,path_end(),false);
