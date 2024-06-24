#define live_preinit_api
// Generated at 2018-04-22 19:44:00 (8457ms)
gml_func_add("min(...values:number)",live_script_get_index("__lnc__lf"));
gml_func_add("max(...values:number)",live_script_get_index("__lnc__lf1"));
gml_func_add("choose(...values)",live_script_get_index("__lnc__lf2"));
gml_func_add("script_execute(script:index, ...values)",live_script_get_index("__lnc__lf3"));
gml_func_add(":instance_destroy(...values)",live_script_get_index("__lnc__lf4"));
gml_func_add("gml_pragma(setting, ...)",live_script_get_index("__lnc__lf5"));
gml_func_add("ds_list_set(id,pos,value)",live_script_get_index("__lnc__lf6"));
var l_gmlFuncs="";
var l_gmlVars="";
l_gmlFuncs=("0=is_bool(val)#:"+chr(13)+chr(10)
	+"1=is_real(val)#:"+chr(13)+chr(10)
	+"2=is_string(val)#:"+chr(13)+chr(10)
	+"3=is_array(val)#:"+chr(13)+chr(10)
	+"4=is_undefined(val)#:"+chr(13)+chr(10)
	+"5=is_int32(val)#:"+chr(13)+chr(10)
	+"6=is_int64(val)#:"+chr(13)+chr(10)
	+"7=is_ptr(val)#:"+chr(13)+chr(10)
	+"8=is_vec3(val)#:"+chr(13)+chr(10)
	+"9=is_vec4(val)#:"+chr(13)+chr(10)
	+"10=is_matrix(val)#:"+chr(13)+chr(10)
	+"11=typeof(val)#:"+chr(13)+chr(10)
	+"12=variable_global_exists(name):"+chr(13)+chr(10)
	+"13=variable_global_get(name):"+chr(13)+chr(10)
	+"14=variable_global_set(name,val)"+chr(13)+chr(10)
	+"15=variable_instance_exists(id,name):"+chr(13)+chr(10)
	+"16=variable_instance_get(id,name):"+chr(13)+chr(10)
	+"17=variable_instance_set(id,name,val)"+chr(13)+chr(10)
	+"18=variable_instance_get_names(id):"+chr(13)+chr(10)
	+"19=array_length_1d(value):"+chr(13)+chr(10)
	+"20=array_length_2d(value, index:number):"+chr(13)+chr(10)
	+"21=array_height_2d(value):"+chr(13)+chr(10)
	+"22=array_equals(one, two):"+chr(13)+chr(10)
	+"23=array_create(size:number):"+chr(13)+chr(10)
	+"24=array_copy(dest,dest_index,src,src_index,length)"+chr(13)+chr(10)
	+"25=random(x:number):"+chr(13)+chr(10)
	+"26=random_range(:number,:number):"+chr(13)+chr(10)
	+"27=irandom(x:number):"+chr(13)+chr(10)
	+"28=irandom_range(:number,:number):"+chr(13)+chr(10)
	+"29=random_set_seed(seed)"+chr(13)+chr(10)
	+"30=random_get_seed():"+chr(13)+chr(10)
	+"31=random_use_old_version(trueFalse)"+chr(13)+chr(10)
	+"32=randomize():"+chr(13)+chr(10)
	+"33=abs(x:number)#:"+chr(13)+chr(10)
	+"34=round(x:number)#:"+chr(13)+chr(10)
	+"35=floor(x:number)#:"+chr(13)+chr(10)
	+"36=ceil(x:number)#:"+chr(13)+chr(10)
	+"37=sign(x:number)#:"+chr(13)+chr(10)
	+"38=frac(x:number)#:"+chr(13)+chr(10)
	+"39=sqrt(x:number)#:"+chr(13)+chr(10)
	+"40=sqr(x:number)#:"+chr(13)+chr(10)
	+"41=exp(x:number)#:"+chr(13)+chr(10)
	+"42=ln(x:number)#:"+chr(13)+chr(10)
	+"43=log2(x:number)#:"+chr(13)+chr(10)
	+"44=log10(x:number)#:"+chr(13)+chr(10)
	+"45=sin(radian_angle:number)#:"+chr(13)+chr(10)
	+"46=cos(radian_angle:number)#:"+chr(13)+chr(10)
	+"47=tan(radian_angle:number)#:"+chr(13)+chr(10)
	+"48=arcsin(x:number)#:"+chr(13)+chr(10)
	+"49=arccos(x:number)#:"+chr(13)+chr(10)
	+"50=arctan(x:number)#:"+chr(13)+chr(10)
	+"51=arctan2(y:number, x:number)#:"+chr(13)+chr(10)
	+"52=dsin(degree_angle:number)#:"+chr(13)+chr(10)
	+"53=dcos(degree_angle:number)#:"+chr(13)+chr(10)
	+"54=dtan(degree_angle:number)#:"+chr(13)+chr(10)
	+"55=darcsin(x:number)#:"+chr(13)+chr(10)
	+"56=darccos(x:number)#:"+chr(13)+chr(10)
	+"57=darctan(x:number)#:"+chr(13)+chr(10)
	+"58=darctan2(y:number, x:number)#:"+chr(13)+chr(10)
	+"59=degtorad(x:number)#:"+chr(13)+chr(10)
	+"60=radtodeg(x:number)#:"+chr(13)+chr(10)
	+"61=power(x:number, n:number)#:"+chr(13)+chr(10)
	+"62=logn(n:number, x:number)#:"+chr(13)+chr(10)
	+"63=mean(...)#:"+chr(13)+chr(10)
	+"64=median(...)#:"+chr(13)+chr(10)
	+"65=clamp(val:number, min:number, max:number)#:"+chr(13)+chr(10)
	+"66=lerp(val1:number, val2:number, amount:number)#:"+chr(13)+chr(10)
	+"67=dot_product(x1:number, y1:number, x2:number, y2:number)#:"+chr(13)+chr(10)
	+"68=dot_product_3d(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)#:"+chr(13)+chr(10)
	+"69=dot_product_normalised(x1:number, y1:number, x2:number, y2:number)£#:"+chr(13)+chr(10)
	+"70=dot_product_3d_normalised(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)£#:"+chr(13)+chr(10)
	+"71=math_set_epsilon(new_epsilon)"+chr(13)+chr(10)
	+"72=math_get_epsilon():"+chr(13)+chr(10)
	+"73=angle_difference(src:number, dest:number)#:"+chr(13)+chr(10)
	+"74=point_distance_3d(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number)#:"+chr(13)+chr(10)
	+"75=point_distance(x1:number, y1:number, x2:number, y2:number)#:"+chr(13)+chr(10)
	+"76=point_direction(x1:number, y1:number, x2:number, y2:number)#:"+chr(13)+chr(10)
	+"77=lengthdir_x(len:number, dir:number)#:"+chr(13)+chr(10)
	+"78=lengthdir_y(len:number, dir:number)#:"+chr(13)+chr(10)
	+"79=real(val)#:"+chr(13)+chr(10)
	+"80=string(val)#:"+chr(13)+chr(10)
	+"81=int64(val)#:"+chr(13)+chr(10)
	+"82=ptr(val):"+chr(13)+chr(10)
	+"83=string_format(val:number,total:number,dec:number)#:"+chr(13)+chr(10)
	+"84=chr(val)#:"+chr(13)+chr(10)
	+"85=ansi_char(val)#:"+chr(13)+chr(10)
	+"86=ord(char)#:"+chr(13)+chr(10)
	+"87=string_length(str:string)#:"+chr(13)+chr(10)
	+"88=string_byte_length(str:string)#:"+chr(13)+chr(10)
	+"89=string_pos(substr:string, str:string)#:"+chr(13)+chr(10)
	+"90=string_copy(str:string, index:number, count:number)#:"+chr(13)+chr(10)
	+"91=string_char_at(str:string, index:number)#:"+chr(13)+chr(10)
	+"92=string_ord_at(str:string, index:number)#:"+chr(13)+chr(10)
	+"93=string_byte_at(str:string, index:number)#:"+chr(13)+chr(10)
	+"94=string_set_byte_at(str:string, index:number, val:number)#:"+chr(13)+chr(10)
	+"95=string_delete(str:string, index:number, count:number)#:"+chr(13)+chr(10)
	+"96=string_insert(substr:string, str:string, index:number)#:"+chr(13)+chr(10)
	+"97=string_lower(str:string)#:"+chr(13)+chr(10)
	+"98=string_upper(str:string)#:"+chr(13)+chr(10)
	+"99=string_repeat(str:string, count:number)#:"+chr(13)+chr(10)
	+"100=string_letters(str:string)#:"+chr(13)+chr(10)
	+"101=string_digits(str:string)#:"+chr(13)+chr(10)
	+"102=string_lettersdigits(str:string)#:"+chr(13)+chr(10)
	+"103=string_replace(str:string, substr:string, newstr:string)#:"+chr(13)+chr(10)
	+"104=string_replace_all(str:string, substr:string, newstr:string)#:"+chr(13)+chr(10)
	+"105=string_count(substr:string, str:string)#:"+chr(13)+chr(10)
	+"106=clipboard_has_text():"+chr(13)+chr(10)
	+"107=clipboard_set_text(str)"+chr(13)+chr(10)
	+"108=clipboard_get_text():"+chr(13)+chr(10)
	+"109=date_current_datetime():"+chr(13)+chr(10)
	+"110=date_create_datetime(year,month,day,hour,minute,second):"+chr(13)+chr(10)
	+"111=date_valid_datetime(year,month,day,hour,minute,second):"+chr(13)+chr(10)
	+"112=date_inc_year(date,amount):"+chr(13)+chr(10)
	+"113=date_inc_month(date,amount):"+chr(13)+chr(10)
	+"114=date_inc_week(date,amount):"+chr(13)+chr(10)
	+"115=date_inc_day(date,amount):"+chr(13)+chr(10)
	+"116=date_inc_hour(date,amount):"+chr(13)+chr(10)
	+"117=date_inc_minute(date,amount):"+chr(13)+chr(10)
	+"118=date_inc_second(date,amount):"+chr(13)+chr(10)
	+"119=date_get_year(date):"+chr(13)+chr(10)
	+"120=date_get_month(date):"+chr(13)+chr(10)
	+"121=date_get_week(date):"+chr(13)+chr(10)
	+"122=date_get_day(date):"+chr(13)+chr(10)
	+"123=date_get_hour(date):"+chr(13)+chr(10)
	+"124=date_get_minute(date):"+chr(13)+chr(10)
	+"125=date_get_second(date):"+chr(13)+chr(10)
	+"126=date_get_weekday(date):"+chr(13)+chr(10)
	+"127=date_get_day_of_year(date):"+chr(13)+chr(10)
	+"128=date_get_hour_of_year(date):"+chr(13)+chr(10)
	+"129=date_get_minute_of_year(date):"+chr(13)+chr(10)
	+"130=date_get_second_of_year(date):"+chr(13)+chr(10)
	+"131=date_year_span(date1,date2):"+chr(13)+chr(10)
	+"132=date_month_span(date1,date2):"+chr(13)+chr(10)
	+"133=date_week_span(date1,date2):"+chr(13)+chr(10)
	+"134=date_day_span(date1,date2):"+chr(13)+chr(10)
	+"135=date_hour_span(date1,date2):"+chr(13)+chr(10)
	+"136=date_minute_span(date1,date2):"+chr(13)+chr(10)
	+"137=date_second_span(date1,date2):"+chr(13)+chr(10)
	+"138=date_compare_datetime(date1,date2):"+chr(13)+chr(10)
	+"139=date_compare_date(date1,date2):"+chr(13)+chr(10)
	+"140=date_compare_time(date1,date2):"+chr(13)+chr(10)
	+"141=date_date_of(date):"+chr(13)+chr(10)
	+"142=date_time_of(date):"+chr(13)+chr(10)
	+"143=date_datetime_string(date):"+chr(13)+chr(10)
	+"144=date_date_string(date):"+chr(13)+chr(10)
	+"145=date_time_string(date):"+chr(13)+chr(10)
	+"146=date_days_in_month(date):"+chr(13)+chr(10)
	+"147=date_days_in_year(date):"+chr(13)+chr(10)
	+"148=date_leap_year(date):"+chr(13)+chr(10)
	+"149=date_is_today(date):"+chr(13)+chr(10)
	+"150=date_set_timezone(timezone)"+chr(13)+chr(10)
	+"151=date_get_timezone():"+chr(13)+chr(10)
	+"152=:motion_set(dir:number, speed:number)"+chr(13)+chr(10)
	+"153=:motion_add(dir:number, speed:number)"+chr(13)+chr(10)
	+"154=:place_free(x:number, y:number):"+chr(13)+chr(10)
	+"155=:place_empty(x:number, y:number):"+chr(13)+chr(10)
	+"156=:place_meeting(x:number, y:number, obj:index):"+chr(13)+chr(10)
	+"157=:place_snapped(hsnap:number, vsnap:number):"+chr(13)+chr(10)
	+"158=:move_random(hsnap:number, vsnap:number)"+chr(13)+chr(10)
	+"159=:move_snap(hsnap:number, vsnap:number)"+chr(13)+chr(10)
	+"160=:move_towards_point(x:number, y:number, sp:number)"+chr(13)+chr(10)
	+"161=:move_contact_solid(dir:number, maxdist:number)"+chr(13)+chr(10)
	+"162=:move_contact_all(dir:number, maxdist:number)"+chr(13)+chr(10)
	+"163=:move_outside_solid(dir:number, maxdist:number)"+chr(13)+chr(10)
	+"164=:move_outside_all(dir:number, maxdist:number)"+chr(13)+chr(10)
	+"165=:move_bounce_solid(advanced:bool)"+chr(13)+chr(10)
	+"166=:move_bounce_all(advanced:bool)"+chr(13)+chr(10)
	+"167=:move_wrap(hor:bool, vert:bool, margin:number)"+chr(13)+chr(10)
	+"168=:distance_to_point(x:number, y:number):"+chr(13)+chr(10)
	+"169=:distance_to_object(obj:index):"+chr(13)+chr(10)
	+"170=:position_empty(x:number, y:number):"+chr(13)+chr(10)
	+"171=:position_meeting(x:number, y:number, obj:index):"+chr(13)+chr(10)
	+"172=:path_start(path,speed,endaction,absolute)"+chr(13)+chr(10)
	+"173=:path_end()"+chr(13)+chr(10)
	+"174=:mp_linear_step(x:number,y:number,speed:number,checkall:bool):"+chr(13)+chr(10)
	+"175=:mp_potential_step(x:number,y:number,speed:number,checkall:bool):"+chr(13)+chr(10)
	+"176=:mp_linear_step_object(x:number,y:number,speed:number,obj:index):"+chr(13)+chr(10)
	+"177=:mp_potential_step_object(x:number,y:number,speed:number,obj:index):"+chr(13)+chr(10)
	+"178=:mp_potential_settings(maxrot,rotstep,ahead,onspot)"+chr(13)+chr(10)
	+"179=:mp_linear_path(path:index,x:number,y:number,step:number,checkall:bool):"+chr(13)+chr(10)
	+"180=:mp_potential_path(path:index,x:number,y:number,step:number,factor:number,checkall:bool):"+chr(13)+chr(10)
	+"181=:mp_linear_path_object(path:index,x:number,y:number,step:number,obj:index):"+chr(13)+chr(10)
	+"182=:mp_potential_path_object(path:index,x:number,y:number,step:number,factor:number,obj:index):"+chr(13)+chr(10)
	+"183=mp_grid_create(left,top,hcells,vcells,cellwidth,cellheight):"+chr(13)+chr(10)
	+"184=mp_grid_destroy(id)"+chr(13)+chr(10)
	+"185=mp_grid_clear_all(id)"+chr(13)+chr(10)
	+"186=mp_grid_clear_cell(id,h,v)"+chr(13)+chr(10)
	+"187=mp_grid_clear_rectangle(id,left,top,right,bottom)"+chr(13)+chr(10)
	+"188=mp_grid_add_cell(id,h,v)"+chr(13)+chr(10)
	+"189=mp_grid_get_cell(id,h,v):"+chr(13)+chr(10)
	+"190=mp_grid_add_rectangle(id,left,top,right,bottom)"+chr(13)+chr(10)
	+"191=:mp_grid_add_instances(id,obj,prec)"+chr(13)+chr(10)
	+"192=:mp_grid_path(:index,path:index,xstart:number,ystart:number,xgoal:number,ygoal:number,allowdiag:bool):"+chr(13)+chr(10)
	+"193=mp_grid_draw(id)"+chr(13)+chr(10)
	+"194=mp_grid_to_ds_grid(src,dest)"+chr(13)+chr(10)
	+"195=:collision_point(x:number, y:number, obj:index, prec:bool, notme:bool):"+chr(13)+chr(10)
	+"196=:collision_rectangle(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):"+chr(13)+chr(10)
	+"197=:collision_circle(x1:number, y1:number, radius, obj:index, prec, notme):"+chr(13)+chr(10)
	+"198=:collision_ellipse(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):"+chr(13)+chr(10)
	+"199=:collision_line(x1:number, y1:number, x2:number, y2:number, obj:index, prec, notme):"+chr(13)+chr(10)
	+"200=point_in_rectangle(px, py, x1:number, y1:number, x2:number, y2:number):"+chr(13)+chr(10)
	+"201=point_in_triangle(px, py, x1:number, y1:number, x2:number, y2:number, x3:number, y3:number):"+chr(13)+chr(10)
	+"202=point_in_circle(px, py, cx, cy, rad):"+chr(13)+chr(10)
	+"203=rectangle_in_rectangle(sx1:number, sy1:number, sx2:number, sy2:number, dx1:number, dy1:number, dx2:number, dy2:number):"+chr(13)+chr(10)
	+"204=rectangle_in_triangle(sx1:number, sy1:number, sx2:number, sy2:number, x1:number, y1:number, x2:number, y2:number, x3:number, y3:number):"+chr(13)+chr(10)
	+"205=rectangle_in_circle(sx1:number, sy1:number, sx2:number, sy2:number, cx:number, cy:number, rad:number):"+chr(13)+chr(10)
	+"206=instance_find(obj:index, n:index):"+chr(13)+chr(10)
	+"207=instance_exists(obj:index):"+chr(13)+chr(10)
	+"208=instance_number(obj:index):"+chr(13)+chr(10)
	+"209=instance_position(x:number, y:number, obj:index):"+chr(13)+chr(10)
	+"210=:instance_nearest(x:number, y:number, obj:index):"+chr(13)+chr(10)
	+"211=:instance_furthest(x:number, y:number, obj:index):"+chr(13)+chr(10)
	+"212=:instance_place(x:number, y:number, obj:index):"+chr(13)+chr(10)
	+"213=instance_create(x,y,obj):"+chr(13)+chr(10)
	+"214=:instance_copy(performevent:bool):"+chr(13)+chr(10)
	+"215=:instance_change(obj,performevents)"+chr(13)+chr(10)
	+"216=:position_destroy(x,y)"+chr(13)+chr(10)
	+"217=:position_change(x,y,obj,performevents)"+chr(13)+chr(10)
	+"218=:instance_deactivate_all(notme)"+chr(13)+chr(10)
	+"219=:instance_deactivate_object(obj)"+chr(13)+chr(10)
	+"220=:instance_deactivate_region(left,top,width,height,inside,notme)"+chr(13)+chr(10)
	+"221=:instance_activate_all()"+chr(13)+chr(10)
	+"222=:instance_activate_object(obj)"+chr(13)+chr(10)
	+"223=:instance_activate_region(left,top,width,height,inside)"+chr(13)+chr(10)
	+"224=room_goto(numb)"+chr(13)+chr(10)
	+"225=room_goto_previous()"+chr(13)+chr(10)
	+"226=room_goto_next()"+chr(13)+chr(10)
	+"227=room_previous(numb):"+chr(13)+chr(10)
	+"228=room_next(numb):"+chr(13)+chr(10)
	+"229=room_restart()"+chr(13)+chr(10)
	+"230=game_end()"+chr(13)+chr(10)
	+"231=game_restart()"+chr(13)+chr(10)
	+"232=game_load(filename):"+chr(13)+chr(10)
	+"233=game_save(filename)"+chr(13)+chr(10)
	+"234=game_save_buffer(buffer)"+chr(13)+chr(10)
	+"235=game_load_buffer(buffer):"+chr(13)+chr(10)
	+"236=:event_perform(type,numb)"+chr(13)+chr(10)
	+"237=:event_user(numb)"+chr(13)+chr(10)
	+"238=:event_perform_object(obj,type,numb)"+chr(13)+chr(10)
	+"239=:event_inherited()"+chr(13)+chr(10)
	+"240=show_debug_message(str)"+chr(13)+chr(10)
	+"241=show_debug_overlay(bool)"+chr(13)+chr(10)
	+"242=:alarm_get(:index):"+chr(13)+chr(10)
	+"243=:alarm_set(:index, value:number)"+chr(13)+chr(10)
	+"244=keyboard_set_map(key1,key2)"+chr(13)+chr(10)
	+"245=keyboard_get_map(key):"+chr(13)+chr(10)
	+"246=keyboard_unset_map()"+chr(13)+chr(10)
	+"247=keyboard_check(key:index):"+chr(13)+chr(10)
	+"248=keyboard_check_pressed(key:index):"+chr(13)+chr(10)
	+"249=keyboard_check_released(key:index):"+chr(13)+chr(10)
	+"250=keyboard_check_direct(key:index):"+chr(13)+chr(10)
	+"251=keyboard_get_numlock():"+chr(13)+chr(10)
	+"252=keyboard_set_numlock(bool)"+chr(13)+chr(10)
	+"253=keyboard_key_press(key)"+chr(13)+chr(10)
	+"254=keyboard_key_release(key)"+chr(13)+chr(10)
	+"255=keyboard_clear(key:index)"+chr(13)+chr(10)
	+"256=io_clear()"+chr(13)+chr(10)
	+"257=browser_input_capture(enable)"+chr(13)+chr(10)
	+"258=mouse_check_button(button:index):"+chr(13)+chr(10)
	+"259=mouse_check_button_pressed(button:index):"+chr(13)+chr(10)
	+"260=mouse_check_button_released(button:index):"+chr(13)+chr(10)
	+"261=mouse_wheel_up():"+chr(13)+chr(10)
	+"262=mouse_wheel_down():"+chr(13)+chr(10)
	+"263=mouse_clear(button)"+chr(13)+chr(10)
	+"264=joystick_exists(id):"+chr(13)+chr(10)
	+"265=joystick_direction(id)"+chr(13)+chr(10)
	+"266=joystick_name(id)"+chr(13)+chr(10)
	+"267=joystick_axes(id)"+chr(13)+chr(10)
	+"268=joystick_buttons(id)"+chr(13)+chr(10)
	+"269=joystick_has_pov(id)"+chr(13)+chr(10)
	+"270=joystick_check_button(id,button)"+chr(13)+chr(10)
	+"271=joystick_xpos(id)"+chr(13)+chr(10)
	+"272=joystick_ypos(id)"+chr(13)+chr(10)
	+"273=joystick_zpos(id)"+chr(13)+chr(10)
	+"274=joystick_rpos(id)"+chr(13)+chr(10)
	+"275=joystick_upos(id)"+chr(13)+chr(10)
	+"276=joystick_vpos(id)"+chr(13)+chr(10)
	+"277=joystick_pov(id)"+chr(13)+chr(10)
	+"278=:draw_self()"+chr(13)+chr(10)
	+"279=:draw_sprite(sprite,subimg,x,y)"+chr(13)+chr(10)
	+"280=:draw_sprite_pos(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,alpha)"+chr(13)+chr(10)
	+"281=:draw_sprite_ext(sprite,subimg,x,y,xscale,yscale,rot,colour,alpha)"+chr(13)+chr(10)
	+"282=:draw_sprite_stretched(sprite,subimg,x,y,w,h)"+chr(13)+chr(10)
	+"283=:draw_sprite_stretched_ext(sprite,subimg,x,y,w,h,colour,alpha)"+chr(13)+chr(10)
	+"284=:draw_sprite_tiled(sprite,subimg,x,y)"+chr(13)+chr(10)
	+"285=:draw_sprite_tiled_ext(sprite,subimg,x,y,xscale,yscale,colour,alpha)"+chr(13)+chr(10)
	+"286=:draw_sprite_part(sprite,subimg,left,top,width,height,x,y)"+chr(13)+chr(10)
	+"287=:draw_sprite_part_ext(sprite,subimg,left,top,width,height,x,y,xscale,yscale,colour,alpha)"+chr(13)+chr(10)
	+"288=:draw_sprite_general(sprite,subimg,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"289=draw_background(back,x,y)"+chr(13)+chr(10)
	+"290=draw_background_ext(back,x,y,xscale,yscale,rot,colour,alpha)"+chr(13)+chr(10)
	+"291=draw_background_stretched(back,x,y,w,h)"+chr(13)+chr(10)
	+"292=draw_background_stretched_ext(back,x,y,w,h,colour,alpha)"+chr(13)+chr(10)
	+"293=draw_background_tiled(back,x,y)"+chr(13)+chr(10)
	+"294=draw_background_tiled_ext(back,x,y,xscale,yscale,colour,alpha)"+chr(13)+chr(10)
	+"295=draw_background_part(back,left,top,width,height,x,y)"+chr(13)+chr(10)
	+"296=draw_background_part_ext(back,left,top,width,height,x,y,xscale,yscale,colour,alpha)"+chr(13)+chr(10)
	+"297=draw_background_general(back,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"298=draw_clear(col)"+chr(13)+chr(10)
	+"299=draw_clear_alpha(col,alpha)"+chr(13)+chr(10)
	+"300=draw_point(x,y)"+chr(13)+chr(10)
	+"301=draw_line(x1,y1,x2,y2)"+chr(13)+chr(10)
	+"302=draw_line_width(x1,y1,x2,y2,w)"+chr(13)+chr(10)
	+"303=draw_rectangle(x1,y1,x2,y2,outline)"+chr(13)+chr(10)
	+"304=draw_roundrect(x1,y1,x2,y2,outline)"+chr(13)+chr(10)
	+"305=draw_roundrect_ext(x1,y1,x2,y2,radiusx,radiusy,outline)"+chr(13)+chr(10)
	+"306=draw_triangle(x1,y1,x2,y2,x3,y3,outline)"+chr(13)+chr(10)
	+"307=draw_circle(x,y,r,outline)"+chr(13)+chr(10)
	+"308=draw_ellipse(x1,y1,x2,y2,outline)"+chr(13)+chr(10)
	+"309=draw_set_circle_precision(precision)"+chr(13)+chr(10)
	+"310=draw_arrow(x1,y1,x2,y2,size)"+chr(13)+chr(10)
	+"311=draw_button(x1,y1,x2,y2,up)"+chr(13)+chr(10)
	+"312=draw_path(path,x,y,absolute)"+chr(13)+chr(10)
	+"313=draw_healthbar(x1,y1,x2,y2,amount,backcol,mincol,maxcol,direction,showback,showborder)"+chr(13)+chr(10)
	+"314=draw_getpixel(x,y):"+chr(13)+chr(10)
	+"315=draw_getpixel_ext(x,y):"+chr(13)+chr(10)
	+"316=draw_set_colour(:color)"+chr(13)+chr(10)
	+"316=draw_set_color(:color)"+chr(13)+chr(10)
	+"317=draw_set_alpha(alpha:number)"+chr(13)+chr(10)
	+"318=draw_get_colour():"+chr(13)+chr(10)
	+"318=draw_get_color():"+chr(13)+chr(10)
	+"319=draw_get_alpha():"+chr(13)+chr(10)
	+"320=make_colour_rgb(red:number, green:number, blue:number)#:"+chr(13)+chr(10)
	+"320=make_color_rgb(red:number, green:number, blue:number)#:"+chr(13)+chr(10)
	+"321=make_colour_hsv(hue:number, saturation:number, value:number)#:"+chr(13)+chr(10)
	+"321=make_color_hsv(hue:number, saturation:number, value:number)#:"+chr(13)+chr(10)
	+"322=colour_get_red(col)#:"+chr(13)+chr(10)
	+"322=color_get_red(col)#:"+chr(13)+chr(10)
	+"323=colour_get_green(col)#:"+chr(13)+chr(10)
	+"323=color_get_green(col)#:"+chr(13)+chr(10)
	+"324=colour_get_blue(col)#:"+chr(13)+chr(10)
	+"324=color_get_blue(col)#:"+chr(13)+chr(10)
	+"325=colour_get_hue(col)#:"+chr(13)+chr(10)
	+"325=color_get_hue(col)#:"+chr(13)+chr(10)
	+"326=colour_get_saturation(col)#:"+chr(13)+chr(10)
	+"326=color_get_saturation(col)#:"+chr(13)+chr(10)
	+"327=colour_get_value(col)#:"+chr(13)+chr(10)
	+"327=color_get_value(col)#:"+chr(13)+chr(10)
	+"328=merge_colour(col1, col2, amount:number)#:"+chr(13)+chr(10)
	+"328=merge_color(col1, col2, amount:number)#:"+chr(13)+chr(10)
	+"329=screen_save(fname)"+chr(13)+chr(10)
	+"330=screen_save_part(fname,x,y,w,h)"+chr(13)+chr(10)
	+"331=draw_set_font(:font)"+chr(13)+chr(10)
	+"332=draw_set_halign(halign:int)"+chr(13)+chr(10)
	+"333=draw_set_valign(valign:int)"+chr(13)+chr(10)
	+"334=draw_text(x,y,string)"+chr(13)+chr(10)
	+"335=draw_text_ext(x,y,string,sep,w)"+chr(13)+chr(10)
	+"336=string_width(:string):"+chr(13)+chr(10)
	+"337=string_height(:string):"+chr(13)+chr(10)
	+"338=string_width_ext(string:string, sep:number, w:number):"+chr(13)+chr(10)
	+"339=string_height_ext(string:string, sep:number, w:number):"+chr(13)+chr(10)
	+"340=draw_text_transformed(x,y,string,xscale,yscale,angle)"+chr(13)+chr(10)
	+"341=draw_text_ext_transformed(x,y,string,sep,w,xscale,yscale,angle)"+chr(13)+chr(10)
	+"342=draw_text_colour(x,y,string,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"342=draw_text_color(x,y,string,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"343=draw_text_ext_colour(x,y,string,sep,w,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"343=draw_text_ext_color(x,y,string,sep,w,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"344=draw_text_transformed_colour(x,y,string,xscale,yscale,angle,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"344=draw_text_transformed_color(x,y,string,xscale,yscale,angle,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"345=draw_text_ext_transformed_colour(x,y,string,sep,w,xscale,yscale,angle,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"345=draw_text_ext_transformed_color(x,y,string,sep,w,xscale,yscale,angle,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"346=draw_point_colour(x,y,col1)"+chr(13)+chr(10)
	+"346=draw_point_color(x,y,col1)"+chr(13)+chr(10)
	+"347=draw_line_colour(x1,y1,x2,y2,col1,col2)"+chr(13)+chr(10)
	+"347=draw_line_color(x1,y1,x2,y2,col1,col2)"+chr(13)+chr(10)
	+"348=draw_line_width_colour(x1,y1,x2,y2,w,col1,col2)"+chr(13)+chr(10)
	+"348=draw_line_width_color(x1,y1,x2,y2,w,col1,col2)"+chr(13)+chr(10)
	+"349=draw_rectangle_colour(x1,y1,x2,y2,col1,col2,col3,col4,outline)"+chr(13)+chr(10)
	+"349=draw_rectangle_color(x1,y1,x2,y2,col1,col2,col3,col4,outline)"+chr(13)+chr(10)
	+"350=draw_roundrect_colour(x1,y1,x2,y2,col1,col2,outline)"+chr(13)+chr(10)
	+"350=draw_roundrect_color(x1,y1,x2,y2,col1,col2,outline)"+chr(13)+chr(10)
	+"351=draw_roundrect_colour_ext(x1,y1,x2,y2,radiusx,radiusy,col1,col2,outline)"+chr(13)+chr(10)
	+"351=draw_roundrect_color_ext(x1,y1,x2,y2,radiusx,radiusy,col1,col2,outline)"+chr(13)+chr(10)
	+"352=draw_triangle_colour(x1,y1,x2,y2,x3,y3,col1,col2,col3,outline)"+chr(13)+chr(10)
	+"352=draw_triangle_color(x1,y1,x2,y2,x3,y3,col1,col2,col3,outline)"+chr(13)+chr(10)
	+"353=draw_circle_colour(x,y,r,col1,col2,outline)"+chr(13)+chr(10)
	+"353=draw_circle_color(x,y,r,col1,col2,outline)"+chr(13)+chr(10)
	+"354=draw_ellipse_colour(x1,y1,x2,y2,col1,col2,outline)"+chr(13)+chr(10)
	+"354=draw_ellipse_color(x1,y1,x2,y2,col1,col2,outline)"+chr(13)+chr(10)
	+"355=draw_primitive_begin(kind)"+chr(13)+chr(10)
	+"356=draw_vertex(x,y)"+chr(13)+chr(10)
	+"357=draw_vertex_colour(x,y,col,alpha)"+chr(13)+chr(10)
	+"357=draw_vertex_color(x,y,col,alpha)"+chr(13)+chr(10)
	+"358=draw_primitive_end()"+chr(13)+chr(10)
	+"359=sprite_get_uvs(spr:index, subimg:number):"+chr(13)+chr(10)
	+"360=background_get_uvs(back):"+chr(13)+chr(10)
	+"361=font_get_uvs(font:index):"+chr(13)+chr(10)
	+"362=sprite_get_texture(spr:index, subimg:number):"+chr(13)+chr(10)
	+"363=background_get_texture(back):"+chr(13)+chr(10)
	+"364=font_get_texture(font:index):"+chr(13)+chr(10)
	+"365=texture_get_width(texid):"+chr(13)+chr(10)
	+"366=texture_get_height(texid):"+chr(13)+chr(10)
	+"367=draw_primitive_begin_texture(kind,texid)"+chr(13)+chr(10)
	+"368=draw_vertex_texture(x,y,xtex,ytex)"+chr(13)+chr(10)
	+"369=draw_vertex_texture_colour(x,y,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"369=draw_vertex_texture_color(x,y,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"370=texture_set_interpolation(linear)"+chr(13)+chr(10)
	+"371=texture_set_interpolation_ext(sampler_id,linear)"+chr(13)+chr(10)
	+"372=texture_set_blending(blend)"+chr(13)+chr(10)
	+"373=texture_set_repeat(repeat)"+chr(13)+chr(10)
	+"374=texture_set_repeat_ext(sampler_id,repeat)"+chr(13)+chr(10)
	+"375=texture_global_scale(pow2integer)"+chr(13)+chr(10)
	+"376=draw_set_blend_mode(mode)"+chr(13)+chr(10)
	+"377=draw_set_blend_mode_ext(src,dest)"+chr(13)+chr(10)
	+"378=draw_set_colour_write_enable(red,green,blue,alpha)"+chr(13)+chr(10)
	+"378=draw_set_color_write_enable(red,green,blue,alpha)"+chr(13)+chr(10)
	+"379=draw_set_alpha_test(enable)"+chr(13)+chr(10)
	+"380=draw_set_alpha_test_ref_value(value)"+chr(13)+chr(10)
	+"381=draw_get_alpha_test():"+chr(13)+chr(10)
	+"382=draw_get_alpha_test_ref_value():"+chr(13)+chr(10)
	+"383=surface_create(w,h):"+chr(13)+chr(10)
	+"384=surface_create_ext(name,w,h):"+chr(13)+chr(10)
	+"385=surface_resize(id,width,height)"+chr(13)+chr(10)
	+"386=surface_free(id)"+chr(13)+chr(10)
	+"387=surface_exists(id):"+chr(13)+chr(10)
	+"388=surface_get_width(id):"+chr(13)+chr(10)
	+"389=surface_get_height(id):"+chr(13)+chr(10)
	+"390=surface_get_texture(id):"+chr(13)+chr(10)
	+"391=surface_set_target(id)"+chr(13)+chr(10)
	+"392=surface_set_target_ext(index,id)"+chr(13)+chr(10)
	+"393=surface_reset_target()"+chr(13)+chr(10)
	+"394=draw_surface(id,x,y)"+chr(13)+chr(10)
	+"395=draw_surface_stretched(id,x,y,w,h)"+chr(13)+chr(10)
	+"396=draw_surface_tiled(id,x,y)"+chr(13)+chr(10)
	+"397=draw_surface_part(id,left,top,width,height,x,y)"+chr(13)+chr(10)
	+"398=draw_surface_ext(id,x,y,xscale,yscale,rot,colour,alpha)"+chr(13)+chr(10)
	+"399=draw_surface_stretched_ext(id,x,y,w,h,colour,alpha)"+chr(13)+chr(10)
	+"400=draw_surface_tiled_ext(id,x,y,xscale,yscale,colour,alpha)"+chr(13)+chr(10)
	+"401=draw_surface_part_ext(id,left,top,width,height,x,y,xscale,yscale,colour,alpha)"+chr(13)+chr(10)
	+"402=draw_surface_general(id,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)"+chr(13)+chr(10)
	+"403=surface_getpixel(id,x,y):"+chr(13)+chr(10)
	+"404=surface_getpixel_ext(id,x,y):"+chr(13)+chr(10)
	+"405=surface_save(id,fname)"+chr(13)+chr(10)
	+"406=surface_save_part(id,fname,x,y,w,h)"+chr(13)+chr(10)
	+"407=surface_copy(destination,x,y,source)"+chr(13)+chr(10)
	+"408=surface_copy_part(destination,x,y,source,xs,ys,ws,hs)"+chr(13)+chr(10)
	+"409=application_surface_draw_enable(on_off)"+chr(13)+chr(10)
	+"410=application_get_position():"+chr(13)+chr(10)
	+"411=application_surface_enable(enable)"+chr(13)+chr(10)
	+"412=application_surface_is_enabled():"+chr(13)+chr(10)
	+"413=tile_add(background,left,top,width,height,x,y,depth)"+chr(13)+chr(10)
	+"414=tile_get_count():"+chr(13)+chr(10)
	+"415=tile_get_id(index):"+chr(13)+chr(10)
	+"416=tile_get_ids():"+chr(13)+chr(10)
	+"417=tile_get_ids_at_depth(depth):"+chr(13)+chr(10)
	+"418=tile_delete(id)"+chr(13)+chr(10)
	+"419=tile_exists(id):"+chr(13)+chr(10)
	+"420=tile_get_x(id):"+chr(13)+chr(10)
	+"421=tile_get_y(id):"+chr(13)+chr(10)
	+"422=tile_get_left(id):"+chr(13)+chr(10)
	+"423=tile_get_top(id):"+chr(13)+chr(10)
	+"424=tile_get_width(id):"+chr(13)+chr(10)
	+"425=tile_get_height(id):"+chr(13)+chr(10)
	+"426=tile_get_depth(id):"+chr(13)+chr(10)
	+"427=tile_get_visible(id):"+chr(13)+chr(10)
	+"428=tile_get_xscale(id):"+chr(13)+chr(10)
	+"429=tile_get_yscale(id):"+chr(13)+chr(10)
	+"430=tile_get_background(id):"+chr(13)+chr(10)
	+"431=tile_get_blend(id):"+chr(13)+chr(10)
	+"432=tile_get_alpha(id):"+chr(13)+chr(10)
	+"433=tile_set_position(id,x,y)"+chr(13)+chr(10)
	+"434=tile_set_region(id,left,top,width,height)"+chr(13)+chr(10)
	+"435=tile_set_background(id,background)"+chr(13)+chr(10)
	+"436=tile_set_visible(id,visible)"+chr(13)+chr(10)
	+"437=tile_set_depth(id,depth)"+chr(13)+chr(10)
	+"438=tile_set_scale(id,xscale,yscale)"+chr(13)+chr(10)
	+"439=tile_set_blend(id,colour)"+chr(13)+chr(10)
	+"440=tile_set_alpha(id,alpha)"+chr(13)+chr(10)
	+"441=tile_layer_hide(depth)"+chr(13)+chr(10)
	+"442=tile_layer_show(depth)"+chr(13)+chr(10)
	+"443=tile_layer_delete(depth)"+chr(13)+chr(10)
	+"444=tile_layer_shift(depth,x,y)"+chr(13)+chr(10)
	+"445=tile_layer_find(depth,x,y):"+chr(13)+chr(10)
	+"446=tile_layer_delete_at(depth,x,y)"+chr(13)+chr(10)
	+"447=tile_layer_depth(depth,newdepth)"+chr(13)+chr(10)
	+"448=display_get_width():"+chr(13)+chr(10)
	+"449=display_get_height():"+chr(13)+chr(10)
	+"450=display_get_orientation():"+chr(13)+chr(10)
	+"451=display_get_gui_width():"+chr(13)+chr(10)
	+"452=display_get_gui_height():"+chr(13)+chr(10)
	+"453=display_reset(aa, vsync):"+chr(13)+chr(10)
	+"454=display_mouse_get_x():"+chr(13)+chr(10)
	+"455=display_mouse_get_y():"+chr(13)+chr(10)
	+"456=display_mouse_set(x,y)"+chr(13)+chr(10)
	+"457=display_get_windows_vertex_buffer_method():"+chr(13)+chr(10)
	+"458=display_get_windows_alternate_sync():"+chr(13)+chr(10)
	+"459=display_set_windows_vertex_buffer_method(method)"+chr(13)+chr(10)
	+"460=display_set_windows_alternate_sync(enable)"+chr(13)+chr(10)
	+"461=display_set_ui_visibility(flags)"+chr(13)+chr(10)
	+"462=window_set_fullscreen(full)"+chr(13)+chr(10)
	+"463=window_get_fullscreen():"+chr(13)+chr(10)
	+"464=window_set_caption(caption)"+chr(13)+chr(10)
	+"465=window_set_min_width(minwidth)"+chr(13)+chr(10)
	+"466=window_set_max_width(maxwidth)"+chr(13)+chr(10)
	+"467=window_set_min_height(minheight)"+chr(13)+chr(10)
	+"468=window_set_max_height(maxheight)"+chr(13)+chr(10)
	+"469=window_get_visible_rects(startx,starty,eendx,endy):"+chr(13)+chr(10)
	+"470=window_get_caption():"+chr(13)+chr(10)
	+"471=window_set_cursor(curs)"+chr(13)+chr(10)
	+"472=window_get_cursor():"+chr(13)+chr(10)
	+"473=window_set_colour(colour)"+chr(13)+chr(10)
	+"473=window_set_color(colour)"+chr(13)+chr(10)
	+"474=window_get_colour():"+chr(13)+chr(10)
	+"474=window_get_color():"+chr(13)+chr(10)
	+"475=window_set_position(x,y)"+chr(13)+chr(10)
	+"476=window_set_size(w,h)"+chr(13)+chr(10)
	+"477=window_set_rectangle(x,y,w,h)"+chr(13)+chr(10)
	+"478=window_center()"+chr(13)+chr(10)
	+"479=window_get_x():"+chr(13)+chr(10)
	+"480=window_get_y():"+chr(13)+chr(10)
	+"481=window_get_width():"+chr(13)+chr(10)
	+"482=window_get_height():"+chr(13)+chr(10)
	+"483=window_mouse_get_x():"+chr(13)+chr(10)
	+"484=window_mouse_get_y():"+chr(13)+chr(10)
	+"485=window_mouse_set(x,y)"+chr(13)+chr(10)
	+"486=window_view_mouse_get_x(id):"+chr(13)+chr(10)
	+"487=window_view_mouse_get_y(id):"+chr(13)+chr(10)
	+"488=window_views_mouse_get_x():"+chr(13)+chr(10)
	+"489=window_views_mouse_get_y():"+chr(13)+chr(10)
	+"490=sound_play(index)"+chr(13)+chr(10)
	+"491=sound_loop(index)"+chr(13)+chr(10)
	+"492=sound_stop(index)"+chr(13)+chr(10)
	+"493=sound_stop_all()"+chr(13)+chr(10)
	+"494=sound_isplaying(index)"+chr(13)+chr(10)
	+"495=sound_volume(index,value)"+chr(13)+chr(10)
	+"496=sound_global_volume(value)"+chr(13)+chr(10)
	+"497=sound_fade(index,value,time)"+chr(13)+chr(10)
	+"498=audio_listener_position(x,y,z)"+chr(13)+chr(10)
	+"499=audio_listener_velocity(vx,vy,vz)"+chr(13)+chr(10)
	+"500=audio_listener_orientation(lookat_x,lookat_y,lookat_z,up_x,up_y,up_z)"+chr(13)+chr(10)
	+"501=audio_emitter_position(emitterid,x,y,z)"+chr(13)+chr(10)
	+"502=audio_emitter_create():"+chr(13)+chr(10)
	+"503=audio_emitter_free(emitterid)"+chr(13)+chr(10)
	+"504=audio_emitter_exists(emitterid):"+chr(13)+chr(10)
	+"505=audio_emitter_pitch(emitterid,pitch)"+chr(13)+chr(10)
	+"506=audio_emitter_velocity(emitterid,vx,vy,vz)"+chr(13)+chr(10)
	+"507=audio_emitter_falloff(emitterid, falloff_ref_dist,falloff_max_dist,falloff_factor)"+chr(13)+chr(10)
	+"508=audio_emitter_gain(emitterid,gain)"+chr(13)+chr(10)
	+"509=audio_play_sound(soundid:index,priority:number,loops:bool):"+chr(13)+chr(10)
	+"510=audio_play_sound_on(em:index,soundid:index,priority:number,loops:bool):"+chr(13)+chr(10)
	+"511=audio_play_sound_at(soundid:index,x:number,y:number,z:number, falloff_ref_dist:number,falloff_max_dist:number,falloff_factor:number,loops:bool, priority:number):"+chr(13)+chr(10)
	+"512=audio_stop_sound(soundid)"+chr(13)+chr(10)
	+"513=audio_resume_sound(soundid)"+chr(13)+chr(10)
	+"514=audio_pause_sound(soundid)"+chr(13)+chr(10)
	+"515=audio_channel_num(numchannels)"+chr(13)+chr(10)
	+"516=audio_sound_length(sound:index):"+chr(13)+chr(10)
	+"517=audio_get_type(soundid):"+chr(13)+chr(10)
	+"518=audio_falloff_set_model(falloffmode)"+chr(13)+chr(10)
	+"519=audio_master_gain(gain)"+chr(13)+chr(10)
	+"520=audio_sound_gain(index,volume,time)"+chr(13)+chr(10)
	+"521=audio_sound_pitch(index,pitch)"+chr(13)+chr(10)
	+"522=audio_stop_all()"+chr(13)+chr(10)
	+"523=audio_resume_all()"+chr(13)+chr(10)
	+"524=audio_pause_all()"+chr(13)+chr(10)
	+"525=audio_is_playing(soundid):"+chr(13)+chr(10)
	+"526=audio_is_paused(soundid):"+chr(13)+chr(10)
	+"527=audio_exists(soundid):"+chr(13)+chr(10)
	+"528=audio_emitter_get_gain(emitterid):"+chr(13)+chr(10)
	+"529=audio_emitter_get_pitch(emitterid):"+chr(13)+chr(10)
	+"530=audio_emitter_get_x(emitterid):"+chr(13)+chr(10)
	+"531=audio_emitter_get_y(emitterid):"+chr(13)+chr(10)
	+"532=audio_emitter_get_z(emitterid):"+chr(13)+chr(10)
	+"533=audio_emitter_get_vx(emitterid):"+chr(13)+chr(10)
	+"534=audio_emitter_get_vy(emitterid):"+chr(13)+chr(10)
	+"535=audio_emitter_get_vz(emitterid):"+chr(13)+chr(10)
	+"536=audio_listener_set_position(index, x,y,z)"+chr(13)+chr(10)
	+"537=audio_listener_set_velocity(index, vx,vy,vz)"+chr(13)+chr(10)
	+"538=audio_listener_set_orientation(index, lookat_x,lookat_y,lookat_z,up_x,up_y,up_z)"+chr(13)+chr(10)
	+"539=audio_listener_get_data(index):"+chr(13)+chr(10)
	+"540=audio_set_master_gain(listenerIndex, gain)"+chr(13)+chr(10)
	+"541=audio_get_master_gain(listenerIndex):"+chr(13)+chr(10)
	+"542=audio_sound_get_gain(index):"+chr(13)+chr(10)
	+"543=audio_sound_get_pitch(index):"+chr(13)+chr(10)
	+"544=audio_get_name(index):"+chr(13)+chr(10)
	+"545=audio_sound_set_track_position(index, time)"+chr(13)+chr(10)
	+"546=audio_sound_get_track_position(index):"+chr(13)+chr(10)
	+"547=audio_create_stream(filename):"+chr(13)+chr(10)
	+"548=audio_destroy_stream(stream_sound_id)"+chr(13)+chr(10)
	+"549=audio_create_sync_group(looping):"+chr(13)+chr(10)
	+"550=audio_destroy_sync_group(sync_group_id)"+chr(13)+chr(10)
	+"551=audio_play_in_sync_group(sync:index, snd:index):"+chr(13)+chr(10)
	+"552=audio_start_sync_group(sync_group_id)"+chr(13)+chr(10)
	+"553=audio_stop_sync_group(sync_group_id)"+chr(13)+chr(10)
	+"554=audio_pause_sync_group(sync_group_id)"+chr(13)+chr(10)
	+"555=audio_resume_sync_group(sync_group_id)"+chr(13)+chr(10)
	+"556=audio_sync_group_get_track_pos(sync_group_id):"+chr(13)+chr(10)
	+"557=audio_sync_group_debug(sync_group_id)"+chr(13)+chr(10)
	+"558=audio_sync_group_is_playing(sync_group_id):"+chr(13)+chr(10)
	+"559=audio_debug(enable)"+chr(13)+chr(10)
	+"560=audio_group_load(groupId):"+chr(13)+chr(10)
	+"561=audio_group_unload(groupId)"+chr(13)+chr(10)
	+"562=audio_group_is_loaded(groupId):"+chr(13)+chr(10)
	+"563=audio_group_load_progress(groupId):"+chr(13)+chr(10)
	+"564=audio_group_name(group:index):"+chr(13)+chr(10)
	+"565=audio_group_stop_all(groupId)"+chr(13)+chr(10)
	+"566=audio_group_set_gain(groupId, volume, time)"+chr(13)+chr(10)
	+"567=audio_create_buffer_sound(bufferId, format, rate, offset, length, channels):"+chr(13)+chr(10)
	+"568=audio_free_buffer_sound(soundId)"+chr(13)+chr(10)
	+"569=audio_create_play_queue(bufferFormat, sampleRate, channels):"+chr(13)+chr(10)
	+"570=audio_free_play_queue(queueId)"+chr(13)+chr(10)
	+"571=audio_queue_sound(queueId, buffer_id, offset, length)"+chr(13)+chr(10)
	+"572=audio_get_recorder_count():"+chr(13)+chr(10)
	+"573=audio_get_recorder_info(recorder_num):"+chr(13)+chr(10)
	+"574=audio_start_recording(rec:number):"+chr(13)+chr(10)
	+"575=audio_stop_recording(channel_index)"+chr(13)+chr(10)
	+"576=audio_sound_get_listener_mask(soundid):"+chr(13)+chr(10)
	+"577=audio_emitter_get_listener_mask(emitterid):"+chr(13)+chr(10)
	+"578=audio_get_listener_mask():"+chr(13)+chr(10)
	+"579=audio_sound_set_listener_mask(soundid,mask)"+chr(13)+chr(10)
	+"580=audio_emitter_set_listener_mask(emitterid,mask)"+chr(13)+chr(10)
	+"581=audio_set_listener_mask(mask)"+chr(13)+chr(10)
	+"582=audio_get_listener_count():"+chr(13)+chr(10)
	+"583=audio_get_listener_info(index):"+chr(13)+chr(10)
	+"584=audio_system()"+chr(13)+chr(10)
	+"585=show_message(str)"+chr(13)+chr(10)
	+"586=show_message_async(str)"+chr(13)+chr(10)
	+"587=clickable_add(x,y,spritetpe,URL,target,params):"+chr(13)+chr(10)
	+"588=clickable_add_ext(x,y,spritetpe,URL,target,params,scale,alpha):"+chr(13)+chr(10)
	+"589=clickable_change(buttonid,spritetpe,x,y)"+chr(13)+chr(10)
	+"590=clickable_change_ext(buttonid,spritetpe,x,y,scale,alpha)"+chr(13)+chr(10)
	+"591=clickable_delete(buttonid)"+chr(13)+chr(10)
	+"592=clickable_exists(index):"+chr(13)+chr(10)
	+"593=clickable_set_style(buttonid,map)"+chr(13)+chr(10)
	+"594=show_question(str:string):"+chr(13)+chr(10)
	+"595=show_question_async(:string):"+chr(13)+chr(10)
	+"596=get_integer(:string,:number):"+chr(13)+chr(10)
	+"597=get_string(:string,:string):"+chr(13)+chr(10)
	+"598=get_integer_async(:string,:number):"+chr(13)+chr(10)
	+"599=get_string_async(:string,:string):"+chr(13)+chr(10)
	+"600=get_login_async(:string,:string):"+chr(13)+chr(10)
	+"601=get_open_filename(:string,:string):"+chr(13)+chr(10)
	+"602=get_save_filename(:string,:string):"+chr(13)+chr(10)
	+"603=get_open_filename_ext(:string,:string,:string,:string):"+chr(13)+chr(10)
	+"604=get_save_filename_ext(:string,:string,:string,:string):"+chr(13)+chr(10)
	+"605=show_error(str,abort)"+chr(13)+chr(10)
	+"606=highscore_clear()"+chr(13)+chr(10)
	+"607=highscore_add(str,numb)"+chr(13)+chr(10)
	+"608=highscore_value(:index):"+chr(13)+chr(10)
	+"609=highscore_name(:index):"+chr(13)+chr(10)
	+"610=draw_highscore(x1,y1,x2,y2)"+chr(13)+chr(10)
	+"611=sprite_exists(ind):"+chr(13)+chr(10)
	+"612=sprite_get_name(ind):"+chr(13)+chr(10)
	+"613=sprite_get_number(ind):"+chr(13)+chr(10)
	+"614=sprite_get_width(ind):"+chr(13)+chr(10)
	+"615=sprite_get_height(ind):"+chr(13)+chr(10)
	+"616=sprite_get_xoffset(ind):"+chr(13)+chr(10)
	+"617=sprite_get_yoffset(ind):"+chr(13)+chr(10)
	+"618=sprite_get_bbox_left(ind):"+chr(13)+chr(10)
	+"619=sprite_get_bbox_right(ind):"+chr(13)+chr(10)
	+"620=sprite_get_bbox_top(ind):"+chr(13)+chr(10)
	+"621=sprite_get_bbox_bottom(ind):"+chr(13)+chr(10)
	+"622=sprite_save(ind,subimg,fname)"+chr(13)+chr(10)
	+"623=sprite_save_strip(ind,fname)"+chr(13)+chr(10)
	+"624=sprite_set_cache_size(ind, max)"+chr(13)+chr(10)
	+"625=sprite_set_cache_size_ext(ind, image, max)"+chr(13)+chr(10)
	+"626=sprite_get_tpe(index,subindex):"+chr(13)+chr(10)
	+"627=sprite_prefetch(ind)"+chr(13)+chr(10)
	+"628=sprite_prefetch_multi(indarray)"+chr(13)+chr(10)
	+"629=sprite_flush(ind)"+chr(13)+chr(10)
	+"630=sprite_flush_multi(indarray)"+chr(13)+chr(10)
	+"631=sound_exists(ind):"+chr(13)+chr(10)
	+"632=sound_get_name(ind):"+chr(13)+chr(10)
	+"633=sound_get_kind(ind):"+chr(13)+chr(10)
	+"634=sound_get_preload(ind):"+chr(13)+chr(10)
	+"635=sound_discard(ind)"+chr(13)+chr(10)
	+"636=sound_restore(ind)"+chr(13)+chr(10)
	+"637=background_exists(ind):"+chr(13)+chr(10)
	+"638=background_get_name(ind):"+chr(13)+chr(10)
	+"639=background_get_width(ind):"+chr(13)+chr(10)
	+"640=background_get_height(ind):"+chr(13)+chr(10)
	+"641=background_save(ind,fname)"+chr(13)+chr(10)
	+"642=background_prefetch(ind)"+chr(13)+chr(10)
	+"643=background_prefetch_multi(indarray)"+chr(13)+chr(10)
	+"644=background_flush(ind)"+chr(13)+chr(10)
	+"645=background_flush_multi(indarray)"+chr(13)+chr(10)
	+"646=font_exists(ind):"+chr(13)+chr(10)
	+"647=font_get_name(ind):"+chr(13)+chr(10)
	+"648=font_get_fontname(ind):"+chr(13)+chr(10)
	+"649=font_get_bold(ind):"+chr(13)+chr(10)
	+"650=font_get_italic(ind):"+chr(13)+chr(10)
	+"651=font_get_first(ind):"+chr(13)+chr(10)
	+"652=font_get_last(ind):"+chr(13)+chr(10)
	+"653=font_get_size(ind):"+chr(13)+chr(10)
	+"654=font_set_cache_size(font,max)"+chr(13)+chr(10)
	+"655=path_exists(ind):"+chr(13)+chr(10)
	+"656=path_get_name(ind):"+chr(13)+chr(10)
	+"657=path_get_length(ind):"+chr(13)+chr(10)
	+"658=path_get_time(ind,speed):"+chr(13)+chr(10)
	+"659=path_get_kind(ind):"+chr(13)+chr(10)
	+"660=path_get_closed(ind):"+chr(13)+chr(10)
	+"661=path_get_precision(ind):"+chr(13)+chr(10)
	+"662=path_get_number(ind):"+chr(13)+chr(10)
	+"663=path_get_point_x(ind,n):"+chr(13)+chr(10)
	+"664=path_get_point_y(ind,n):"+chr(13)+chr(10)
	+"665=path_get_point_speed(ind,n):"+chr(13)+chr(10)
	+"666=path_get_x(ind,pos):"+chr(13)+chr(10)
	+"667=path_get_y(ind,pos):"+chr(13)+chr(10)
	+"668=path_get_speed(ind,pos):"+chr(13)+chr(10)
	+"669=script_exists(ind):"+chr(13)+chr(10)
	+"670=script_get_name(ind):"+chr(13)+chr(10)
	+"671=timeline_exists(ind):"+chr(13)+chr(10)
	+"672=timeline_get_name(ind):"+chr(13)+chr(10)
	+"673=timeline_moment_clear(ind,step)"+chr(13)+chr(10)
	+"674=timeline_moment_add_script(ind,step,script)"+chr(13)+chr(10)
	+"675=timeline_size(ind):"+chr(13)+chr(10)
	+"676=timeline_max_moment(:index):"+chr(13)+chr(10)
	+"677=object_exists(ind):"+chr(13)+chr(10)
	+"678=object_get_name(ind):"+chr(13)+chr(10)
	+"679=object_get_sprite(ind):"+chr(13)+chr(10)
	+"680=object_get_solid(ind):"+chr(13)+chr(10)
	+"681=object_get_visible(ind):"+chr(13)+chr(10)
	+"682=object_get_depth(ind):"+chr(13)+chr(10)
	+"683=object_get_persistent(ind):"+chr(13)+chr(10)
	+"684=object_get_mask(ind):"+chr(13)+chr(10)
	+"685=object_get_parent(ind):"+chr(13)+chr(10)
	+"686=object_get_physics(ind):"+chr(13)+chr(10)
	+"687=object_is_ancestor(ind_child,ind_parent):"+chr(13)+chr(10)
	+"688=room_exists(ind):"+chr(13)+chr(10)
	+"689=room_get_name(ind):"+chr(13)+chr(10)
	+"690=sprite_set_offset(ind,xoff,yoff)"+chr(13)+chr(10)
	+"691=sprite_duplicate(:index):"+chr(13)+chr(10)
	+"692=sprite_assign(ind,source)"+chr(13)+chr(10)
	+"693=sprite_merge(ind1,ind2)"+chr(13)+chr(10)
	+"694=sprite_add(fname:string,imgnumb:int,removeback:bool,smooth:bool,xorig:number,yorig:number)!:"+chr(13)+chr(10)
	+"695=sprite_replace(ind,fname,imgnumb,removeback,smooth,xorig,yorig)"+chr(13)+chr(10)
	+"696=sprite_create_from_surface(:index,x:number,y:number,w:number,h:number,removeback:bool,smooth:bool,xorig:number,yorig:number)!:"+chr(13)+chr(10)
	+"697=sprite_add_from_surface(ind:index,id:index,x:number,y:number,w:number,h:number,removeback:bool,smooth:bool)!:"+chr(13)+chr(10)
	+"698=sprite_delete(ind)"+chr(13)+chr(10)
	+"699=sprite_set_alpha_from_sprite(ind,spr)"+chr(13)+chr(10)
	+"700=sprite_collision_mask(ind,sepmasks,bboxmode,bbleft,bbtop,bbright,bbbottom,kind,tolerance)"+chr(13)+chr(10)
	+"701=sound_delete(ind)"+chr(13)+chr(10)
	+"702=background_duplicate(ind)"+chr(13)+chr(10)
	+"703=background_assign(ind,source)"+chr(13)+chr(10)
	+"704=background_add(fname,removeback,smooth)"+chr(13)+chr(10)
	+"705=background_replace(ind,fname,removeback,smooth)"+chr(13)+chr(10)
	+"706=background_create_colour(w,h,col):"+chr(13)+chr(10)
	+"706=background_create_color(w,h,col):"+chr(13)+chr(10)
	+"707=background_create_gradient(w,h,col1,col2,kind):"+chr(13)+chr(10)
	+"708=background_create_from_surface(id,x,y,w,h,removeback,smooth):"+chr(13)+chr(10)
	+"709=background_delete(ind)"+chr(13)+chr(10)
	+"710=background_set_alpha_from_background(ind,back)"+chr(13)+chr(10)
	+"711=font_add(:string,:number,:bool,:bool,:int,:int)!:"+chr(13)+chr(10)
	+"712=font_add_sprite(spr:index,first:int,prop:bool,sep:number)!:"+chr(13)+chr(10)
	+"713=font_add_sprite_ext(spr:index,:string,:bool,:number)!:"+chr(13)+chr(10)
	+"714=font_replace_sprite(ind,spr,first,prop,sep)"+chr(13)+chr(10)
	+"715=font_replace_sprite_ext(font,spr,string_map,prop,sep)"+chr(13)+chr(10)
	+"716=font_delete(ind)"+chr(13)+chr(10)
	+"717=font_set_dynamic_texture_size(size)"+chr(13)+chr(10)
	+"718=font_get_dynamic_texture_size():"+chr(13)+chr(10)
	+"719=path_set_kind(ind,kind)"+chr(13)+chr(10)
	+"720=path_set_closed(ind,closed)"+chr(13)+chr(10)
	+"721=path_set_precision(ind,prec)"+chr(13)+chr(10)
	+"722=path_add()!:"+chr(13)+chr(10)
	+"723=path_assign(ind,path)"+chr(13)+chr(10)
	+"724=path_duplicate(:index)!:"+chr(13)+chr(10)
	+"725=path_append(ind,path)"+chr(13)+chr(10)
	+"726=path_delete(ind)"+chr(13)+chr(10)
	+"727=path_add_point(ind,x,y,speed)"+chr(13)+chr(10)
	+"728=path_insert_point(ind,n,x,y,speed)"+chr(13)+chr(10)
	+"729=path_change_point(ind,n,x,y,speed)"+chr(13)+chr(10)
	+"730=path_delete_point(ind,n)"+chr(13)+chr(10)
	+"731=path_clear_points(ind)"+chr(13)+chr(10)
	+"732=path_reverse(ind)"+chr(13)+chr(10)
	+"733=path_mirror(ind)"+chr(13)+chr(10)
	+"734=path_flip(ind)"+chr(13)+chr(10)
	+"735=path_rotate(ind,angle)"+chr(13)+chr(10)
	+"736=path_rescale(ind,xscale,yscale)"+chr(13)+chr(10)
	+"737=path_shift(ind,xshift,yshift)"+chr(13)+chr(10)
	+"738=timeline_add()!:"+chr(13)+chr(10)
	+"739=timeline_delete(ind)"+chr(13)+chr(10)
	+"740=timeline_clear(ind)"+chr(13)+chr(10)
	+"741=object_set_sprite(ind,spr)"+chr(13)+chr(10)
	+"742=object_set_solid(ind,solid)"+chr(13)+chr(10)
	+"743=object_set_visible(ind,vis)"+chr(13)+chr(10)
	+"744=object_set_depth(ind,depth)"+chr(13)+chr(10)
	+"745=object_set_persistent(ind,pers)"+chr(13)+chr(10)
	+"746=object_set_mask(ind,spr)"+chr(13)+chr(10)
	+"747=room_set_width(ind,w)"+chr(13)+chr(10)
	+"748=room_set_height(ind,h)"+chr(13)+chr(10)
	+"749=room_set_persistent(ind,pers)"+chr(13)+chr(10)
	+"750=room_set_background_colour(ind,col,show)"+chr(13)+chr(10)
	+"750=room_set_background_color(ind,col,show)"+chr(13)+chr(10)
	+"751=room_set_background(ind,bind,vis,fore,back,x,y,htiled,vtiled,hspeed,vspeed,alpha)"+chr(13)+chr(10)
	+"752=room_set_view(ind,vind,vis,xview,yview,wview,hview,xport,yport,wport,hport,hborder,vborder,hspeed,vspeed,obj)"+chr(13)+chr(10)
	+"753=room_set_view_enabled(ind,val)"+chr(13)+chr(10)
	+"754=room_add()!:"+chr(13)+chr(10)
	+"755=room_duplicate(:index)!:"+chr(13)+chr(10)
	+"756=room_assign(ind,source)"+chr(13)+chr(10)
	+"757=room_instance_add(:index,:number,:number,:index):"+chr(13)+chr(10)
	+"758=room_instance_clear(ind)"+chr(13)+chr(10)
	+"759=room_tile_add(ind,back,left,top,width,height,x,y,depth)"+chr(13)+chr(10)
	+"760=room_tile_add_ext(ind,back,left,top,width,height,x,y,depth,xscale,yscale,alpha)"+chr(13)+chr(10)
	+"761=room_tile_clear(ind)"+chr(13)+chr(10)
	+"762=asset_get_index(name):"+chr(13)+chr(10)
	+"763=asset_get_type(name):"+chr(13)+chr(10)
	+"764=file_text_open_from_string(:string):"+chr(13)+chr(10)
	+"765=file_text_open_read(fname):"+chr(13)+chr(10)
	+"766=file_text_open_write(:string):"+chr(13)+chr(10)
	+"767=file_text_open_append(:string):"+chr(13)+chr(10)
	+"768=file_text_close(file)"+chr(13)+chr(10)
	+"769=file_text_write_string(file,str)"+chr(13)+chr(10)
	+"770=file_text_write_real(file,val)"+chr(13)+chr(10)
	+"771=file_text_writeln(file)"+chr(13)+chr(10)
	+"772=file_text_read_string(file):"+chr(13)+chr(10)
	+"773=file_text_read_real(file):"+chr(13)+chr(10)
	+"774=file_text_readln(file):"+chr(13)+chr(10)
	+"775=file_text_eof(:index):"+chr(13)+chr(10)
	+"776=file_text_eoln(:index):"+chr(13)+chr(10)
	+"777=file_exists(fname):"+chr(13)+chr(10)
	+"778=file_delete(fname)"+chr(13)+chr(10)
	+"779=file_rename(oldname,newname)"+chr(13)+chr(10)
	+"780=file_copy(fname,newname)"+chr(13)+chr(10)
	+"781=directory_exists(dname):"+chr(13)+chr(10)
	+"782=directory_create(dname):"+chr(13)+chr(10)
	+"783=directory_destroy(dname)"+chr(13)+chr(10)
	+"784=file_find_first(mask,attr):"+chr(13)+chr(10)
	+"785=file_find_next():"+chr(13)+chr(10)
	+"786=file_find_close():"+chr(13)+chr(10)
	+"787=file_attributes(:string,:int):"+chr(13)+chr(10)
	+"788=filename_name(:string):"+chr(13)+chr(10)
	+"789=filename_path(:string):"+chr(13)+chr(10)
	+"790=filename_dir(:string):"+chr(13)+chr(10)
	+"791=filename_drive(:string):"+chr(13)+chr(10)
	+"792=filename_ext(:string):"+chr(13)+chr(10)
	+"793=filename_change_ext(:string,:string):"+chr(13)+chr(10)
	+"794=file_bin_open(:string,mode):"+chr(13)+chr(10)
	+"795=file_bin_rewrite(binfile)"+chr(13)+chr(10)
	+"796=file_bin_close(binfile)"+chr(13)+chr(10)
	+"797=file_bin_position(:index):"+chr(13)+chr(10)
	+"798=file_bin_size(binfile):"+chr(13)+chr(10)
	+"799=file_bin_seek(binfile,pos)"+chr(13)+chr(10)
	+"800=file_bin_write_byte(binfile,byte)"+chr(13)+chr(10)
	+"801=file_bin_read_byte(binfile):"+chr(13)+chr(10)
	+"802=parameter_count():"+chr(13)+chr(10)
	+"803=parameter_string(:index):"+chr(13)+chr(10)
	+"804=environment_get_variable(name):"+chr(13)+chr(10)
	+"805=ini_open_from_string(content)"+chr(13)+chr(10)
	+"806=ini_open(fname)"+chr(13)+chr(10)
	+"807=ini_close():"+chr(13)+chr(10)
	+"808=ini_read_string(section,key,default):"+chr(13)+chr(10)
	+"809=ini_read_real(section,key,default):"+chr(13)+chr(10)
	+"810=ini_write_string(section,key,str)"+chr(13)+chr(10)
	+"811=ini_write_real(section,key,value)"+chr(13)+chr(10)
	+"812=ini_key_exists(section,key):"+chr(13)+chr(10)
	+"813=ini_section_exists(section):"+chr(13)+chr(10)
	+"814=ini_key_delete(section,key)"+chr(13)+chr(10)
	+"815=ini_section_delete(section)"+chr(13)+chr(10)
	+"816=ds_set_precision(prec)"+chr(13)+chr(10)
	+"817=ds_exists(id, type):"+chr(13)+chr(10)
	+"818=ds_stack_create():"+chr(13)+chr(10)
	+"819=ds_stack_destroy(id)"+chr(13)+chr(10)
	+"820=ds_stack_clear(id)"+chr(13)+chr(10)
	+"821=ds_stack_copy(id,source)"+chr(13)+chr(10)
	+"822=ds_stack_size(id):"+chr(13)+chr(10)
	+"823=ds_stack_empty(id)"+chr(13)+chr(10)
	+"824=ds_stack_push(id,value,...)"+chr(13)+chr(10)
	+"825=ds_stack_pop(id)"+chr(13)+chr(10)
	+"826=ds_stack_top(:index):"+chr(13)+chr(10)
	+"827=ds_stack_write(:index):"+chr(13)+chr(10)
	+"828=ds_stack_read(:index,:string,?legacy):"+chr(13)+chr(10)
	+"829=ds_queue_create():"+chr(13)+chr(10)
	+"830=ds_queue_destroy(id)"+chr(13)+chr(10)
	+"831=ds_queue_clear(id)"+chr(13)+chr(10)
	+"832=ds_queue_copy(id,source)"+chr(13)+chr(10)
	+"833=ds_queue_size(id):"+chr(13)+chr(10)
	+"834=ds_queue_empty(:index):"+chr(13)+chr(10)
	+"835=ds_queue_enqueue(id,value,...)"+chr(13)+chr(10)
	+"836=ds_queue_dequeue(:index):"+chr(13)+chr(10)
	+"837=ds_queue_head(:index):"+chr(13)+chr(10)
	+"838=ds_queue_tail(:index):"+chr(13)+chr(10)
	+"839=ds_queue_write(:index):"+chr(13)+chr(10)
	+"840=ds_queue_read(:index,:string,?legacy):"+chr(13)+chr(10)
	+"841=ds_list_create():"+chr(13)+chr(10)
	+"842=ds_list_destroy(id)"+chr(13)+chr(10)
	+"843=ds_list_clear(id)"+chr(13)+chr(10)
	+"844=ds_list_copy(id,source)"+chr(13)+chr(10)
	+"845=ds_list_size(id):"+chr(13)+chr(10)
	+"846=ds_list_empty(:index):"+chr(13)+chr(10)
	+"847=ds_list_add(id,value,...)"+chr(13)+chr(10)
	+"848=ds_list_insert(id,pos,value)"+chr(13)+chr(10)
	+"849=ds_list_replace(id,pos,value)"+chr(13)+chr(10)
	+"850=ds_list_delete(id,pos)"+chr(13)+chr(10)
	+"851=ds_list_find_index(id,value):"+chr(13)+chr(10)
	+"852=ds_list_find_value(id,pos):"+chr(13)+chr(10)
	+"853=ds_list_mark_as_list(id,pos)"+chr(13)+chr(10)
	+"854=ds_list_mark_as_map(id,pos)"+chr(13)+chr(10)
	+"855=ds_list_sort(id,ascending)"+chr(13)+chr(10)
	+"856=ds_list_shuffle(id)"+chr(13)+chr(10)
	+"857=ds_list_write(:index):"+chr(13)+chr(10)
	+"858=ds_list_read(:index,:string,?legacy):"+chr(13)+chr(10)
	+"859=ds_map_create():"+chr(13)+chr(10)
	+"860=ds_map_destroy(id)"+chr(13)+chr(10)
	+"861=ds_map_clear(id)"+chr(13)+chr(10)
	+"862=ds_map_copy(id,source)"+chr(13)+chr(10)
	+"863=ds_map_size(id):"+chr(13)+chr(10)
	+"864=ds_map_empty(map:index):"+chr(13)+chr(10)
	+"865=ds_map_add(id,key,value)"+chr(13)+chr(10)
	+"866=ds_map_add_list(id,key,value)"+chr(13)+chr(10)
	+"867=ds_map_add_map(id,key,value)"+chr(13)+chr(10)
	+"868=ds_map_replace(id,key,value)"+chr(13)+chr(10)
	+"869=ds_map_replace_map(id,key,value)"+chr(13)+chr(10)
	+"870=ds_map_replace_list(id,key,value)"+chr(13)+chr(10)
	+"871=ds_map_delete(id,key)"+chr(13)+chr(10)
	+"872=ds_map_exists(id,key):"+chr(13)+chr(10)
	+"873=ds_map_find_value(id,key):"+chr(13)+chr(10)
	+"874=ds_map_find_previous(id,key):"+chr(13)+chr(10)
	+"875=ds_map_find_next(id,key):"+chr(13)+chr(10)
	+"876=ds_map_find_first(id):"+chr(13)+chr(10)
	+"877=ds_map_find_last(id):"+chr(13)+chr(10)
	+"878=ds_map_write(:index):"+chr(13)+chr(10)
	+"879=ds_map_read(:index,:string,?legacy):"+chr(13)+chr(10)
	+"880=ds_map_secure_save(id, filename)"+chr(13)+chr(10)
	+"881=ds_map_secure_load(filename):"+chr(13)+chr(10)
	+"882=ds_map_secure_load_buffer(buffer):"+chr(13)+chr(10)
	+"883=ds_map_secure_save_buffer(id,buffer)"+chr(13)+chr(10)
	+"884=ds_priority_create():"+chr(13)+chr(10)
	+"885=ds_priority_destroy(id)"+chr(13)+chr(10)
	+"886=ds_priority_clear(id)"+chr(13)+chr(10)
	+"887=ds_priority_copy(id,source)"+chr(13)+chr(10)
	+"888=ds_priority_size(id):"+chr(13)+chr(10)
	+"889=ds_priority_empty(:index):"+chr(13)+chr(10)
	+"890=ds_priority_add(id,value,priority)"+chr(13)+chr(10)
	+"891=ds_priority_change_priority(id,value,priority)"+chr(13)+chr(10)
	+"892=ds_priority_find_priority(id,value):"+chr(13)+chr(10)
	+"893=ds_priority_delete_value(id,value)"+chr(13)+chr(10)
	+"894=ds_priority_delete_min(:index):"+chr(13)+chr(10)
	+"895=ds_priority_find_min(:index):"+chr(13)+chr(10)
	+"896=ds_priority_delete_max(:index):"+chr(13)+chr(10)
	+"897=ds_priority_find_max(:index):"+chr(13)+chr(10)
	+"898=ds_priority_write(:index):"+chr(13)+chr(10)
	+"899=ds_priority_read(:index,:string,?legacy):"+chr(13)+chr(10)
	+"900=ds_grid_create(w,h):"+chr(13)+chr(10)
	+"901=ds_grid_destroy(id)"+chr(13)+chr(10)
	+"902=ds_grid_copy(id,source)"+chr(13)+chr(10)
	+"903=ds_grid_resize(id,w,h)"+chr(13)+chr(10)
	+"904=ds_grid_width(:index):"+chr(13)+chr(10)
	+"905=ds_grid_height(:index):"+chr(13)+chr(10)
	+"906=ds_grid_clear(id,val)"+chr(13)+chr(10)
	+"907=ds_grid_set(id,x,y,val)"+chr(13)+chr(10)
	+"908=ds_grid_add(id,x,y,val)"+chr(13)+chr(10)
	+"909=ds_grid_multiply(id,x,y,val)"+chr(13)+chr(10)
	+"910=ds_grid_set_region(id,x1,y1,x2,y2,val)"+chr(13)+chr(10)
	+"911=ds_grid_add_region(id,x1,y1,x2,y2,val)"+chr(13)+chr(10)
	+"912=ds_grid_multiply_region(id,x1,y1,x2,y2,val)"+chr(13)+chr(10)
	+"913=ds_grid_set_disk(id,xm,ym,r,val)"+chr(13)+chr(10)
	+"914=ds_grid_add_disk(id,xm,ym,r,val)"+chr(13)+chr(10)
	+"915=ds_grid_multiply_disk(id,xm,ym,r,val)"+chr(13)+chr(10)
	+"916=ds_grid_set_grid_region(id,source,x1,y1,x2,y2,xpos,ypos)"+chr(13)+chr(10)
	+"917=ds_grid_add_grid_region(id,source,x1,y1,x2,y2,xpos,ypos)"+chr(13)+chr(10)
	+"918=ds_grid_multiply_grid_region(id,source,x1,y1,x2,y2,xpos,ypos)"+chr(13)+chr(10)
	+"919=ds_grid_get(id,x,y):"+chr(13)+chr(10)
	+"920=ds_grid_get_sum(id,x1,y1,x2,y2):"+chr(13)+chr(10)
	+"921=ds_grid_get_max(id,x1,y1,x2,y2):"+chr(13)+chr(10)
	+"922=ds_grid_get_min(id,x1,y1,x2,y2):"+chr(13)+chr(10)
	+"923=ds_grid_get_mean(id,x1,y1,x2,y2):"+chr(13)+chr(10)
	+"924=ds_grid_get_disk_sum(id,xm,ym,r):"+chr(13)+chr(10)
	+"925=ds_grid_get_disk_min(id,xm,ym,r):"+chr(13)+chr(10)
	+"926=ds_grid_get_disk_max(id,xm,ym,r):"+chr(13)+chr(10)
	+"927=ds_grid_get_disk_mean(id,xm,ym,r):"+chr(13)+chr(10)
	+"928=ds_grid_value_exists(id,x1,y1,x2,y2,val):"+chr(13)+chr(10)
	+"929=ds_grid_value_x(:index,x1:number,y1:number,x2:number,y2:number,val):"+chr(13)+chr(10)
	+"930=ds_grid_value_y(:index,x1:number,y1:number,x2:number,y2:number,val):"+chr(13)+chr(10)
	+"931=ds_grid_value_disk_exists(id,xm,ym,r,val):"+chr(13)+chr(10)
	+"932=ds_grid_value_disk_x(:index,xm:number,ym:number,r:number,val):"+chr(13)+chr(10)
	+"933=ds_grid_value_disk_y(:index,xm:number,ym:number,r:number,val):"+chr(13)+chr(10)
	+"934=ds_grid_shuffle(id)"+chr(13)+chr(10)
	+"935=ds_grid_write(:index):"+chr(13)+chr(10)
	+"936=ds_grid_read(:index,:string,?legacy):"+chr(13)+chr(10)
	+"937=ds_grid_sort(id,column,ascending)"+chr(13)+chr(10)
	+"938=effect_create_below(kind,x,y,size,colour):"+chr(13)+chr(10)
	+"939=effect_create_above(kind,x,y,size,colour):"+chr(13)+chr(10)
	+"940=effect_clear()"+chr(13)+chr(10)
	+"941=part_type_create():"+chr(13)+chr(10)
	+"942=part_type_destroy(ind)"+chr(13)+chr(10)
	+"943=part_type_exists(ind):"+chr(13)+chr(10)
	+"944=part_type_clear(ind)"+chr(13)+chr(10)
	+"945=part_type_shape(ind,shape)"+chr(13)+chr(10)
	+"946=part_type_sprite(ind,sprite,animat,stretch,random)"+chr(13)+chr(10)
	+"947=part_type_size(ind,size_min,size_max,size_incr,size_wiggle):"+chr(13)+chr(10)
	+"948=part_type_scale(ind,xscale,yscale)"+chr(13)+chr(10)
	+"949=part_type_orientation(ind,ang_min,ang_max,ang_incr,ang_wiggle,ang_relative)"+chr(13)+chr(10)
	+"950=part_type_life(ind,life_min,life_max)"+chr(13)+chr(10)
	+"951=part_type_step(ind,step_number,step_type)"+chr(13)+chr(10)
	+"952=part_type_death(ind,death_number,death_type)"+chr(13)+chr(10)
	+"953=part_type_speed(ind,speed_min,speed_max,speed_incr,speed_wiggle)"+chr(13)+chr(10)
	+"954=part_type_direction(ind,dir_min,dir_max,dir_incr,dir_wiggle)"+chr(13)+chr(10)
	+"955=part_type_gravity(ind,grav_amount,grav_dir)"+chr(13)+chr(10)
	+"956=part_type_colour1(ind,colour1)"+chr(13)+chr(10)
	+"956=part_type_color1(ind,colour1)"+chr(13)+chr(10)
	+"957=part_type_colour2(ind,colour1,colour2)"+chr(13)+chr(10)
	+"957=part_type_color2(ind,colour1,colour2)"+chr(13)+chr(10)
	+"958=part_type_colour3(ind,colour1,colour2,colour3)"+chr(13)+chr(10)
	+"958=part_type_color3(ind,colour1,colour2,colour3)"+chr(13)+chr(10)
	+"959=part_type_colour_mix(ind,colour1,colour2)"+chr(13)+chr(10)
	+"959=part_type_color_mix(ind,colour1,colour2)"+chr(13)+chr(10)
	+"960=part_type_colour_rgb(ind,rmin,rmax,gmin,gmax,bmin,bmax)"+chr(13)+chr(10)
	+"960=part_type_color_rgb(ind,rmin,rmax,gmin,gmax,bmin,bmax)"+chr(13)+chr(10)
	+"961=part_type_colour_hsv(ind,hmin,hmax,smin,smax,vmin,vmax)"+chr(13)+chr(10)
	+"961=part_type_color_hsv(ind,hmin,hmax,smin,smax,vmin,vmax)"+chr(13)+chr(10)
	+"962=part_type_alpha1(ind,alpha1)"+chr(13)+chr(10)
	+"963=part_type_alpha2(ind,alpha1,alpha2)"+chr(13)+chr(10)
	+"964=part_type_alpha3(ind,alpha1,alpha2,alpha3)"+chr(13)+chr(10)
	+"965=part_type_blend(ind,additive)"+chr(13)+chr(10)
	+"966=part_system_create():"+chr(13)+chr(10)
	+"967=part_system_destroy(ind)"+chr(13)+chr(10)
	+"968=part_system_exists(ind):"+chr(13)+chr(10)
	+"969=part_system_clear(ind)"+chr(13)+chr(10)
	+"970=part_system_draw_order(ind,oldtonew)"+chr(13)+chr(10)
	+"971=part_system_depth(ind,depth)"+chr(13)+chr(10)
	+"972=part_system_position(ind,x,y)"+chr(13)+chr(10)
	+"973=part_system_automatic_update(ind,automatic)"+chr(13)+chr(10)
	+"974=part_system_automatic_draw(ind,draw)"+chr(13)+chr(10)
	+"975=part_system_update(ind)"+chr(13)+chr(10)
	+"976=part_system_drawit(ind)"+chr(13)+chr(10)
	+"977=part_particles_create(ind,x,y,parttype,number):"+chr(13)+chr(10)
	+"978=part_particles_create_colour(ind,x,y,parttype,colour,number):"+chr(13)+chr(10)
	+"978=part_particles_create_color(ind,x,y,parttype,colour,number):"+chr(13)+chr(10)
	+"979=part_particles_clear(ind)"+chr(13)+chr(10)
	+"980=part_particles_count(ind)"+chr(13)+chr(10)
	+"981=part_emitter_create(ps):"+chr(13)+chr(10)
	+"982=part_emitter_destroy(ps,ind)"+chr(13)+chr(10)
	+"983=part_emitter_destroy_all(ps)"+chr(13)+chr(10)
	+"984=part_emitter_exists(ps,ind):"+chr(13)+chr(10)
	+"985=part_emitter_clear(ps,ind)"+chr(13)+chr(10)
	+"986=part_emitter_region(ps,ind,xmin,xmax,ymin,ymax,shape,distribution)"+chr(13)+chr(10)
	+"987=part_emitter_burst(ps,ind,parttype,number)"+chr(13)+chr(10)
	+"988=part_emitter_stream(ps,ind,parttype,number)"+chr(13)+chr(10)
	+"989=window_handle():"+chr(13)+chr(10)
	+"990=window_device():"+chr(13)+chr(10)
	+"991=d3d_start()"+chr(13)+chr(10)
	+"992=d3d_end()"+chr(13)+chr(10)
	+"993=d3d_set_hidden(enable)"+chr(13)+chr(10)
	+"994=d3d_set_perspective(enable)"+chr(13)+chr(10)
	+"995=d3d_set_depth(depth)"+chr(13)+chr(10)
	+"996=d3d_primitive_begin(kind)"+chr(13)+chr(10)
	+"997=d3d_vertex(x,y,z)"+chr(13)+chr(10)
	+"998=d3d_vertex_colour(x,y,z,col,alpha)"+chr(13)+chr(10)
	+"998=d3d_vertex_color(x,y,z,col,alpha)"+chr(13)+chr(10)
	+"999=d3d_primitive_end()"+chr(13)+chr(10)
	+"1000=d3d_primitive_begin_texture(kind,texid)"+chr(13)+chr(10)
	+"1001=d3d_vertex_texture(x,y,z,xtex,ytex)"+chr(13)+chr(10)
	+"1002=d3d_vertex_texture_colour(x,y,z,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1002=d3d_vertex_texture_color(x,y,z,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1003=d3d_draw_block(x1,y1,z1,x2,y2,z2,texid,hrepeat,vrepeat)"+chr(13)+chr(10)
	+"1004=d3d_draw_cylinder(x1,y1,z1,x2,y2,z2,texid,hrepeat,vrepeat,closed,steps)"+chr(13)+chr(10)
	+"1005=d3d_draw_cone(x1,y1,z1,x2,y2,z2,texid,hrepeat,vrepeat,closed,steps)"+chr(13)+chr(10)
	+"1006=d3d_draw_ellipsoid(x1,y1,z1,x2,y2,z2,texid,hrepeat,vrepeat,steps)"+chr(13)+chr(10)
	+"1007=d3d_draw_wall(x1,y1,z1,x2,y2,z2,texid,hrepeat,vrepeat)"+chr(13)+chr(10)
	+"1008=d3d_draw_floor(x1,y1,z1,x2,y2,z2,texid,hrepeat,vrepeat)"+chr(13)+chr(10)
	+"1009=d3d_set_projection(xfrom,yfrom,zfrom,xto,yto,zto,xup,yup,zup)"+chr(13)+chr(10)
	+"1010=d3d_set_projection_ext(xfrom,yfrom,zfrom,xto,yto,zto,xup,yup,zup,angle,aspect,znear,zfar)"+chr(13)+chr(10)
	+"1011=d3d_set_projection_ortho(x,y,w,h,angle)"+chr(13)+chr(10)
	+"1012=d3d_set_projection_perspective(x,y,w,h,angle)"+chr(13)+chr(10)
	+"1013=d3d_transform_set_identity()"+chr(13)+chr(10)
	+"1014=d3d_transform_set_translation(xt,yt,zt)"+chr(13)+chr(10)
	+"1015=d3d_transform_set_scaling(xs,ys,zs)"+chr(13)+chr(10)
	+"1016=d3d_transform_set_rotation_x(angle)"+chr(13)+chr(10)
	+"1017=d3d_transform_set_rotation_y(angle)"+chr(13)+chr(10)
	+"1018=d3d_transform_set_rotation_z(angle)"+chr(13)+chr(10)
	+"1019=d3d_transform_set_rotation_axis(xa,ya,za,angle)"+chr(13)+chr(10)
	+"1020=d3d_transform_add_translation(xt,yt,zt)"+chr(13)+chr(10)
	+"1021=d3d_transform_add_scaling(xs,ys,zs)"+chr(13)+chr(10)
	+"1022=d3d_transform_add_rotation_x(angle)"+chr(13)+chr(10)
	+"1023=d3d_transform_add_rotation_y(angle)"+chr(13)+chr(10)
	+"1024=d3d_transform_add_rotation_z(angle)"+chr(13)+chr(10)
	+"1025=d3d_transform_add_rotation_axis(xa,ya,za,angle)"+chr(13)+chr(10)
	+"1026=d3d_transform_stack_clear()"+chr(13)+chr(10)
	+"1027=d3d_transform_stack_empty()"+chr(13)+chr(10)
	+"1028=d3d_transform_stack_push()"+chr(13)+chr(10)
	+"1029=d3d_transform_stack_pop()"+chr(13)+chr(10)
	+"1030=d3d_transform_stack_top()"+chr(13)+chr(10)
	+"1031=d3d_transform_stack_discard()"+chr(13)+chr(10)
	+"1032=d3d_transform_vertex(x,y,z)"+chr(13)+chr(10)
	+"1033=d3d_set_fog(enable,colour,start,end)"+chr(13)+chr(10)
	+"1034=d3d_set_lighting(enable)"+chr(13)+chr(10)
	+"1035=d3d_set_shading(smooth)"+chr(13)+chr(10)
	+"1036=d3d_set_culling(cull)"+chr(13)+chr(10)
	+"1037=d3d_set_zwriteenable(on_off)"+chr(13)+chr(10)
	+"1038=d3d_light_define_ambient(col)"+chr(13)+chr(10)
	+"1039=d3d_light_define_direction(ind,dx,dy,dz,col)"+chr(13)+chr(10)
	+"1040=d3d_light_define_point(ind,x,y,z,range,col)"+chr(13)+chr(10)
	+"1041=d3d_light_enable(ind,enable)"+chr(13)+chr(10)
	+"1042=d3d_vertex_normal(x,y,z,nx,ny,nz)"+chr(13)+chr(10)
	+"1043=d3d_vertex_normal_colour(x,y,z,nx,ny,nz,col,alpha)"+chr(13)+chr(10)
	+"1043=d3d_vertex_normal_color(x,y,z,nx,ny,nz,col,alpha)"+chr(13)+chr(10)
	+"1044=d3d_vertex_normal_texture(x,y,z,nx,ny,nz,xtex,ytex)"+chr(13)+chr(10)
	+"1045=d3d_vertex_normal_texture_colour(x,y,z,nx,ny,nz,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1045=d3d_vertex_normal_texture_color(x,y,z,nx,ny,nz,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1046=d3d_model_create():"+chr(13)+chr(10)
	+"1047=d3d_model_destroy(ind)"+chr(13)+chr(10)
	+"1048=d3d_model_clear(ind)"+chr(13)+chr(10)
	+"1049=d3d_model_save(ind,fname)"+chr(13)+chr(10)
	+"1050=d3d_model_load(ind,fname):"+chr(13)+chr(10)
	+"1051=d3d_model_save_buffer(ind,buffer_index)"+chr(13)+chr(10)
	+"1052=d3d_model_load_buffer(ind,buffer_index):"+chr(13)+chr(10)
	+"1053=d3d_model_draw(ind,x,y,z,texid)"+chr(13)+chr(10)
	+"1054=d3d_model_primitive_begin(ind,kind)"+chr(13)+chr(10)
	+"1055=d3d_model_vertex(ind,x,y,z)"+chr(13)+chr(10)
	+"1056=d3d_model_vertex_colour(ind,x,y,z,col,alpha)"+chr(13)+chr(10)
	+"1056=d3d_model_vertex_color(ind,x,y,z,col,alpha)"+chr(13)+chr(10)
	+"1057=d3d_model_vertex_texture(ind,x,y,z,xtex,ytex)"+chr(13)+chr(10)
	+"1058=d3d_model_vertex_texture_colour(ind,x,y,z,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1058=d3d_model_vertex_texture_color(ind,x,y,z,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1059=d3d_model_vertex_normal(ind,x,y,z,nx,ny,nz)"+chr(13)+chr(10)
	+"1060=d3d_model_vertex_normal_colour(ind,x,y,z,nx,ny,nz,col,alpha)"+chr(13)+chr(10)
	+"1060=d3d_model_vertex_normal_color(ind,x,y,z,nx,ny,nz,col,alpha)"+chr(13)+chr(10)
	+"1061=d3d_model_vertex_normal_texture(ind,x,y,z,nx,ny,nz,xtex,ytex)"+chr(13)+chr(10)
	+"1062=d3d_model_vertex_normal_texture_colour(ind,x,y,z,nx,ny,nz,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1062=d3d_model_vertex_normal_texture_color(ind,x,y,z,nx,ny,nz,xtex,ytex,col,alpha)"+chr(13)+chr(10)
	+"1063=d3d_model_primitive_end(ind)"+chr(13)+chr(10)
	+"1064=d3d_model_block(ind,x1,y1,z1,x2,y2,z2,hrepeat,vrepeat)"+chr(13)+chr(10)
	+"1065=d3d_model_cylinder(ind,x1,y1,z1,x2,y2,z2,hrepeat,vrepeat,closed,steps)"+chr(13)+chr(10)
	+"1066=d3d_model_cone(ind,x1,y1,z1,x2,y2,z2,hrepeat,vrepeat,closed,steps)"+chr(13)+chr(10)
	+"1067=d3d_model_ellipsoid(ind,x1,y1,z1,x2,y2,z2,hrepeat,vrepeat,steps)"+chr(13)+chr(10)
	+"1068=d3d_model_wall(ind,x1,y1,z1,x2,y2,z2,hrepeat,vrepeat)"+chr(13)+chr(10)
	+"1069=d3d_model_floor(ind,x1,y1,z1,x2,y2,z2,hrepeat,vrepeat)"+chr(13)+chr(10)
	+"1070=matrix_get(type):"+chr(13)+chr(10)
	+"1071=matrix_set(type,matrix)"+chr(13)+chr(10)
	+"1072=matrix_build(x,y,z,xrotation,yrotation,zrotation,xscale,yscale,zscale):"+chr(13)+chr(10)
	+"1073=matrix_multiply(a, b):"+chr(13)+chr(10)
	+"1074=os_get_config():"+chr(13)+chr(10)
	+"1075=os_get_info():"+chr(13)+chr(10)
	+"1076=os_get_language():"+chr(13)+chr(10)
	+"1077=os_get_region():"+chr(13)+chr(10)
	+"1078=os_lock_orientation(flag)"+chr(13)+chr(10)
	+"1079=os_check_permission(permission)"+chr(13)+chr(10)
	+"1080=os_request_permission(permission)"+chr(13)+chr(10)
	+"1081=display_get_dpi_x():"+chr(13)+chr(10)
	+"1082=display_get_dpi_y():"+chr(13)+chr(10)
	+"1083=display_set_gui_size(width,height)"+chr(13)+chr(10)
	+"1084=display_set_gui_maximise(xscale,yscale,xoffset,yoffset)"+chr(13)+chr(10)
	+"1085=device_mouse_dbclick_enable(enable)"+chr(13)+chr(10)
	+"1086=virtual_key_add(x,y,w,h,keycode)"+chr(13)+chr(10)
	+"1087=virtual_key_hide(id)"+chr(13)+chr(10)
	+"1088=virtual_key_delete(id)"+chr(13)+chr(10)
	+"1089=virtual_key_show(id)"+chr(13)+chr(10)
	+"1090=draw_enable_alphablend(enable)"+chr(13)+chr(10)
	+"1091=draw_enable_drawevent(enable)"+chr(13)+chr(10)
	+"1092=draw_enable_swf_aa(enable)"+chr(13)+chr(10)
	+"1093=draw_set_swf_aa_level(aa_level)"+chr(13)+chr(10)
	+"1094=draw_get_swf_aa_level():"+chr(13)+chr(10)
	+"1095=draw_texture_flush()"+chr(13)+chr(10)
	+"1096=draw_flush()"+chr(13)+chr(10)
	+"1097=shop_leave_rating(text_string,yes_string,no_string,url)"+chr(13)+chr(10)
	+"1098=url_get_domain():"+chr(13)+chr(10)
	+"1099=url_open(url)"+chr(13)+chr(10)
	+"1100=url_open_ext(url,target)"+chr(13)+chr(10)
	+"1101=url_open_full(url,target,options)"+chr(13)+chr(10)
	+"1102=get_timer():"+chr(13)+chr(10)
	+"1103=device_get_tilt_x():"+chr(13)+chr(10)
	+"1104=device_get_tilt_y():"+chr(13)+chr(10)
	+"1105=device_get_tilt_z():"+chr(13)+chr(10)
	+"1106=device_is_keypad_open():"+chr(13)+chr(10)
	+"1107=device_mouse_check_button(:index,:index):"+chr(13)+chr(10)
	+"1108=device_mouse_check_button_pressed(:index,:index):"+chr(13)+chr(10)
	+"1109=device_mouse_check_button_released(:index,:index):"+chr(13)+chr(10)
	+"1110=device_mouse_x(:index):"+chr(13)+chr(10)
	+"1111=device_mouse_y(:index):"+chr(13)+chr(10)
	+"1112=device_mouse_raw_x(:index):"+chr(13)+chr(10)
	+"1113=device_mouse_raw_y(:index):"+chr(13)+chr(10)
	+"1114=device_mouse_x_to_gui(:index):"+chr(13)+chr(10)
	+"1115=device_mouse_y_to_gui(:index):"+chr(13)+chr(10)
	+"1116=gamepad_is_supported():"+chr(13)+chr(10)
	+"1117=gamepad_get_device_count():"+chr(13)+chr(10)
	+"1118=gamepad_is_connected(device):"+chr(13)+chr(10)
	+"1119=gamepad_get_description(device):"+chr(13)+chr(10)
	+"1120=gamepad_get_button_threshold(device):"+chr(13)+chr(10)
	+"1121=gamepad_set_button_threshold(device, threshold)"+chr(13)+chr(10)
	+"1122=gamepad_get_axis_deadzone(device):"+chr(13)+chr(10)
	+"1123=gamepad_set_axis_deadzone(device, deadzone)"+chr(13)+chr(10)
	+"1124=gamepad_button_count(device:index):"+chr(13)+chr(10)
	+"1125=gamepad_button_check(device:index, buttonIndex:index):"+chr(13)+chr(10)
	+"1126=gamepad_button_check_pressed(device:index, buttonIndex:index):"+chr(13)+chr(10)
	+"1127=gamepad_button_check_released(device:index, buttonIndex:index):"+chr(13)+chr(10)
	+"1128=gamepad_button_value(device:index, buttonIndex:index):"+chr(13)+chr(10)
	+"1129=gamepad_axis_count(axis:index):"+chr(13)+chr(10)
	+"1130=gamepad_axis_value(device:index, axisIndex:index):"+chr(13)+chr(10)
	+"1131=gamepad_set_vibration(device, leftMotorSpeed, rightMotorSpeed)"+chr(13)+chr(10)
	+"1132=gamepad_set_color(index,color)"+chr(13)+chr(10)
	+"1133=gamepad_set_colour(index,colour)"+chr(13)+chr(10)
	+"1133=gamepad_set_color(index,colour)"+chr(13)+chr(10)
	+"1134=os_is_paused():"+chr(13)+chr(10)
	+"1135=window_has_focus():"+chr(13)+chr(10)
	+"1136=code_is_compiled():"+chr(13)+chr(10)
	+"1137=http_get(url):"+chr(13)+chr(10)
	+"1138=http_get_file(url, dest):"+chr(13)+chr(10)
	+"1139=http_post_string(:string,:string):"+chr(13)+chr(10)
	+"1140=http_request(url:string, method, header_map, body):"+chr(13)+chr(10)
	+"1141=json_encode(map:index):"+chr(13)+chr(10)
	+"1142=json_decode(:string):"+chr(13)+chr(10)
	+"1143=zip_unzip(file, destPath)"+chr(13)+chr(10)
	+"1144=base64_encode(:string):"+chr(13)+chr(10)
	+"1145=base64_decode(:string):"+chr(13)+chr(10)
	+"1146=md5_string_unicode(:string):"+chr(13)+chr(10)
	+"1147=md5_string_utf8(:string):"+chr(13)+chr(10)
	+"1148=md5_file(:string):"+chr(13)+chr(10)
	+"1149=os_is_network_connected():"+chr(13)+chr(10)
	+"1150=sha1_string_unicode(:string):"+chr(13)+chr(10)
	+"1151=sha1_string_utf8(:string):"+chr(13)+chr(10)
	+"1152=sha1_file(:string):"+chr(13)+chr(10)
	+"1153=os_powersave_enable(enable)"+chr(13)+chr(10)
	+"1154=physics_world_create(PixelToMetreScale):"+chr(13)+chr(10)
	+"1155=physics_world_gravity(gx, gy)"+chr(13)+chr(10)
	+"1156=physics_world_update_speed(speed)"+chr(13)+chr(10)
	+"1157=physics_world_update_iterations(iterations)"+chr(13)+chr(10)
	+"1158=physics_world_draw_debug(draw_flags)"+chr(13)+chr(10)
	+"1159=physics_pause_enable(pause)"+chr(13)+chr(10)
	+"1160=physics_fixture_create():"+chr(13)+chr(10)
	+"1161=physics_fixture_set_kinematic(fixture)"+chr(13)+chr(10)
	+"1162=physics_fixture_set_density(fixture, density)"+chr(13)+chr(10)
	+"1163=physics_fixture_set_awake(fixture, flag)"+chr(13)+chr(10)
	+"1164=physics_fixture_set_restitution(fixture, restitution)"+chr(13)+chr(10)
	+"1165=physics_fixture_set_friction(fixture,friction)"+chr(13)+chr(10)
	+"1166=physics_fixture_set_collision_group(fixture, group)"+chr(13)+chr(10)
	+"1167=physics_fixture_set_sensor(fixture, sensorState)"+chr(13)+chr(10)
	+"1168=physics_fixture_set_linear_damping(fixture, damping)"+chr(13)+chr(10)
	+"1169=physics_fixture_set_angular_damping(fixture, damping)"+chr(13)+chr(10)
	+"1170=physics_fixture_set_circle_shape(fixture, circleRadius)"+chr(13)+chr(10)
	+"1171=physics_fixture_set_box_shape(fixture, halfWidth, halfHeight)"+chr(13)+chr(10)
	+"1172=physics_fixture_set_edge_shape(fixture, local_x1, local_y1, local_x2, local_y2)"+chr(13)+chr(10)
	+"1173=physics_fixture_set_polygon_shape(fixture)"+chr(13)+chr(10)
	+"1174=physics_fixture_set_chain_shape(fixture, loop)"+chr(13)+chr(10)
	+"1175=physics_fixture_add_point(fixture, local_x, local_y)"+chr(13)+chr(10)
	+"1176=:physics_fixture_bind(fixture, obj)"+chr(13)+chr(10)
	+"1177=:physics_fixture_bind_ext(fixture, obj, xo, yo)"+chr(13)+chr(10)
	+"1178=physics_fixture_delete(fixture)"+chr(13)+chr(10)
	+"1179=:physics_apply_force(xpos, ypos, xforce, yforce)"+chr(13)+chr(10)
	+"1180=:physics_apply_impulse(xpos, ypos, ximpulse, yimpulse)"+chr(13)+chr(10)
	+"1181=:physics_apply_angular_impulse(impulse)"+chr(13)+chr(10)
	+"1182=:physics_apply_local_force(xlocal, ylocal, xforce_local, yforce_local)"+chr(13)+chr(10)
	+"1183=:physics_apply_local_impulse(xlocal, ylocal, ximpulse_local, yimpulse_local)"+chr(13)+chr(10)
	+"1184=:physics_apply_torque(torque)"+chr(13)+chr(10)
	+"1185=:physics_mass_properties(mass, local_centre_of_mass_x, local_centre_of_mass_y, inertia)"+chr(13)+chr(10)
	+"1186=:physics_draw_debug()"+chr(13)+chr(10)
	+"1187=:physics_test_overlap(x, y, angle, obj)"+chr(13)+chr(10)
	+"1188=physics_remove_fixture(inst, id)"+chr(13)+chr(10)
	+"1189=:physics_set_friction(fixture, friction)"+chr(13)+chr(10)
	+"1190=:physics_set_density(fixture, density)"+chr(13)+chr(10)
	+"1191=:physics_set_restitution(fixture, restitution)"+chr(13)+chr(10)
	+"1192=:physics_get_friction(fixture):"+chr(13)+chr(10)
	+"1193=:physics_get_density(fixture):"+chr(13)+chr(10)
	+"1194=:physics_get_restitution(fixture):"+chr(13)+chr(10)
	+"1195=physics_joint_distance_create(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, collideInstances):"+chr(13)+chr(10)
	+"1196=physics_joint_rope_create(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, maxLength, collideInstances):"+chr(13)+chr(10)
	+"1197=physics_joint_revolute_create(inst1, inst2, anchor_x, anchor_y, lower_angle_limit, upper_angle_limit, enable_limit, max_motor_torque, motor_speed, enable_motor, collideInstances):"+chr(13)+chr(10)
	+"1198=physics_joint_prismatic_create(inst1, inst2, anchor_x, anchor_y, axis_x, axis_y, lower_translation_limit, upper_translation_limit, enable_limit, max_motor_force, motor_speed, enable_motor, collideInstances):"+chr(13)+chr(10)
	+"1199=physics_joint_pulley_create(inst1, inst2, anchor_1_x, anchor_1_y, anchor_2_x, anchor_2_y, local_anchor_1_x, local_anchor_1_y, local_anchor_2_x, local_anchor_2_y, ratio, collideInstances):"+chr(13)+chr(10)
	+"1200=physics_joint_wheel_create(inst1, inst2, anchor_x, anchor_y, axis_x, axis_y, enableMotor, max_motor_torque, motor_speed, freq_hz, damping_ratio, collideInstances):"+chr(13)+chr(10)
	+"1201=physics_joint_weld_create(inst1, inst2, anchor_x, anchor_y, ref_angle, freq_hz, damping_ratio, collideInstances):"+chr(13)+chr(10)
	+"1202=physics_joint_friction_create(inst1, inst2, anchor_x, anchor_y, max_force, max_torque, collideInstances):"+chr(13)+chr(10)
	+"1203=physics_joint_gear_create(inst1, inst2, revoluteJoint, prismaticJoint, ratio):"+chr(13)+chr(10)
	+"1204=physics_joint_enable_motor(joint, motorState)"+chr(13)+chr(10)
	+"1205=physics_joint_get_value(joint, field):"+chr(13)+chr(10)
	+"1206=physics_joint_set_value(joint, field, value)"+chr(13)+chr(10)
	+"1207=physics_joint_delete(joint)"+chr(13)+chr(10)
	+"1208=physics_particle_create(typeflags, x, y, xv, yv, col, alpha, category):"+chr(13)+chr(10)
	+"1209=physics_particle_delete(ind)"+chr(13)+chr(10)
	+"1210=physics_particle_delete_region_circle(x, y, radius)"+chr(13)+chr(10)
	+"1211=physics_particle_delete_region_box(x, y, halfWidth, halfHeight)"+chr(13)+chr(10)
	+"1212=physics_particle_delete_region_poly(pointList)"+chr(13)+chr(10)
	+"1213=physics_particle_set_flags(ind, typeflags)"+chr(13)+chr(10)
	+"1214=physics_particle_set_category_flags(category, typeflags)"+chr(13)+chr(10)
	+"1215=physics_particle_draw(typemask, category, sprite, subimg)"+chr(13)+chr(10)
	+"1216=physics_particle_draw_ext(typemask, category, sprite, subimg, xscale, yscale, angle, col, alpha)"+chr(13)+chr(10)
	+"1217=physics_particle_count()"+chr(13)+chr(10)
	+"1218=physics_particle_get_data(buffer, dataFlags):"+chr(13)+chr(10)
	+"1219=physics_particle_get_data_particle(ind, buffer, dataFlags):"+chr(13)+chr(10)
	+"1220=physics_particle_group_begin(typeflags, groupflags, x, y, ang, xv, yv, angVelocity, col, alpha, strength, category)"+chr(13)+chr(10)
	+"1221=physics_particle_group_circle(radius)"+chr(13)+chr(10)
	+"1222=physics_particle_group_box(halfWidth, halfHeight)"+chr(13)+chr(10)
	+"1223=physics_particle_group_polygon()"+chr(13)+chr(10)
	+"1224=physics_particle_group_add_point(x, y)"+chr(13)+chr(10)
	+"1225=physics_particle_group_end()"+chr(13)+chr(10)
	+"1226=physics_particle_group_join(to, from)"+chr(13)+chr(10)
	+"1227=physics_particle_group_delete(ind)"+chr(13)+chr(10)
	+"1228=physics_particle_group_count(group)"+chr(13)+chr(10)
	+"1229=physics_particle_group_get_data(group, buffer, dataFlags):"+chr(13)+chr(10)
	+"1230=physics_particle_group_get_mass(group):"+chr(13)+chr(10)
	+"1231=physics_particle_group_get_inertia(group):"+chr(13)+chr(10)
	+"1232=physics_particle_group_get_centre_x(group):"+chr(13)+chr(10)
	+"1233=physics_particle_group_get_centre_y(group):"+chr(13)+chr(10)
	+"1234=physics_particle_group_get_vel_x(group):"+chr(13)+chr(10)
	+"1235=physics_particle_group_get_vel_y(group):"+chr(13)+chr(10)
	+"1236=physics_particle_group_get_ang_vel(group):"+chr(13)+chr(10)
	+"1237=physics_particle_group_get_x(group):"+chr(13)+chr(10)
	+"1238=physics_particle_group_get_y(group):"+chr(13)+chr(10)
	+"1239=physics_particle_group_get_angle(group):"+chr(13)+chr(10)
	+"1240=physics_particle_set_group_flags(group, groupflags)"+chr(13)+chr(10)
	+"1241=physics_particle_get_group_flags(group):"+chr(13)+chr(10)
	+"1242=physics_particle_get_max_count():"+chr(13)+chr(10)
	+"1243=physics_particle_get_radius():"+chr(13)+chr(10)
	+"1244=physics_particle_get_density():"+chr(13)+chr(10)
	+"1245=physics_particle_get_damping():"+chr(13)+chr(10)
	+"1246=physics_particle_get_gravity_scale():"+chr(13)+chr(10)
	+"1247=physics_particle_set_max_count(count)"+chr(13)+chr(10)
	+"1248=physics_particle_set_radius(radius)"+chr(13)+chr(10)
	+"1249=physics_particle_set_density(density)"+chr(13)+chr(10)
	+"1250=physics_particle_set_damping(damping)"+chr(13)+chr(10)
	+"1251=physics_particle_set_gravity_scale(scale)"+chr(13)+chr(10)
	+"1252=network_create_socket(type):"+chr(13)+chr(10)
	+"1253=network_create_socket_ext(type, port):"+chr(13)+chr(10)
	+"1254=network_create_server(type, port, maxclients):"+chr(13)+chr(10)
	+"1255=network_create_server_raw(type, port, maxclients):"+chr(13)+chr(10)
	+"1256=network_connect(socket, url, port)"+chr(13)+chr(10)
	+"1257=network_connect_raw(socket, url, port)"+chr(13)+chr(10)
	+"1258=network_send_packet(socket, bufferid, size)"+chr(13)+chr(10)
	+"1259=network_send_raw(socket, buffer_id, size)"+chr(13)+chr(10)
	+"1260=network_send_broadcast(socket, port, bufferid, size)"+chr(13)+chr(10)
	+"1261=network_send_udp(socket, URL, port, data, size)"+chr(13)+chr(10)
	+"1262=network_send_udp_raw(socket, URL, port, data, size)"+chr(13)+chr(10)
	+"1263=network_set_timeout(socket, read, write)"+chr(13)+chr(10)
	+"1264=network_set_config(parameter, value)"+chr(13)+chr(10)
	+"1265=network_resolve(url)"+chr(13)+chr(10)
	+"1266=network_destroy(socket)"+chr(13)+chr(10)
	+"1267=buffer_create(size, buffer_type, alignment):"+chr(13)+chr(10)
	+"1268=buffer_write(buffer, type, value)"+chr(13)+chr(10)
	+"1269=buffer_read(buffer, type):"+chr(13)+chr(10)
	+"1270=buffer_seek(buffer, base, offset)"+chr(13)+chr(10)
	+"1271=buffer_get_surface(buffer, surface, mode, offset, modulo):"+chr(13)+chr(10)
	+"1272=buffer_set_surface(buffer, surface, mode, offset, modulo)"+chr(13)+chr(10)
	+"1273=buffer_delete(buffer)"+chr(13)+chr(10)
	+"1274=buffer_exists(buffer):"+chr(13)+chr(10)
	+"1275=buffer_get_type(buffer):"+chr(13)+chr(10)
	+"1276=buffer_get_alignment(buffer):"+chr(13)+chr(10)
	+"1277=buffer_poke(buffer, offset, type, value)"+chr(13)+chr(10)
	+"1278=buffer_peek(:buffer, offset:int, type:index):"+chr(13)+chr(10)
	+"1279=buffer_save(buffer, filename)"+chr(13)+chr(10)
	+"1280=buffer_save_ext(buffer, filename, offset, size)"+chr(13)+chr(10)
	+"1281=buffer_load(filename):"+chr(13)+chr(10)
	+"1282=buffer_load_ext(buffer, filename, offset):"+chr(13)+chr(10)
	+"1283=buffer_load_partial(buffer, filename, src_offset, src_len, dest_offset):"+chr(13)+chr(10)
	+"1284=buffer_copy(src_buffer, src_offset, size, dest_buffer, dest_offset)"+chr(13)+chr(10)
	+"1285=buffer_fill(buffer, offset, type, value, size)"+chr(13)+chr(10)
	+"1286=buffer_get_size(buffer):"+chr(13)+chr(10)
	+"1287=buffer_tell(:buffer):"+chr(13)+chr(10)
	+"1288=buffer_resize(buffer, newsize)"+chr(13)+chr(10)
	+"1289=buffer_md5(:buffer, offset:int, size:int):"+chr(13)+chr(10)
	+"1290=buffer_sha1(:buffer, offset:int, size:int):"+chr(13)+chr(10)
	+"1291=buffer_base64_encode(:buffer, offset:int, size:int):"+chr(13)+chr(10)
	+"1292=buffer_base64_decode(:string):"+chr(13)+chr(10)
	+"1293=buffer_base64_decode_ext(:buffer, :string, offset:int):"+chr(13)+chr(10)
	+"1294=buffer_sizeof(type:index):"+chr(13)+chr(10)
	+"1295=buffer_get_address(buffer):"+chr(13)+chr(10)
	+"1296=buffer_create_from_vertex_buffer(vertex_buffer, type, alignment):"+chr(13)+chr(10)
	+"1297=buffer_create_from_vertex_buffer_ext(vertex_buffer, type, alignment, start_vertex, num_vertices):"+chr(13)+chr(10)
	+"1298=buffer_copy_from_vertex_buffer(vertex_buffer, start_vertex, num_vertices, dest_buffer, dest_offset)"+chr(13)+chr(10)
	+"1299=buffer_async_group_begin(groupname)"+chr(13)+chr(10)
	+"1300=buffer_async_group_option(optionname,optionvalue)"+chr(13)+chr(10)
	+"1301=buffer_async_group_end()"+chr(13)+chr(10)
	+"1302=buffer_load_async(bufferid,filename,offset,size):"+chr(13)+chr(10)
	+"1303=buffer_save_async(bufferid,filename,offset,size)"+chr(13)+chr(10)
	+"1304=gml_release_mode(enable)"+chr(13)+chr(10)
	+"1305=steam_activate_overlay(overlayIndex)"+chr(13)+chr(10)
	+"1306=steam_is_overlay_enabled():"+chr(13)+chr(10)
	+"1307=steam_is_overlay_activated():"+chr(13)+chr(10)
	+"1308=steam_get_persona_name():"+chr(13)+chr(10)
	+"1309=steam_initialised():"+chr(13)+chr(10)
	+"1310=steam_is_cloud_enabled_for_app():"+chr(13)+chr(10)
	+"1311=steam_is_cloud_enabled_for_account():"+chr(13)+chr(10)
	+"1312=steam_file_persisted(:string):"+chr(13)+chr(10)
	+"1313=steam_get_quota_total():"+chr(13)+chr(10)
	+"1314=steam_get_quota_free():"+chr(13)+chr(10)
	+"1315=steam_file_write(:string, data, :number):"+chr(13)+chr(10)
	+"1316=steam_file_write_file(:string, :string):"+chr(13)+chr(10)
	+"1317=steam_file_read(filename):"+chr(13)+chr(10)
	+"1318=steam_file_delete(filename)"+chr(13)+chr(10)
	+"1319=steam_file_exists(filename):"+chr(13)+chr(10)
	+"1320=steam_file_size(filename):"+chr(13)+chr(10)
	+"1321=steam_file_share(filename)"+chr(13)+chr(10)
	+"1322=steam_publish_workshop_file(filename, previewImage,title,description)"+chr(13)+chr(10)
	+"1323=steam_is_screenshot_requested():"+chr(13)+chr(10)
	+"1324=steam_send_screenshot(filename,width,height)"+chr(13)+chr(10)
	+"1325=steam_is_user_logged_on():"+chr(13)+chr(10)
	+"1326=steam_get_user_steam_id():"+chr(13)+chr(10)
	+"1327=steam_user_owns_dlc(_id):"+chr(13)+chr(10)
	+"1328=steam_user_installed_dlc(_id):"+chr(13)+chr(10)
	+"1329=steam_set_achievement(ach_name)"+chr(13)+chr(10)
	+"1330=steam_get_achievement(ach_name):"+chr(13)+chr(10)
	+"1331=steam_clear_achievement(ach_name)"+chr(13)+chr(10)
	+"1332=steam_set_stat_int(stat_name,value)"+chr(13)+chr(10)
	+"1333=steam_set_stat_float(stat_name,value)"+chr(13)+chr(10)
	+"1334=steam_set_stat_avg_rate(stat_name,session_count,session_length)"+chr(13)+chr(10)
	+"1335=steam_get_stat_int(stat_name):"+chr(13)+chr(10)
	+"1336=steam_get_stat_float(stat_name):"+chr(13)+chr(10)
	+"1337=steam_get_stat_avg_rate(stat_name):"+chr(13)+chr(10)
	+"1338=steam_reset_all_stats()"+chr(13)+chr(10)
	+"1339=steam_reset_all_stats_achievements()"+chr(13)+chr(10)
	+"1340=steam_stats_ready():"+chr(13)+chr(10)
	+"1341=steam_create_leaderboard(lb_name,sort_method,display_type):"+chr(13)+chr(10)
	+"1342=steam_upload_score(:string, :number):"+chr(13)+chr(10)
	+"1343=steam_upload_score_ext(:string, :number, :bool):"+chr(13)+chr(10)
	+"1344=steam_download_scores_around_user(lb_name,range_start,range_end):"+chr(13)+chr(10)
	+"1345=steam_download_scores(lb_name,start_idx,end_idx):"+chr(13)+chr(10)
	+"1346=steam_download_friends_scores(lb_name):"+chr(13)+chr(10)
	+"1347=steam_upload_score_buffer(lb_name, score, buffer_id):"+chr(13)+chr(10)
	+"1348=steam_upload_score_buffer_ext(lb_name, score, buffer_id, forceupdate):"+chr(13)+chr(10)
	+"1349=steam_current_game_language():"+chr(13)+chr(10)
	+"1350=steam_available_languages():"+chr(13)+chr(10)
	+"1351=steam_activate_overlay_browser(url)"+chr(13)+chr(10)
	+"1352=steam_activate_overlay_user(dialog_name, steamid)"+chr(13)+chr(10)
	+"1353=steam_activate_overlay_store(app_id)"+chr(13)+chr(10)
	+"1354=steam_get_user_persona_name(steam_id):"+chr(13)+chr(10)
	+"1355=steam_get_app_id():"+chr(13)+chr(10)
	+"1356=steam_get_user_account_id():"+chr(13)+chr(10)
	+"1357=steam_ugc_download(ugc_handle, dest_filename):"+chr(13)+chr(10)
	+"1358=steam_ugc_create_item(consumer_app_id, file_type):"+chr(13)+chr(10)
	+"1359=steam_ugc_start_item_update(consumer_app_id, published_file_id)"+chr(13)+chr(10)
	+"1360=steam_ugc_set_item_title(ugc_update_handle, title)"+chr(13)+chr(10)
	+"1361=steam_ugc_set_item_description(ugc_update_handle, description)"+chr(13)+chr(10)
	+"1362=steam_ugc_set_item_visibility(ugc_update_handle, visibility)"+chr(13)+chr(10)
	+"1363=steam_ugc_set_item_tags(ugc_update_handle, tag_array)"+chr(13)+chr(10)
	+"1364=steam_ugc_set_item_content(ugc_update_handle, directory)"+chr(13)+chr(10)
	+"1365=steam_ugc_set_item_preview(ugc_update_handle, image_path)"+chr(13)+chr(10)
	+"1366=steam_ugc_submit_item_update(ugc_update_handle, change_note):"+chr(13)+chr(10)
	+"1367=steam_ugc_get_item_update_progress(ugc_update_handle, info_map):"+chr(13)+chr(10)
	+"1368=steam_ugc_subscribe_item(published_file_id):"+chr(13)+chr(10)
	+"1369=steam_ugc_unsubscribe_item(published_file_id):"+chr(13)+chr(10)
	+"1370=steam_ugc_num_subscribed_items():"+chr(13)+chr(10)
	+"1371=steam_ugc_get_subscribed_items(item_list):"+chr(13)+chr(10)
	+"1372=steam_ugc_get_item_install_info(published_file_id, info_map):"+chr(13)+chr(10)
	+"1373=steam_ugc_get_item_update_info(published_file_id, info_map):"+chr(13)+chr(10)
	+"1374=steam_ugc_request_item_details(published_file_id, max_age_seconds):"+chr(13)+chr(10)
	+"1375=steam_ugc_create_query_user(list_type, match_type, sort_order, page):"+chr(13)+chr(10)
	+"1376=steam_ugc_create_query_user_ex(list_type, match_type, sort_order, page, account_id, creator_app_id, consumer_app_id):"+chr(13)+chr(10)
	+"1377=steam_ugc_create_query_all(query_type, match_type, page):"+chr(13)+chr(10)
	+"1378=steam_ugc_create_query_all_ex(query_type, match_type, page, creator_app_id, consumer_app_id):"+chr(13)+chr(10)
	+"1379=steam_ugc_query_set_cloud_filename_filter(ugc_query_handle , match_cloud_filename):"+chr(13)+chr(10)
	+"1380=steam_ugc_query_set_match_any_tag(ugc_query_handle, match_any_tag)"+chr(13)+chr(10)
	+"1381=steam_ugc_query_set_search_text(ugc_query_handle, search_text)"+chr(13)+chr(10)
	+"1382=steam_ugc_query_set_ranked_by_trend_days(ugc_query_handle , days)"+chr(13)+chr(10)
	+"1383=steam_ugc_query_add_required_tag(ugc_query_handle, tag_name)"+chr(13)+chr(10)
	+"1384=steam_ugc_query_add_excluded_tag(ugc_query_handle, tag_name)"+chr(13)+chr(10)
	+"1385=steam_ugc_query_set_return_long_description(ugc_query_handle, return_long_desc)"+chr(13)+chr(10)
	+"1386=steam_ugc_query_set_return_total_only(ugc_query_handle, return_total_only)"+chr(13)+chr(10)
	+"1387=steam_ugc_query_set_allow_cached_response(ugc_query_handle, max_age_seconds)"+chr(13)+chr(10)
	+"1388=steam_ugc_send_query(ugc_query_handle)"+chr(13)+chr(10)
	+"1389=shader_set(shader)"+chr(13)+chr(10)
	+"1390=shader_reset()"+chr(13)+chr(10)
	+"1391=shader_current():"+chr(13)+chr(10)
	+"1392=shader_is_compiled(shader):"+chr(13)+chr(10)
	+"1393=shader_get_sampler_index(shader,uniform_name):"+chr(13)+chr(10)
	+"1394=shader_get_uniform(shader,uniform_name):"+chr(13)+chr(10)
	+"1395=shader_set_uniform_i(uniform_id,val,....)"+chr(13)+chr(10)
	+"1396=shader_set_uniform_i_array(uniform_id,array)"+chr(13)+chr(10)
	+"1397=shader_set_uniform_f(uniform_id,val,....)"+chr(13)+chr(10)
	+"1398=shader_set_uniform_f_array(uniform_id,array)"+chr(13)+chr(10)
	+"1399=shader_set_uniform_matrix(uniform_id)"+chr(13)+chr(10)
	+"1400=shader_set_uniform_matrix_array(uniform_id,array)"+chr(13)+chr(10)
	+"1401=shader_enable_corner_id(enable)"+chr(13)+chr(10)
	+"1402=texture_set_stage(sampled_id, texture_id)"+chr(13)+chr(10)
	+"1403=texture_get_texel_width(texture_id):"+chr(13)+chr(10)
	+"1404=texture_get_texel_height(texture_id):"+chr(13)+chr(10)
	+"1405=shaders_are_supported():"+chr(13)+chr(10)
	+"1406=vertex_format_begin()"+chr(13)+chr(10)
	+"1407=vertex_format_end()"+chr(13)+chr(10)
	+"1408=vertex_format_delete(format_id)"+chr(13)+chr(10)
	+"1409=vertex_format_add_position()"+chr(13)+chr(10)
	+"1410=vertex_format_add_position_3d()"+chr(13)+chr(10)
	+"1411=vertex_format_add_colour()"+chr(13)+chr(10)
	+"1411=vertex_format_add_color()"+chr(13)+chr(10)
	+"1412=vertex_format_add_normal()"+chr(13)+chr(10)
	+"1413=vertex_format_add_textcoord()"+chr(13)+chr(10)
	+"1414=vertex_format_add_custom(type,usage)"+chr(13)+chr(10)
	+"1415=vertex_create_buffer():"+chr(13)+chr(10)
	+"1416=vertex_create_buffer_ext(size):"+chr(13)+chr(10)
	+"1417=vertex_delete_buffer(vbuff)"+chr(13)+chr(10)
	+"1418=vertex_begin(vbuff,format)"+chr(13)+chr(10)
	+"1419=vertex_end(vbuff)"+chr(13)+chr(10)
	+"1420=vertex_position(vbuff,x,y)"+chr(13)+chr(10)
	+"1421=vertex_position_3d(vbuff,x,y,z)"+chr(13)+chr(10)
	+"1422=vertex_colour(vbuff,colour,alpha)"+chr(13)+chr(10)
	+"1422=vertex_color(vbuff,colour,alpha)"+chr(13)+chr(10)
	+"1423=vertex_argb(vbuff,argb)"+chr(13)+chr(10)
	+"1424=vertex_texcoord(vbuff,u,v)"+chr(13)+chr(10)
	+"1425=vertex_normal(vbuff,nx,ny,nz)"+chr(13)+chr(10)
	+"1426=vertex_float1(vbuff,f1)"+chr(13)+chr(10)
	+"1427=vertex_float2(vbuff,f1,f2)"+chr(13)+chr(10)
	+"1428=vertex_float3(vbuff,f1,f2,f3)"+chr(13)+chr(10)
	+"1429=vertex_float4(vbuff,f1,f2,f3,f4)"+chr(13)+chr(10)
	+"1430=vertex_ubyte4(vbuff,b1,b2,b3,b4)"+chr(13)+chr(10)
	+"1431=vertex_submit(vbuff,prim,texture)"+chr(13)+chr(10)
	+"1432=vertex_freeze(vbuff)"+chr(13)+chr(10)
	+"1433=vertex_get_number(vbuff):"+chr(13)+chr(10)
	+"1434=vertex_get_buffer_size(vbuff):"+chr(13)+chr(10)
	+"1435=vertex_create_buffer_from_buffer(src_buffer,format):"+chr(13)+chr(10)
	+"1436=vertex_create_buffer_from_buffer_ext(src_buffer,format,src_offset,num_vertices):"+chr(13)+chr(10)
	+"1437=:skeleton_animation_set(anim_name)"+chr(13)+chr(10)
	+"1438=:skeleton_animation_get():"+chr(13)+chr(10)
	+"1439=:skeleton_animation_mix(anim_from,anim_to,duration)"+chr(13)+chr(10)
	+"1440=:skeleton_animation_set_ext(anim_name, track)"+chr(13)+chr(10)
	+"1441=:skeleton_animation_get_ext(track):"+chr(13)+chr(10)
	+"1442=:skeleton_animation_get_duration(anim_name):"+chr(13)+chr(10)
	+"1443=:skeleton_animation_get_frames(anim_name):"+chr(13)+chr(10)
	+"1444=:skeleton_animation_clear(track)"+chr(13)+chr(10)
	+"1445=:skeleton_skin_set(skin_name)"+chr(13)+chr(10)
	+"1446=:skeleton_skin_get():"+chr(13)+chr(10)
	+"1447=:skeleton_attachment_set(slot, attachment)"+chr(13)+chr(10)
	+"1448=:skeleton_attachment_get(slot):"+chr(13)+chr(10)
	+"1449=:skeleton_attachment_create(name,sprite,ind,xo,yo,xs,ys,rot):"+chr(13)+chr(10)
	+"1450=:skeleton_collision_draw_set(val)"+chr(13)+chr(10)
	+"1451=:skeleton_bone_data_get(bone, map):"+chr(13)+chr(10)
	+"1452=:skeleton_bone_data_set(bone, map)"+chr(13)+chr(10)
	+"1453=:skeleton_bone_state_get(bone, map):"+chr(13)+chr(10)
	+"1454=:skeleton_bone_state_set(bone, map)"+chr(13)+chr(10)
	+"1455=:skeleton_animation_get_frame(track):"+chr(13)+chr(10)
	+"1456=:skeleton_animation_set_frame(track,index)"+chr(13)+chr(10)
	+"1457=:skeleton_get_minmax():"+chr(13)+chr(10)
	+"1458=:skeleton_get_num_bounds():"+chr(13)+chr(10)
	+"1459=:skeleton_get_bounds(index):"+chr(13)+chr(10)
	+"1460=draw_skeleton(sprite,animname,skinname,frame,x,y,xscale,yscale,rot,colour,alpha)"+chr(13)+chr(10)
	+"1461=draw_skeleton_time(sprite, animname,skinname, time, x,y, xscale,yscale, rot, colour,alpha)"+chr(13)+chr(10)
	+"1462=draw_skeleton_instance(instance,animname,skinname,frame,x,y,xscale,yscale,rot,colour,alpha)"+chr(13)+chr(10)
	+"1463=draw_skeleton_collision(sprite,animname,frame,x,y,xscale,yscale,rot,colour)"+chr(13)+chr(10)
	+"1464=skeleton_animation_list(sprite, list)"+chr(13)+chr(10)
	+"1465=skeleton_skin_list(sprite, list)"+chr(13)+chr(10)
	+"1466=skeleton_slot_data(sprite, list)");
l_gmlVars=("1467=gravity"+chr(13)+chr(10)
	+"1468=gravity_direction"+chr(13)+chr(10)
	+"1469=instance_count*"+chr(13)+chr(10)
	+"1470=instance_id*"+chr(13)+chr(10)
	+"1471=room_speed"+chr(13)+chr(10)
	+"1472=fps*"+chr(13)+chr(10)
	+"1473=fps_real*"+chr(13)+chr(10)
	+"1474=current_time*"+chr(13)+chr(10)
	+"1475=current_year*"+chr(13)+chr(10)
	+"1476=current_month*"+chr(13)+chr(10)
	+"1477=current_day*"+chr(13)+chr(10)
	+"1478=current_weekday*"+chr(13)+chr(10)
	+"1479=current_hour*"+chr(13)+chr(10)
	+"1480=current_minute*"+chr(13)+chr(10)
	+"1481=current_second*"+chr(13)+chr(10)
	+"1482=room*"+chr(13)+chr(10)
	+"1483=room_first*"+chr(13)+chr(10)
	+"1484=room_last*"+chr(13)+chr(10)
	+"1485=room_width*"+chr(13)+chr(10)
	+"1486=room_height*"+chr(13)+chr(10)
	+"1487=room_caption"+chr(13)+chr(10)
	+"1488=room_persistent"+chr(13)+chr(10)
	+"1489=score"+chr(13)+chr(10)
	+"1490=lives"+chr(13)+chr(10)
	+"1491=health"+chr(13)+chr(10)
	+"1492=event_type*"+chr(13)+chr(10)
	+"1493=event_number*"+chr(13)+chr(10)
	+"1494=event_object*"+chr(13)+chr(10)
	+"1495=event_action*"+chr(13)+chr(10)
	+"1496=application_surface*"+chr(13)+chr(10)
	+"1497=debug_mode*"+chr(13)+chr(10)
	+"1498=keyboard_key"+chr(13)+chr(10)
	+"1499=keyboard_lastkey"+chr(13)+chr(10)
	+"1500=keyboard_lastchar"+chr(13)+chr(10)
	+"1501=keyboard_string"+chr(13)+chr(10)
	+"1502=mouse_x*"+chr(13)+chr(10)
	+"1503=mouse_y*"+chr(13)+chr(10)
	+"1504=mouse_button"+chr(13)+chr(10)
	+"1505=mouse_lastbutton"+chr(13)+chr(10)
	+"1506=cursor_sprite"+chr(13)+chr(10)
	+"1507=background_colour"+chr(13)+chr(10)
	+"1508=background_showcolour"+chr(13)+chr(10)
	+"1509=background_visible[]"+chr(13)+chr(10)
	+"1510=background_foreground[]"+chr(13)+chr(10)
	+"1511=background_index[]"+chr(13)+chr(10)
	+"1512=background_x[]"+chr(13)+chr(10)
	+"1513=background_y[]"+chr(13)+chr(10)
	+"1514=background_width[]*"+chr(13)+chr(10)
	+"1515=background_height[]*"+chr(13)+chr(10)
	+"1516=background_htiled[]"+chr(13)+chr(10)
	+"1517=background_vtiled[]"+chr(13)+chr(10)
	+"1518=background_xscale[]"+chr(13)+chr(10)
	+"1519=background_yscale[]"+chr(13)+chr(10)
	+"1520=background_hspeed[]"+chr(13)+chr(10)
	+"1521=background_vspeed[]"+chr(13)+chr(10)
	+"1522=background_blend[]"+chr(13)+chr(10)
	+"1523=background_alpha[]"+chr(13)+chr(10)
	+"1524=view_enabled"+chr(13)+chr(10)
	+"1525=view_current*"+chr(13)+chr(10)
	+"1526=view_visible[]"+chr(13)+chr(10)
	+"1527=view_xview[]"+chr(13)+chr(10)
	+"1528=view_yview[]"+chr(13)+chr(10)
	+"1529=view_wview[]"+chr(13)+chr(10)
	+"1530=view_hview[]"+chr(13)+chr(10)
	+"1531=view_xport[]"+chr(13)+chr(10)
	+"1532=view_yport[]"+chr(13)+chr(10)
	+"1533=view_wport[]"+chr(13)+chr(10)
	+"1534=view_hport[]"+chr(13)+chr(10)
	+"1535=view_angle[]"+chr(13)+chr(10)
	+"1536=view_hborder[]"+chr(13)+chr(10)
	+"1537=view_vborder[]"+chr(13)+chr(10)
	+"1538=view_hspeed[]"+chr(13)+chr(10)
	+"1539=view_vspeed[]"+chr(13)+chr(10)
	+"1540=view_object[]"+chr(13)+chr(10)
	+"1541=view_surface_id[]"+chr(13)+chr(10)
	+"1542=game_id*"+chr(13)+chr(10)
	+"1543=game_display_name*"+chr(13)+chr(10)
	+"1544=game_project_name*"+chr(13)+chr(10)
	+"1545=game_save_id*"+chr(13)+chr(10)
	+"1546=working_directory*"+chr(13)+chr(10)
	+"1547=temp_directory*"+chr(13)+chr(10)
	+"1548=program_directory*"+chr(13)+chr(10)
	+"1549=browser_width*"+chr(13)+chr(10)
	+"1550=browser_height*"+chr(13)+chr(10)
	+"1551=os_type*"+chr(13)+chr(10)
	+"1552=os_device*"+chr(13)+chr(10)
	+"1553=os_browser*"+chr(13)+chr(10)
	+"1554=os_version*"+chr(13)+chr(10)
	+"1555=display_aa*"+chr(13)+chr(10)
	+"1556=async_load*"+chr(13)+chr(10)
	+"1557=delta_time*"+chr(13)+chr(10)
	+"1558=webgl_enabled*");
var l_lines=file_text_open_from_string(l_gmlFuncs);
while(!file_text_eof(l_lines)){
	var l_line=file_text_read_string(l_lines);
	file_text_readln(l_lines);
	var l_sep=string_pos("=",l_line);
	gml_func_add(string_delete(l_line,1,l_sep),live_script_get_index("__lnc__f"+string_copy(l_line,1,l_sep-1)));
}
file_text_close(l_lines);
l_lines=file_text_open_from_string(l_gmlVars);
while(!file_text_eof(l_lines)){
	var l_line1=file_text_read_string(l_lines);
	file_text_readln(l_lines);
	var l_sep1=string_pos("=",l_line1);
	gml_var_add(string_delete(l_line1,1,l_sep1),live_script_get_index("__lnc__f"+string_copy(l_line1,1,l_sep1-1)));
}
file_text_close(l_lines);
__lnc_const_decl();

#define __lnc__lf
/// __lnc__lf(...w:real)->real
if (live_enabled) {
	var l_n=argument_count;
	if(l_n==0)return 0;
	var l_r=argument[0];
	for(var l_i=1;l_i<l_n;l_i+=1){
		var l_v=argument[l_i];
		if(l_v<l_r)l_r=l_v;
	}
	return l_r;
} else return 0;

#define __lnc__lf1
/// __lnc__lf1(...w1:real)->real
if (live_enabled) {
	var l_n1=argument_count;
	if(l_n1==0)return 0;
	var l_r1=argument[0];
	for(var l_i1=1;l_i1<l_n1;l_i1+=1){
		var l_v1=argument[l_i1];
		if(l_v1>l_r1)l_r1=l_v1;
	}
	return l_r1;
} else return 0;

#define __lnc__lf2
/// __lnc__lf2(...args1:dynamic)->Any
if (live_enabled) {
	return argument[irandom(argument_count-1)];
} else return undefined;

#define __lnc__lf3
/// __lnc__lf3(...m:dynamic)->?
if (live_enabled) {
	switch(argument_count){
		case 0:return gml_thread_error("Too few arguments for script_execute.");
		case 1:return script_execute(argument[0]);
		case 2:return script_execute(argument[0],argument[1]);
		case 3:return script_execute(argument[0],argument[1],argument[2]);
		case 4:return script_execute(argument[0],argument[1],argument[2],argument[3]);
		case 5:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return script_execute(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return gml_thread_error("Too many arguments for script_execute.");
	}
} else return undefined;

#define __lnc__lf4
/// __lnc__lf4(...m1:dynamic)
if (live_enabled) {
	switch(argument_count){
		case 0:instance_destroy();break;
		case 1:instance_destroy(argument[0]);break;
		case 2:instance_destroy(argument[0],argument[1]);break;
		default:gml_thread_error("Too many arguments for instance_destroy.");
	}
}

#define __lnc__lf5
/// __lnc__lf5(...m2:dynamic)
if (live_enabled) {
	var l_setting=argument[0];
}

#define __lnc__lf6
/// __lnc__lf6(...m3:dynamic)
if (live_enabled) {
	ds_list_set(argument0,argument1,argument2);
}

#define __lnc__f0
/// __lnc__f0()->Any
if (live_enabled) {
	return is_bool(argument0);
} else return undefined;

#define __lnc__f1
/// __lnc__f1()->Any
if (live_enabled) {
	return is_real(argument0);
} else return undefined;

#define __lnc__f2
/// __lnc__f2()->Any
if (live_enabled) {
	return is_string(argument0);
} else return undefined;

#define __lnc__f3
/// __lnc__f3()->Any
if (live_enabled) {
	return is_array(argument0);
} else return undefined;

#define __lnc__f4
/// __lnc__f4()->Any
if (live_enabled) {
	return is_undefined(argument0);
} else return undefined;

#define __lnc__f5
/// __lnc__f5()->Any
if (live_enabled) {
	return is_int32(argument0);
} else return undefined;

#define __lnc__f6
/// __lnc__f6()->Any
if (live_enabled) {
	return is_int64(argument0);
} else return undefined;

#define __lnc__f7
/// __lnc__f7()->Any
if (live_enabled) {
	return is_ptr(argument0);
} else return undefined;

#define __lnc__f8
/// __lnc__f8()->Any
if (live_enabled) {
	return is_vec3(argument0);
} else return undefined;

#define __lnc__f9
/// __lnc__f9()->Any
if (live_enabled) {
	return is_vec4(argument0);
} else return undefined;

#define __lnc__f10
/// __lnc__f10()->Any
if (live_enabled) {
	return is_matrix(argument0);
} else return undefined;

#define __lnc__f11
/// __lnc__f11()->Any
if (live_enabled) {
	return typeof(argument0);
} else return undefined;

#define __lnc__f12
/// __lnc__f12()->Any
if (live_enabled) {
	return variable_global_exists(argument0);
} else return undefined;

#define __lnc__f13
/// __lnc__f13()->Any
if (live_enabled) {
	return variable_global_get(argument0);
} else return undefined;

#define __lnc__f14
/// __lnc__f14()
if (live_enabled) {
	variable_global_set(argument0,argument1);
}

#define __lnc__f15
/// __lnc__f15()->Any
if (live_enabled) {
	return variable_instance_exists(argument0,argument1);
} else return undefined;

#define __lnc__f16
/// __lnc__f16()->Any
if (live_enabled) {
	return variable_instance_get(argument0,argument1);
} else return undefined;

#define __lnc__f17
/// __lnc__f17()
if (live_enabled) {
	variable_instance_set(argument0,argument1,argument2);
}

#define __lnc__f18
/// __lnc__f18()->Any
if (live_enabled) {
	return variable_instance_get_names(argument0);
} else return undefined;

#define __lnc__f19
/// __lnc__f19()->Any
if (live_enabled) {
	return array_length_1d(argument0);
} else return undefined;

#define __lnc__f20
/// __lnc__f20()->Any
if (live_enabled) {
	return array_length_2d(argument0,argument1);
} else return undefined;

#define __lnc__f21
/// __lnc__f21()->Any
if (live_enabled) {
	return array_height_2d(argument0);
} else return undefined;

#define __lnc__f22
/// __lnc__f22()->Any
if (live_enabled) {
	return array_equals(argument0,argument1);
} else return undefined;

#define __lnc__f23
/// __lnc__f23()->Any
if (live_enabled) {
	return array_create(argument0);
} else return undefined;

#define __lnc__f24
/// __lnc__f24()
if (live_enabled) {
	array_copy(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f25
/// __lnc__f25()->Any
if (live_enabled) {
	return random(argument0);
} else return undefined;

#define __lnc__f26
/// __lnc__f26()->Any
if (live_enabled) {
	return random_range(argument0,argument1);
} else return undefined;

#define __lnc__f27
/// __lnc__f27()->Any
if (live_enabled) {
	return irandom(argument0);
} else return undefined;

#define __lnc__f28
/// __lnc__f28()->Any
if (live_enabled) {
	return irandom_range(argument0,argument1);
} else return undefined;

#define __lnc__f29
/// __lnc__f29()
if (live_enabled) {
	random_set_seed(argument0);
}

#define __lnc__f30
/// __lnc__f30()->Any
if (live_enabled) {
	return random_get_seed();
} else return undefined;

#define __lnc__f31
/// __lnc__f31()
if (live_enabled) {
	random_use_old_version(argument0);
}

#define __lnc__f32
/// __lnc__f32()->Any
if (live_enabled) {
	return randomize();
} else return undefined;

#define __lnc__f33
/// __lnc__f33()->Any
if (live_enabled) {
	return abs(argument0);
} else return undefined;

#define __lnc__f34
/// __lnc__f34()->Any
if (live_enabled) {
	return round(argument0);
} else return undefined;

#define __lnc__f35
/// __lnc__f35()->Any
if (live_enabled) {
	return floor(argument0);
} else return undefined;

#define __lnc__f36
/// __lnc__f36()->Any
if (live_enabled) {
	return ceil(argument0);
} else return undefined;

#define __lnc__f37
/// __lnc__f37()->Any
if (live_enabled) {
	return sign(argument0);
} else return undefined;

#define __lnc__f38
/// __lnc__f38()->Any
if (live_enabled) {
	return frac(argument0);
} else return undefined;

#define __lnc__f39
/// __lnc__f39()->Any
if (live_enabled) {
	return sqrt(argument0);
} else return undefined;

#define __lnc__f40
/// __lnc__f40()->Any
if (live_enabled) {
	return sqr(argument0);
} else return undefined;

#define __lnc__f41
/// __lnc__f41()->Any
if (live_enabled) {
	return exp(argument0);
} else return undefined;

#define __lnc__f42
/// __lnc__f42()->Any
if (live_enabled) {
	return ln(argument0);
} else return undefined;

#define __lnc__f43
/// __lnc__f43()->Any
if (live_enabled) {
	return log2(argument0);
} else return undefined;

#define __lnc__f44
/// __lnc__f44()->Any
if (live_enabled) {
	return log10(argument0);
} else return undefined;

#define __lnc__f45
/// __lnc__f45()->Any
if (live_enabled) {
	return sin(argument0);
} else return undefined;

#define __lnc__f46
/// __lnc__f46()->Any
if (live_enabled) {
	return cos(argument0);
} else return undefined;

#define __lnc__f47
/// __lnc__f47()->Any
if (live_enabled) {
	return tan(argument0);
} else return undefined;

#define __lnc__f48
/// __lnc__f48()->Any
if (live_enabled) {
	return arcsin(argument0);
} else return undefined;

#define __lnc__f49
/// __lnc__f49()->Any
if (live_enabled) {
	return arccos(argument0);
} else return undefined;

#define __lnc__f50
/// __lnc__f50()->Any
if (live_enabled) {
	return arctan(argument0);
} else return undefined;

#define __lnc__f51
/// __lnc__f51()->Any
if (live_enabled) {
	return arctan2(argument0,argument1);
} else return undefined;

#define __lnc__f52
/// __lnc__f52()->Any
if (live_enabled) {
	return dsin(argument0);
} else return undefined;

#define __lnc__f53
/// __lnc__f53()->Any
if (live_enabled) {
	return dcos(argument0);
} else return undefined;

#define __lnc__f54
/// __lnc__f54()->Any
if (live_enabled) {
	return dtan(argument0);
} else return undefined;

#define __lnc__f55
/// __lnc__f55()->Any
if (live_enabled) {
	return darcsin(argument0);
} else return undefined;

#define __lnc__f56
/// __lnc__f56()->Any
if (live_enabled) {
	return darccos(argument0);
} else return undefined;

#define __lnc__f57
/// __lnc__f57()->Any
if (live_enabled) {
	return darctan(argument0);
} else return undefined;

#define __lnc__f58
/// __lnc__f58()->Any
if (live_enabled) {
	return darctan2(argument0,argument1);
} else return undefined;

#define __lnc__f59
/// __lnc__f59()->Any
if (live_enabled) {
	return degtorad(argument0);
} else return undefined;

#define __lnc__f60
/// __lnc__f60()->Any
if (live_enabled) {
	return radtodeg(argument0);
} else return undefined;

#define __lnc__f61
/// __lnc__f61()->Any
if (live_enabled) {
	return power(argument0,argument1);
} else return undefined;

#define __lnc__f62
/// __lnc__f62()->Any
if (live_enabled) {
	return logn(argument0,argument1);
} else return undefined;

#define __lnc__f63
/// __lnc__f63()->Any
if (live_enabled) {
	switch(argument_count){
		case 0:return mean();
		case 1:return mean(argument[0]);
		case 2:return mean(argument[0],argument[1]);
		case 3:return mean(argument[0],argument[1],argument[2]);
		case 4:return mean(argument[0],argument[1],argument[2],argument[3]);
		case 5:return mean(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return mean(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
} else return undefined;

#define __lnc__f64
/// __lnc__f64()->Any
if (live_enabled) {
	switch(argument_count){
		case 0:return median();
		case 1:return median(argument[0]);
		case 2:return median(argument[0],argument[1]);
		case 3:return median(argument[0],argument[1],argument[2]);
		case 4:return median(argument[0],argument[1],argument[2],argument[3]);
		case 5:return median(argument[0],argument[1],argument[2],argument[3],argument[4]);
		case 6:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);
		case 7:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);
		case 8:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);
		case 9:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);
		case 10:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);
		case 11:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);
		case 12:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);
		case 13:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);
		case 14:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);
		case 15:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);
		default:return median(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
} else return undefined;

#define __lnc__f65
/// __lnc__f65()->Any
if (live_enabled) {
	return clamp(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f66
/// __lnc__f66()->Any
if (live_enabled) {
	return lerp(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f67
/// __lnc__f67()->Any
if (live_enabled) {
	return dot_product(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f68
/// __lnc__f68()->Any
if (live_enabled) {
	return dot_product_3d(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f69
/// __lnc__f69()->Any
if (live_enabled) {
	return dot_product_normalised(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f70
/// __lnc__f70()->Any
if (live_enabled) {
	return dot_product_3d_normalised(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f71
/// __lnc__f71()
if (live_enabled) {
	math_set_epsilon(argument0);
}

#define __lnc__f72
/// __lnc__f72()->Any
if (live_enabled) {
	return math_get_epsilon();
} else return undefined;

#define __lnc__f73
/// __lnc__f73()->Any
if (live_enabled) {
	return angle_difference(argument0,argument1);
} else return undefined;

#define __lnc__f74
/// __lnc__f74()->Any
if (live_enabled) {
	return point_distance_3d(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f75
/// __lnc__f75()->Any
if (live_enabled) {
	return point_distance(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f76
/// __lnc__f76()->Any
if (live_enabled) {
	return point_direction(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f77
/// __lnc__f77()->Any
if (live_enabled) {
	return lengthdir_x(argument0,argument1);
} else return undefined;

#define __lnc__f78
/// __lnc__f78()->Any
if (live_enabled) {
	return lengthdir_y(argument0,argument1);
} else return undefined;

#define __lnc__f79
/// __lnc__f79()->Any
if (live_enabled) {
	return real(argument0);
} else return undefined;

#define __lnc__f80
/// __lnc__f80()->Any
if (live_enabled) {
	return string(argument0);
} else return undefined;

#define __lnc__f81
/// __lnc__f81()->Any
if (live_enabled) {
	return int64(argument0);
} else return undefined;

#define __lnc__f82
/// __lnc__f82()->Any
if (live_enabled) {
	return ptr(argument0);
} else return undefined;

#define __lnc__f83
/// __lnc__f83()->Any
if (live_enabled) {
	return string_format(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f84
/// __lnc__f84()->Any
if (live_enabled) {
	return chr(argument0);
} else return undefined;

#define __lnc__f85
/// __lnc__f85()->Any
if (live_enabled) {
	return ansi_char(argument0);
} else return undefined;

#define __lnc__f86
/// __lnc__f86()->Any
if (live_enabled) {
	return ord(argument0);
} else return undefined;

#define __lnc__f87
/// __lnc__f87()->Any
if (live_enabled) {
	return string_length(argument0);
} else return undefined;

#define __lnc__f88
/// __lnc__f88()->Any
if (live_enabled) {
	return string_byte_length(argument0);
} else return undefined;

#define __lnc__f89
/// __lnc__f89()->Any
if (live_enabled) {
	return string_pos(argument0,argument1);
} else return undefined;

#define __lnc__f90
/// __lnc__f90()->Any
if (live_enabled) {
	return string_copy(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f91
/// __lnc__f91()->Any
if (live_enabled) {
	return string_char_at(argument0,argument1);
} else return undefined;

#define __lnc__f92
/// __lnc__f92()->Any
if (live_enabled) {
	return string_ord_at(argument0,argument1);
} else return undefined;

#define __lnc__f93
/// __lnc__f93()->Any
if (live_enabled) {
	return string_byte_at(argument0,argument1);
} else return undefined;

#define __lnc__f94
/// __lnc__f94()->Any
if (live_enabled) {
	return string_set_byte_at(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f95
/// __lnc__f95()->Any
if (live_enabled) {
	return string_delete(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f96
/// __lnc__f96()->Any
if (live_enabled) {
	return string_insert(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f97
/// __lnc__f97()->Any
if (live_enabled) {
	return string_lower(argument0);
} else return undefined;

#define __lnc__f98
/// __lnc__f98()->Any
if (live_enabled) {
	return string_upper(argument0);
} else return undefined;

#define __lnc__f99
/// __lnc__f99()->Any
if (live_enabled) {
	return string_repeat(argument0,argument1);
} else return undefined;

#define __lnc__f100
/// __lnc__f100()->Any
if (live_enabled) {
	return string_letters(argument0);
} else return undefined;

#define __lnc__f101
/// __lnc__f101()->Any
if (live_enabled) {
	return string_digits(argument0);
} else return undefined;

#define __lnc__f102
/// __lnc__f102()->Any
if (live_enabled) {
	return string_lettersdigits(argument0);
} else return undefined;

#define __lnc__f103
/// __lnc__f103()->Any
if (live_enabled) {
	return string_replace(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f104
/// __lnc__f104()->Any
if (live_enabled) {
	return string_replace_all(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f105
/// __lnc__f105()->Any
if (live_enabled) {
	return string_count(argument0,argument1);
} else return undefined;

#define __lnc__f106
/// __lnc__f106()->Any
if (live_enabled) {
	return clipboard_has_text();
} else return undefined;

#define __lnc__f107
/// __lnc__f107()
if (live_enabled) {
	clipboard_set_text(argument0);
}

#define __lnc__f108
/// __lnc__f108()->Any
if (live_enabled) {
	return clipboard_get_text();
} else return undefined;

#define __lnc__f109
/// __lnc__f109()->Any
if (live_enabled) {
	return date_current_datetime();
} else return undefined;

#define __lnc__f110
/// __lnc__f110()->Any
if (live_enabled) {
	return date_create_datetime(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f111
/// __lnc__f111()->Any
if (live_enabled) {
	return date_valid_datetime(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f112
/// __lnc__f112()->Any
if (live_enabled) {
	return date_inc_year(argument0,argument1);
} else return undefined;

#define __lnc__f113
/// __lnc__f113()->Any
if (live_enabled) {
	return date_inc_month(argument0,argument1);
} else return undefined;

#define __lnc__f114
/// __lnc__f114()->Any
if (live_enabled) {
	return date_inc_week(argument0,argument1);
} else return undefined;

#define __lnc__f115
/// __lnc__f115()->Any
if (live_enabled) {
	return date_inc_day(argument0,argument1);
} else return undefined;

#define __lnc__f116
/// __lnc__f116()->Any
if (live_enabled) {
	return date_inc_hour(argument0,argument1);
} else return undefined;

#define __lnc__f117
/// __lnc__f117()->Any
if (live_enabled) {
	return date_inc_minute(argument0,argument1);
} else return undefined;

#define __lnc__f118
/// __lnc__f118()->Any
if (live_enabled) {
	return date_inc_second(argument0,argument1);
} else return undefined;

#define __lnc__f119
/// __lnc__f119()->Any
if (live_enabled) {
	return date_get_year(argument0);
} else return undefined;

#define __lnc__f120
/// __lnc__f120()->Any
if (live_enabled) {
	return date_get_month(argument0);
} else return undefined;

#define __lnc__f121
/// __lnc__f121()->Any
if (live_enabled) {
	return date_get_week(argument0);
} else return undefined;

#define __lnc__f122
/// __lnc__f122()->Any
if (live_enabled) {
	return date_get_day(argument0);
} else return undefined;

#define __lnc__f123
/// __lnc__f123()->Any
if (live_enabled) {
	return date_get_hour(argument0);
} else return undefined;

#define __lnc__f124
/// __lnc__f124()->Any
if (live_enabled) {
	return date_get_minute(argument0);
} else return undefined;

#define __lnc__f125
/// __lnc__f125()->Any
if (live_enabled) {
	return date_get_second(argument0);
} else return undefined;

#define __lnc__f126
/// __lnc__f126()->Any
if (live_enabled) {
	return date_get_weekday(argument0);
} else return undefined;

#define __lnc__f127
/// __lnc__f127()->Any
if (live_enabled) {
	return date_get_day_of_year(argument0);
} else return undefined;

#define __lnc__f128
/// __lnc__f128()->Any
if (live_enabled) {
	return date_get_hour_of_year(argument0);
} else return undefined;

#define __lnc__f129
/// __lnc__f129()->Any
if (live_enabled) {
	return date_get_minute_of_year(argument0);
} else return undefined;

#define __lnc__f130
/// __lnc__f130()->Any
if (live_enabled) {
	return date_get_second_of_year(argument0);
} else return undefined;

#define __lnc__f131
/// __lnc__f131()->Any
if (live_enabled) {
	return date_year_span(argument0,argument1);
} else return undefined;

#define __lnc__f132
/// __lnc__f132()->Any
if (live_enabled) {
	return date_month_span(argument0,argument1);
} else return undefined;

#define __lnc__f133
/// __lnc__f133()->Any
if (live_enabled) {
	return date_week_span(argument0,argument1);
} else return undefined;

#define __lnc__f134
/// __lnc__f134()->Any
if (live_enabled) {
	return date_day_span(argument0,argument1);
} else return undefined;

#define __lnc__f135
/// __lnc__f135()->Any
if (live_enabled) {
	return date_hour_span(argument0,argument1);
} else return undefined;

#define __lnc__f136
/// __lnc__f136()->Any
if (live_enabled) {
	return date_minute_span(argument0,argument1);
} else return undefined;

#define __lnc__f137
/// __lnc__f137()->Any
if (live_enabled) {
	return date_second_span(argument0,argument1);
} else return undefined;

#define __lnc__f138
/// __lnc__f138()->Any
if (live_enabled) {
	return date_compare_datetime(argument0,argument1);
} else return undefined;

#define __lnc__f139
/// __lnc__f139()->Any
if (live_enabled) {
	return date_compare_date(argument0,argument1);
} else return undefined;

#define __lnc__f140
/// __lnc__f140()->Any
if (live_enabled) {
	return date_compare_time(argument0,argument1);
} else return undefined;

#define __lnc__f141
/// __lnc__f141()->Any
if (live_enabled) {
	return date_date_of(argument0);
} else return undefined;

#define __lnc__f142
/// __lnc__f142()->Any
if (live_enabled) {
	return date_time_of(argument0);
} else return undefined;

#define __lnc__f143
/// __lnc__f143()->Any
if (live_enabled) {
	return date_datetime_string(argument0);
} else return undefined;

#define __lnc__f144
/// __lnc__f144()->Any
if (live_enabled) {
	return date_date_string(argument0);
} else return undefined;

#define __lnc__f145
/// __lnc__f145()->Any
if (live_enabled) {
	return date_time_string(argument0);
} else return undefined;

#define __lnc__f146
/// __lnc__f146()->Any
if (live_enabled) {
	return date_days_in_month(argument0);
} else return undefined;

#define __lnc__f147
/// __lnc__f147()->Any
if (live_enabled) {
	return date_days_in_year(argument0);
} else return undefined;

#define __lnc__f148
/// __lnc__f148()->Any
if (live_enabled) {
	return date_leap_year(argument0);
} else return undefined;

#define __lnc__f149
/// __lnc__f149()->Any
if (live_enabled) {
	return date_is_today(argument0);
} else return undefined;

#define __lnc__f150
/// __lnc__f150()
if (live_enabled) {
	date_set_timezone(argument0);
}

#define __lnc__f151
/// __lnc__f151()->Any
if (live_enabled) {
	return date_get_timezone();
} else return undefined;

#define __lnc__f152
/// __lnc__f152()
if (live_enabled) {
	motion_set(argument0,argument1);
}

#define __lnc__f153
/// __lnc__f153()
if (live_enabled) {
	motion_add(argument0,argument1);
}

#define __lnc__f154
/// __lnc__f154()->Any
if (live_enabled) {
	return place_free(argument0,argument1);
} else return undefined;

#define __lnc__f155
/// __lnc__f155()->Any
if (live_enabled) {
	return place_empty(argument0,argument1);
} else return undefined;

#define __lnc__f156
/// __lnc__f156()->Any
if (live_enabled) {
	return place_meeting(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f157
/// __lnc__f157()->Any
if (live_enabled) {
	return place_snapped(argument0,argument1);
} else return undefined;

#define __lnc__f158
/// __lnc__f158()
if (live_enabled) {
	move_random(argument0,argument1);
}

#define __lnc__f159
/// __lnc__f159()
if (live_enabled) {
	move_snap(argument0,argument1);
}

#define __lnc__f160
/// __lnc__f160()
if (live_enabled) {
	move_towards_point(argument0,argument1,argument2);
}

#define __lnc__f161
/// __lnc__f161()
if (live_enabled) {
	move_contact_solid(argument0,argument1);
}

#define __lnc__f162
/// __lnc__f162()
if (live_enabled) {
	move_contact_all(argument0,argument1);
}

#define __lnc__f163
/// __lnc__f163()
if (live_enabled) {
	move_outside_solid(argument0,argument1);
}

#define __lnc__f164
/// __lnc__f164()
if (live_enabled) {
	move_outside_all(argument0,argument1);
}

#define __lnc__f165
/// __lnc__f165()
if (live_enabled) {
	move_bounce_solid(argument0);
}

#define __lnc__f166
/// __lnc__f166()
if (live_enabled) {
	move_bounce_all(argument0);
}

#define __lnc__f167
/// __lnc__f167()
if (live_enabled) {
	move_wrap(argument0,argument1,argument2);
}

#define __lnc__f168
/// __lnc__f168()->Any
if (live_enabled) {
	return distance_to_point(argument0,argument1);
} else return undefined;

#define __lnc__f169
/// __lnc__f169()->Any
if (live_enabled) {
	return distance_to_object(argument0);
} else return undefined;

#define __lnc__f170
/// __lnc__f170()->Any
if (live_enabled) {
	return position_empty(argument0,argument1);
} else return undefined;

#define __lnc__f171
/// __lnc__f171()->Any
if (live_enabled) {
	return position_meeting(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f172
/// __lnc__f172()
if (live_enabled) {
	path_start(argument0,argument1,argument2,argument3);
}

#define __lnc__f173
/// __lnc__f173()
if (live_enabled) {
	path_end();
}

#define __lnc__f174
/// __lnc__f174()->Any
if (live_enabled) {
	return mp_linear_step(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f175
/// __lnc__f175()->Any
if (live_enabled) {
	return mp_potential_step(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f176
/// __lnc__f176()->Any
if (live_enabled) {
	return mp_linear_step_object(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f177
/// __lnc__f177()->Any
if (live_enabled) {
	return mp_potential_step_object(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f178
/// __lnc__f178()
if (live_enabled) {
	mp_potential_settings(argument0,argument1,argument2,argument3);
}

#define __lnc__f179
/// __lnc__f179()->Any
if (live_enabled) {
	return mp_linear_path(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f180
/// __lnc__f180()->Any
if (live_enabled) {
	return mp_potential_path(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f181
/// __lnc__f181()->Any
if (live_enabled) {
	return mp_linear_path_object(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f182
/// __lnc__f182()->Any
if (live_enabled) {
	return mp_potential_path_object(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f183
/// __lnc__f183()->Any
if (live_enabled) {
	return mp_grid_create(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f184
/// __lnc__f184()
if (live_enabled) {
	mp_grid_destroy(argument0);
}

#define __lnc__f185
/// __lnc__f185()
if (live_enabled) {
	mp_grid_clear_all(argument0);
}

#define __lnc__f186
/// __lnc__f186()
if (live_enabled) {
	mp_grid_clear_cell(argument0,argument1,argument2);
}

#define __lnc__f187
/// __lnc__f187()
if (live_enabled) {
	mp_grid_clear_rectangle(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f188
/// __lnc__f188()
if (live_enabled) {
	mp_grid_add_cell(argument0,argument1,argument2);
}

#define __lnc__f189
/// __lnc__f189()->Any
if (live_enabled) {
	return mp_grid_get_cell(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f190
/// __lnc__f190()
if (live_enabled) {
	mp_grid_add_rectangle(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f191
/// __lnc__f191()
if (live_enabled) {
	mp_grid_add_instances(argument0,argument1,argument2);
}

#define __lnc__f192
/// __lnc__f192()->Any
if (live_enabled) {
	return mp_grid_path(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f193
/// __lnc__f193()
if (live_enabled) {
	mp_grid_draw(argument0);
}

#define __lnc__f194
/// __lnc__f194()
if (live_enabled) {
	mp_grid_to_ds_grid(argument0,argument1);
}

#define __lnc__f195
/// __lnc__f195()->Any
if (live_enabled) {
	return collision_point(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f196
/// __lnc__f196()->Any
if (live_enabled) {
	return collision_rectangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f197
/// __lnc__f197()->Any
if (live_enabled) {
	return collision_circle(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f198
/// __lnc__f198()->Any
if (live_enabled) {
	return collision_ellipse(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f199
/// __lnc__f199()->Any
if (live_enabled) {
	return collision_line(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f200
/// __lnc__f200()->Any
if (live_enabled) {
	return point_in_rectangle(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f201
/// __lnc__f201()->Any
if (live_enabled) {
	return point_in_triangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f202
/// __lnc__f202()->Any
if (live_enabled) {
	return point_in_circle(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f203
/// __lnc__f203()->Any
if (live_enabled) {
	return rectangle_in_rectangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f204
/// __lnc__f204()->Any
if (live_enabled) {
	return rectangle_in_triangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
} else return undefined;

#define __lnc__f205
/// __lnc__f205()->Any
if (live_enabled) {
	return rectangle_in_circle(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f206
/// __lnc__f206()->Any
if (live_enabled) {
	return instance_find(argument0,argument1);
} else return undefined;

#define __lnc__f207
/// __lnc__f207()->Any
if (live_enabled) {
	return instance_exists(argument0);
} else return undefined;

#define __lnc__f208
/// __lnc__f208()->Any
if (live_enabled) {
	return instance_number(argument0);
} else return undefined;

#define __lnc__f209
/// __lnc__f209()->Any
if (live_enabled) {
	return instance_position(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f210
/// __lnc__f210()->Any
if (live_enabled) {
	return instance_nearest(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f211
/// __lnc__f211()->Any
if (live_enabled) {
	return instance_furthest(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f212
/// __lnc__f212()->Any
if (live_enabled) {
	return instance_place(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f213
/// __lnc__f213()->Any
if (live_enabled) {
	return instance_create(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f214
/// __lnc__f214()->Any
if (live_enabled) {
	return instance_copy(argument0);
} else return undefined;

#define __lnc__f215
/// __lnc__f215()
if (live_enabled) {
	instance_change(argument0,argument1);
}

#define __lnc__f216
/// __lnc__f216()
if (live_enabled) {
	position_destroy(argument0,argument1);
}

#define __lnc__f217
/// __lnc__f217()
if (live_enabled) {
	position_change(argument0,argument1,argument2,argument3);
}

#define __lnc__f218
/// __lnc__f218()
if (live_enabled) {
	instance_deactivate_all(argument0);
}

#define __lnc__f219
/// __lnc__f219()
if (live_enabled) {
	instance_deactivate_object(argument0);
}

#define __lnc__f220
/// __lnc__f220()
if (live_enabled) {
	instance_deactivate_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f221
/// __lnc__f221()
if (live_enabled) {
	instance_activate_all();
}

#define __lnc__f222
/// __lnc__f222()
if (live_enabled) {
	instance_activate_object(argument0);
}

#define __lnc__f223
/// __lnc__f223()
if (live_enabled) {
	instance_activate_region(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f224
/// __lnc__f224()
if (live_enabled) {
	room_goto(argument0);
}

#define __lnc__f225
/// __lnc__f225()
if (live_enabled) {
	room_goto_previous();
}

#define __lnc__f226
/// __lnc__f226()
if (live_enabled) {
	room_goto_next();
}

#define __lnc__f227
/// __lnc__f227()->Any
if (live_enabled) {
	return room_previous(argument0);
} else return undefined;

#define __lnc__f228
/// __lnc__f228()->Any
if (live_enabled) {
	return room_next(argument0);
} else return undefined;

#define __lnc__f229
/// __lnc__f229()
if (live_enabled) {
	room_restart();
}

#define __lnc__f230
/// __lnc__f230()
if (live_enabled) {
	game_end();
}

#define __lnc__f231
/// __lnc__f231()
if (live_enabled) {
	game_restart();
}

#define __lnc__f232
/// __lnc__f232()->Any
if (live_enabled) {
	return game_load(argument0);
} else return undefined;

#define __lnc__f233
/// __lnc__f233()
if (live_enabled) {
	game_save(argument0);
}

#define __lnc__f234
/// __lnc__f234()
if (live_enabled) {
	game_save_buffer(argument0);
}

#define __lnc__f235
/// __lnc__f235()->Any
if (live_enabled) {
	return game_load_buffer(argument0);
} else return undefined;

#define __lnc__f236
/// __lnc__f236()
if (live_enabled) {
	event_perform(argument0,argument1);
}

#define __lnc__f237
/// __lnc__f237()
if (live_enabled) {
	event_user(argument0);
}

#define __lnc__f238
/// __lnc__f238()
if (live_enabled) {
	event_perform_object(argument0,argument1,argument2);
}

#define __lnc__f239
/// __lnc__f239()
if (live_enabled) {
	event_inherited();
}

#define __lnc__f240
/// __lnc__f240()
if (live_enabled) {
	show_debug_message(argument0);
}

#define __lnc__f241
/// __lnc__f241()
if (live_enabled) {
	show_debug_overlay(argument0);
}

#define __lnc__f242
/// __lnc__f242()->Any
if (live_enabled) {
	return alarm_get(argument0);
} else return undefined;

#define __lnc__f243
/// __lnc__f243()
if (live_enabled) {
	alarm_set(argument0,argument1);
}

#define __lnc__f244
/// __lnc__f244()
if (live_enabled) {
	keyboard_set_map(argument0,argument1);
}

#define __lnc__f245
/// __lnc__f245()->Any
if (live_enabled) {
	return keyboard_get_map(argument0);
} else return undefined;

#define __lnc__f246
/// __lnc__f246()
if (live_enabled) {
	keyboard_unset_map();
}

#define __lnc__f247
/// __lnc__f247()->Any
if (live_enabled) {
	return keyboard_check(argument0);
} else return undefined;

#define __lnc__f248
/// __lnc__f248()->Any
if (live_enabled) {
	return keyboard_check_pressed(argument0);
} else return undefined;

#define __lnc__f249
/// __lnc__f249()->Any
if (live_enabled) {
	return keyboard_check_released(argument0);
} else return undefined;

#define __lnc__f250
/// __lnc__f250()->Any
if (live_enabled) {
	return keyboard_check_direct(argument0);
} else return undefined;

#define __lnc__f251
/// __lnc__f251()->Any
if (live_enabled) {
	return keyboard_get_numlock();
} else return undefined;

#define __lnc__f252
/// __lnc__f252()
if (live_enabled) {
	keyboard_set_numlock(argument0);
}

#define __lnc__f253
/// __lnc__f253()
if (live_enabled) {
	keyboard_key_press(argument0);
}

#define __lnc__f254
/// __lnc__f254()
if (live_enabled) {
	keyboard_key_release(argument0);
}

#define __lnc__f255
/// __lnc__f255()
if (live_enabled) {
	keyboard_clear(argument0);
}

#define __lnc__f256
/// __lnc__f256()
if (live_enabled) {
	io_clear();
}

#define __lnc__f257
/// __lnc__f257()
if (live_enabled) {
	browser_input_capture(argument0);
}

#define __lnc__f258
/// __lnc__f258()->Any
if (live_enabled) {
	return mouse_check_button(argument0);
} else return undefined;

#define __lnc__f259
/// __lnc__f259()->Any
if (live_enabled) {
	return mouse_check_button_pressed(argument0);
} else return undefined;

#define __lnc__f260
/// __lnc__f260()->Any
if (live_enabled) {
	return mouse_check_button_released(argument0);
} else return undefined;

#define __lnc__f261
/// __lnc__f261()->Any
if (live_enabled) {
	return mouse_wheel_up();
} else return undefined;

#define __lnc__f262
/// __lnc__f262()->Any
if (live_enabled) {
	return mouse_wheel_down();
} else return undefined;

#define __lnc__f263
/// __lnc__f263()
if (live_enabled) {
	mouse_clear(argument0);
}

#define __lnc__f264
/// __lnc__f264()->Any
if (live_enabled) {
	return joystick_exists(argument0);
} else return undefined;

#define __lnc__f265
/// __lnc__f265()
if (live_enabled) {
	joystick_direction(argument0);
}

#define __lnc__f266
/// __lnc__f266()
if (live_enabled) {
	joystick_name(argument0);
}

#define __lnc__f267
/// __lnc__f267()
if (live_enabled) {
	joystick_axes(argument0);
}

#define __lnc__f268
/// __lnc__f268()
if (live_enabled) {
	joystick_buttons(argument0);
}

#define __lnc__f269
/// __lnc__f269()
if (live_enabled) {
	joystick_has_pov(argument0);
}

#define __lnc__f270
/// __lnc__f270()
if (live_enabled) {
	joystick_check_button(argument0,argument1);
}

#define __lnc__f271
/// __lnc__f271()
if (live_enabled) {
	joystick_xpos(argument0);
}

#define __lnc__f272
/// __lnc__f272()
if (live_enabled) {
	joystick_ypos(argument0);
}

#define __lnc__f273
/// __lnc__f273()
if (live_enabled) {
	joystick_zpos(argument0);
}

#define __lnc__f274
/// __lnc__f274()
if (live_enabled) {
	joystick_rpos(argument0);
}

#define __lnc__f275
/// __lnc__f275()
if (live_enabled) {
	joystick_upos(argument0);
}

#define __lnc__f276
/// __lnc__f276()
if (live_enabled) {
	joystick_vpos(argument0);
}

#define __lnc__f277
/// __lnc__f277()
if (live_enabled) {
	joystick_pov(argument0);
}

#define __lnc__f278
/// __lnc__f278()
if (live_enabled) {
	draw_self();
}

#define __lnc__f279
/// __lnc__f279()
if (live_enabled) {
	draw_sprite(argument0,argument1,argument2,argument3);
}

#define __lnc__f280
/// __lnc__f280()
if (live_enabled) {
	draw_sprite_pos(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f281
/// __lnc__f281()
if (live_enabled) {
	draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f282
/// __lnc__f282()
if (live_enabled) {
	draw_sprite_stretched(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f283
/// __lnc__f283()
if (live_enabled) {
	draw_sprite_stretched_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f284
/// __lnc__f284()
if (live_enabled) {
	draw_sprite_tiled(argument0,argument1,argument2,argument3);
}

#define __lnc__f285
/// __lnc__f285()
if (live_enabled) {
	draw_sprite_tiled_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f286
/// __lnc__f286()
if (live_enabled) {
	draw_sprite_part(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f287
/// __lnc__f287()
if (live_enabled) {
	draw_sprite_part_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
}

#define __lnc__f288
/// __lnc__f288()
if (live_enabled) {
	draw_sprite_general(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14,argument15);
}

#define __lnc__f289
/// __lnc__f289()
if (live_enabled) {
	draw_background(argument0,argument1,argument2);
}

#define __lnc__f290
/// __lnc__f290()
if (live_enabled) {
	draw_background_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f291
/// __lnc__f291()
if (live_enabled) {
	draw_background_stretched(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f292
/// __lnc__f292()
if (live_enabled) {
	draw_background_stretched_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f293
/// __lnc__f293()
if (live_enabled) {
	draw_background_tiled(argument0,argument1,argument2);
}

#define __lnc__f294
/// __lnc__f294()
if (live_enabled) {
	draw_background_tiled_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f295
/// __lnc__f295()
if (live_enabled) {
	draw_background_part(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f296
/// __lnc__f296()
if (live_enabled) {
	draw_background_part_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f297
/// __lnc__f297()
if (live_enabled) {
	draw_background_general(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14);
}

#define __lnc__f298
/// __lnc__f298()
if (live_enabled) {
	draw_clear(argument0);
}

#define __lnc__f299
/// __lnc__f299()
if (live_enabled) {
	draw_clear_alpha(argument0,argument1);
}

#define __lnc__f300
/// __lnc__f300()
if (live_enabled) {
	draw_point(argument0,argument1);
}

#define __lnc__f301
/// __lnc__f301()
if (live_enabled) {
	draw_line(argument0,argument1,argument2,argument3);
}

#define __lnc__f302
/// __lnc__f302()
if (live_enabled) {
	draw_line_width(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f303
/// __lnc__f303()
if (live_enabled) {
	draw_rectangle(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f304
/// __lnc__f304()
if (live_enabled) {
	draw_roundrect(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f305
/// __lnc__f305()
if (live_enabled) {
	draw_roundrect_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f306
/// __lnc__f306()
if (live_enabled) {
	draw_triangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f307
/// __lnc__f307()
if (live_enabled) {
	draw_circle(argument0,argument1,argument2,argument3);
}

#define __lnc__f308
/// __lnc__f308()
if (live_enabled) {
	draw_ellipse(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f309
/// __lnc__f309()
if (live_enabled) {
	draw_set_circle_precision(argument0);
}

#define __lnc__f310
/// __lnc__f310()
if (live_enabled) {
	draw_arrow(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f311
/// __lnc__f311()
if (live_enabled) {
	draw_button(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f312
/// __lnc__f312()
if (live_enabled) {
	draw_path(argument0,argument1,argument2,argument3);
}

#define __lnc__f313
/// __lnc__f313()
if (live_enabled) {
	draw_healthbar(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f314
/// __lnc__f314()->Any
if (live_enabled) {
	return draw_getpixel(argument0,argument1);
} else return undefined;

#define __lnc__f315
/// __lnc__f315()->Any
if (live_enabled) {
	return draw_getpixel_ext(argument0,argument1);
} else return undefined;

#define __lnc__f316
/// __lnc__f316()
if (live_enabled) {
	draw_set_colour(argument0);
}

#define __lnc__f317
/// __lnc__f317()
if (live_enabled) {
	draw_set_alpha(argument0);
}

#define __lnc__f318
/// __lnc__f318()->Any
if (live_enabled) {
	return draw_get_colour();
} else return undefined;

#define __lnc__f319
/// __lnc__f319()->Any
if (live_enabled) {
	return draw_get_alpha();
} else return undefined;

#define __lnc__f320
/// __lnc__f320()->Any
if (live_enabled) {
	return make_colour_rgb(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f321
/// __lnc__f321()->Any
if (live_enabled) {
	return make_colour_hsv(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f322
/// __lnc__f322()->Any
if (live_enabled) {
	return colour_get_red(argument0);
} else return undefined;

#define __lnc__f323
/// __lnc__f323()->Any
if (live_enabled) {
	return colour_get_green(argument0);
} else return undefined;

#define __lnc__f324
/// __lnc__f324()->Any
if (live_enabled) {
	return colour_get_blue(argument0);
} else return undefined;

#define __lnc__f325
/// __lnc__f325()->Any
if (live_enabled) {
	return colour_get_hue(argument0);
} else return undefined;

#define __lnc__f326
/// __lnc__f326()->Any
if (live_enabled) {
	return colour_get_saturation(argument0);
} else return undefined;

#define __lnc__f327
/// __lnc__f327()->Any
if (live_enabled) {
	return colour_get_value(argument0);
} else return undefined;

#define __lnc__f328
/// __lnc__f328()->Any
if (live_enabled) {
	return merge_colour(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f329
/// __lnc__f329()
if (live_enabled) {
	screen_save(argument0);
}

#define __lnc__f330
/// __lnc__f330()
if (live_enabled) {
	screen_save_part(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f331
/// __lnc__f331()
if (live_enabled) {
	draw_set_font(argument0);
}

#define __lnc__f332
/// __lnc__f332()
if (live_enabled) {
	draw_set_halign(argument0);
}

#define __lnc__f333
/// __lnc__f333()
if (live_enabled) {
	draw_set_valign(argument0);
}

#define __lnc__f334
/// __lnc__f334()
if (live_enabled) {
	draw_text(argument0,argument1,argument2);
}

#define __lnc__f335
/// __lnc__f335()
if (live_enabled) {
	draw_text_ext(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f336
/// __lnc__f336()->Any
if (live_enabled) {
	return string_width(argument0);
} else return undefined;

#define __lnc__f337
/// __lnc__f337()->Any
if (live_enabled) {
	return string_height(argument0);
} else return undefined;

#define __lnc__f338
/// __lnc__f338()->Any
if (live_enabled) {
	return string_width_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f339
/// __lnc__f339()->Any
if (live_enabled) {
	return string_height_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f340
/// __lnc__f340()
if (live_enabled) {
	draw_text_transformed(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f341
/// __lnc__f341()
if (live_enabled) {
	draw_text_ext_transformed(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f342
/// __lnc__f342()
if (live_enabled) {
	draw_text_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f343
/// __lnc__f343()
if (live_enabled) {
	draw_text_ext_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f344
/// __lnc__f344()
if (live_enabled) {
	draw_text_transformed_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f345
/// __lnc__f345()
if (live_enabled) {
	draw_text_ext_transformed_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12);
}

#define __lnc__f346
/// __lnc__f346()
if (live_enabled) {
	draw_point_colour(argument0,argument1,argument2);
}

#define __lnc__f347
/// __lnc__f347()
if (live_enabled) {
	draw_line_colour(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f348
/// __lnc__f348()
if (live_enabled) {
	draw_line_width_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f349
/// __lnc__f349()
if (live_enabled) {
	draw_rectangle_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f350
/// __lnc__f350()
if (live_enabled) {
	draw_roundrect_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f351
/// __lnc__f351()
if (live_enabled) {
	draw_roundrect_colour_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f352
/// __lnc__f352()
if (live_enabled) {
	draw_triangle_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f353
/// __lnc__f353()
if (live_enabled) {
	draw_circle_colour(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f354
/// __lnc__f354()
if (live_enabled) {
	draw_ellipse_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f355
/// __lnc__f355()
if (live_enabled) {
	draw_primitive_begin(argument0);
}

#define __lnc__f356
/// __lnc__f356()
if (live_enabled) {
	draw_vertex(argument0,argument1);
}

#define __lnc__f357
/// __lnc__f357()
if (live_enabled) {
	draw_vertex_colour(argument0,argument1,argument2,argument3);
}

#define __lnc__f358
/// __lnc__f358()
if (live_enabled) {
	draw_primitive_end();
}

#define __lnc__f359
/// __lnc__f359()->Any
if (live_enabled) {
	return sprite_get_uvs(argument0,argument1);
} else return undefined;

#define __lnc__f360
/// __lnc__f360()->Any
if (live_enabled) {
	return background_get_uvs(argument0);
} else return undefined;

#define __lnc__f361
/// __lnc__f361()->Any
if (live_enabled) {
	return font_get_uvs(argument0);
} else return undefined;

#define __lnc__f362
/// __lnc__f362()->Any
if (live_enabled) {
	return sprite_get_texture(argument0,argument1);
} else return undefined;

#define __lnc__f363
/// __lnc__f363()->Any
if (live_enabled) {
	return background_get_texture(argument0);
} else return undefined;

#define __lnc__f364
/// __lnc__f364()->Any
if (live_enabled) {
	return font_get_texture(argument0);
} else return undefined;

#define __lnc__f365
/// __lnc__f365()->Any
if (live_enabled) {
	return texture_get_width(argument0);
} else return undefined;

#define __lnc__f366
/// __lnc__f366()->Any
if (live_enabled) {
	return texture_get_height(argument0);
} else return undefined;

#define __lnc__f367
/// __lnc__f367()
if (live_enabled) {
	draw_primitive_begin_texture(argument0,argument1);
}

#define __lnc__f368
/// __lnc__f368()
if (live_enabled) {
	draw_vertex_texture(argument0,argument1,argument2,argument3);
}

#define __lnc__f369
/// __lnc__f369()
if (live_enabled) {
	draw_vertex_texture_colour(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f370
/// __lnc__f370()
if (live_enabled) {
	texture_set_interpolation(argument0);
}

#define __lnc__f371
/// __lnc__f371()
if (live_enabled) {
	texture_set_interpolation_ext(argument0,argument1);
}

#define __lnc__f372
/// __lnc__f372()
if (live_enabled) {
	texture_set_blending(argument0);
}

#define __lnc__f373
/// __lnc__f373()
if (live_enabled) {
	texture_set_repeat(argument0);
}

#define __lnc__f374
/// __lnc__f374()
if (live_enabled) {
	texture_set_repeat_ext(argument0,argument1);
}

#define __lnc__f375
/// __lnc__f375()
if (live_enabled) {
	texture_global_scale(argument0);
}

#define __lnc__f376
/// __lnc__f376()
if (live_enabled) {
	draw_set_blend_mode(argument0);
}

#define __lnc__f377
/// __lnc__f377()
if (live_enabled) {
	draw_set_blend_mode_ext(argument0,argument1);
}

#define __lnc__f378
/// __lnc__f378()
if (live_enabled) {
	draw_set_colour_write_enable(argument0,argument1,argument2,argument3);
}

#define __lnc__f379
/// __lnc__f379()
if (live_enabled) {
	draw_set_alpha_test(argument0);
}

#define __lnc__f380
/// __lnc__f380()
if (live_enabled) {
	draw_set_alpha_test_ref_value(argument0);
}

#define __lnc__f381
/// __lnc__f381()->Any
if (live_enabled) {
	return draw_get_alpha_test();
} else return undefined;

#define __lnc__f382
/// __lnc__f382()->Any
if (live_enabled) {
	return draw_get_alpha_test_ref_value();
} else return undefined;

#define __lnc__f383
/// __lnc__f383()->Any
if (live_enabled) {
	return surface_create(argument0,argument1);
} else return undefined;

#define __lnc__f384
/// __lnc__f384()->Any
if (live_enabled) {
	return surface_create_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f385
/// __lnc__f385()
if (live_enabled) {
	surface_resize(argument0,argument1,argument2);
}

#define __lnc__f386
/// __lnc__f386()
if (live_enabled) {
	surface_free(argument0);
}

#define __lnc__f387
/// __lnc__f387()->Any
if (live_enabled) {
	return surface_exists(argument0);
} else return undefined;

#define __lnc__f388
/// __lnc__f388()->Any
if (live_enabled) {
	return surface_get_width(argument0);
} else return undefined;

#define __lnc__f389
/// __lnc__f389()->Any
if (live_enabled) {
	return surface_get_height(argument0);
} else return undefined;

#define __lnc__f390
/// __lnc__f390()->Any
if (live_enabled) {
	return surface_get_texture(argument0);
} else return undefined;

#define __lnc__f391
/// __lnc__f391()
if (live_enabled) {
	surface_set_target(argument0);
}

#define __lnc__f392
/// __lnc__f392()
if (live_enabled) {
	surface_set_target_ext(argument0,argument1);
}

#define __lnc__f393
/// __lnc__f393()
if (live_enabled) {
	surface_reset_target();
}

#define __lnc__f394
/// __lnc__f394()
if (live_enabled) {
	draw_surface(argument0,argument1,argument2);
}

#define __lnc__f395
/// __lnc__f395()
if (live_enabled) {
	draw_surface_stretched(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f396
/// __lnc__f396()
if (live_enabled) {
	draw_surface_tiled(argument0,argument1,argument2);
}

#define __lnc__f397
/// __lnc__f397()
if (live_enabled) {
	draw_surface_part(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f398
/// __lnc__f398()
if (live_enabled) {
	draw_surface_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f399
/// __lnc__f399()
if (live_enabled) {
	draw_surface_stretched_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f400
/// __lnc__f400()
if (live_enabled) {
	draw_surface_tiled_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f401
/// __lnc__f401()
if (live_enabled) {
	draw_surface_part_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f402
/// __lnc__f402()
if (live_enabled) {
	draw_surface_general(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14);
}

#define __lnc__f403
/// __lnc__f403()->Any
if (live_enabled) {
	return surface_getpixel(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f404
/// __lnc__f404()->Any
if (live_enabled) {
	return surface_getpixel_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f405
/// __lnc__f405()
if (live_enabled) {
	surface_save(argument0,argument1);
}

#define __lnc__f406
/// __lnc__f406()
if (live_enabled) {
	surface_save_part(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f407
/// __lnc__f407()
if (live_enabled) {
	surface_copy(argument0,argument1,argument2,argument3);
}

#define __lnc__f408
/// __lnc__f408()
if (live_enabled) {
	surface_copy_part(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f409
/// __lnc__f409()
if (live_enabled) {
	application_surface_draw_enable(argument0);
}

#define __lnc__f410
/// __lnc__f410()->Any
if (live_enabled) {
	return application_get_position();
} else return undefined;

#define __lnc__f411
/// __lnc__f411()
if (live_enabled) {
	application_surface_enable(argument0);
}

#define __lnc__f412
/// __lnc__f412()->Any
if (live_enabled) {
	return application_surface_is_enabled();
} else return undefined;

#define __lnc__f413
/// __lnc__f413()
if (live_enabled) {
	tile_add(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f414
/// __lnc__f414()->Any
if (live_enabled) {
	return tile_get_count();
} else return undefined;

#define __lnc__f415
/// __lnc__f415()->Any
if (live_enabled) {
	return tile_get_id(argument0);
} else return undefined;

#define __lnc__f416
/// __lnc__f416()->Any
if (live_enabled) {
	return tile_get_ids();
} else return undefined;

#define __lnc__f417
/// __lnc__f417()->Any
if (live_enabled) {
	return tile_get_ids_at_depth(argument0);
} else return undefined;

#define __lnc__f418
/// __lnc__f418()
if (live_enabled) {
	tile_delete(argument0);
}

#define __lnc__f419
/// __lnc__f419()->Any
if (live_enabled) {
	return tile_exists(argument0);
} else return undefined;

#define __lnc__f420
/// __lnc__f420()->Any
if (live_enabled) {
	return tile_get_x(argument0);
} else return undefined;

#define __lnc__f421
/// __lnc__f421()->Any
if (live_enabled) {
	return tile_get_y(argument0);
} else return undefined;

#define __lnc__f422
/// __lnc__f422()->Any
if (live_enabled) {
	return tile_get_left(argument0);
} else return undefined;

#define __lnc__f423
/// __lnc__f423()->Any
if (live_enabled) {
	return tile_get_top(argument0);
} else return undefined;

#define __lnc__f424
/// __lnc__f424()->Any
if (live_enabled) {
	return tile_get_width(argument0);
} else return undefined;

#define __lnc__f425
/// __lnc__f425()->Any
if (live_enabled) {
	return tile_get_height(argument0);
} else return undefined;

#define __lnc__f426
/// __lnc__f426()->Any
if (live_enabled) {
	return tile_get_depth(argument0);
} else return undefined;

#define __lnc__f427
/// __lnc__f427()->Any
if (live_enabled) {
	return tile_get_visible(argument0);
} else return undefined;

#define __lnc__f428
/// __lnc__f428()->Any
if (live_enabled) {
	return tile_get_xscale(argument0);
} else return undefined;

#define __lnc__f429
/// __lnc__f429()->Any
if (live_enabled) {
	return tile_get_yscale(argument0);
} else return undefined;

#define __lnc__f430
/// __lnc__f430()->Any
if (live_enabled) {
	return tile_get_background(argument0);
} else return undefined;

#define __lnc__f431
/// __lnc__f431()->Any
if (live_enabled) {
	return tile_get_blend(argument0);
} else return undefined;

#define __lnc__f432
/// __lnc__f432()->Any
if (live_enabled) {
	return tile_get_alpha(argument0);
} else return undefined;

#define __lnc__f433
/// __lnc__f433()
if (live_enabled) {
	tile_set_position(argument0,argument1,argument2);
}

#define __lnc__f434
/// __lnc__f434()
if (live_enabled) {
	tile_set_region(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f435
/// __lnc__f435()
if (live_enabled) {
	tile_set_background(argument0,argument1);
}

#define __lnc__f436
/// __lnc__f436()
if (live_enabled) {
	tile_set_visible(argument0,argument1);
}

#define __lnc__f437
/// __lnc__f437()
if (live_enabled) {
	tile_set_depth(argument0,argument1);
}

#define __lnc__f438
/// __lnc__f438()
if (live_enabled) {
	tile_set_scale(argument0,argument1,argument2);
}

#define __lnc__f439
/// __lnc__f439()
if (live_enabled) {
	tile_set_blend(argument0,argument1);
}

#define __lnc__f440
/// __lnc__f440()
if (live_enabled) {
	tile_set_alpha(argument0,argument1);
}

#define __lnc__f441
/// __lnc__f441()
if (live_enabled) {
	tile_layer_hide(argument0);
}

#define __lnc__f442
/// __lnc__f442()
if (live_enabled) {
	tile_layer_show(argument0);
}

#define __lnc__f443
/// __lnc__f443()
if (live_enabled) {
	tile_layer_delete(argument0);
}

#define __lnc__f444
/// __lnc__f444()
if (live_enabled) {
	tile_layer_shift(argument0,argument1,argument2);
}

#define __lnc__f445
/// __lnc__f445()->Any
if (live_enabled) {
	return tile_layer_find(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f446
/// __lnc__f446()
if (live_enabled) {
	tile_layer_delete_at(argument0,argument1,argument2);
}

#define __lnc__f447
/// __lnc__f447()
if (live_enabled) {
	tile_layer_depth(argument0,argument1);
}

#define __lnc__f448
/// __lnc__f448()->Any
if (live_enabled) {
	return display_get_width();
} else return undefined;

#define __lnc__f449
/// __lnc__f449()->Any
if (live_enabled) {
	return display_get_height();
} else return undefined;

#define __lnc__f450
/// __lnc__f450()->Any
if (live_enabled) {
	return display_get_orientation();
} else return undefined;

#define __lnc__f451
/// __lnc__f451()->Any
if (live_enabled) {
	return display_get_gui_width();
} else return undefined;

#define __lnc__f452
/// __lnc__f452()->Any
if (live_enabled) {
	return display_get_gui_height();
} else return undefined;

#define __lnc__f453
/// __lnc__f453()->Any
if (live_enabled) {
	return display_reset(argument0,argument1);
} else return undefined;

#define __lnc__f454
/// __lnc__f454()->Any
if (live_enabled) {
	return display_mouse_get_x();
} else return undefined;

#define __lnc__f455
/// __lnc__f455()->Any
if (live_enabled) {
	return display_mouse_get_y();
} else return undefined;

#define __lnc__f456
/// __lnc__f456()
if (live_enabled) {
	display_mouse_set(argument0,argument1);
}

#define __lnc__f457
/// __lnc__f457()->Any
if (live_enabled) {
	return display_get_windows_vertex_buffer_method();
} else return undefined;

#define __lnc__f458
/// __lnc__f458()->Any
if (live_enabled) {
	return display_get_windows_alternate_sync();
} else return undefined;

#define __lnc__f459
/// __lnc__f459()
if (live_enabled) {
	display_set_windows_vertex_buffer_method(argument0);
}

#define __lnc__f460
/// __lnc__f460()
if (live_enabled) {
	display_set_windows_alternate_sync(argument0);
}

#define __lnc__f461
/// __lnc__f461()
if (live_enabled) {
	display_set_ui_visibility(argument0);
}

#define __lnc__f462
/// __lnc__f462()
if (live_enabled) {
	window_set_fullscreen(argument0);
}

#define __lnc__f463
/// __lnc__f463()->Any
if (live_enabled) {
	return window_get_fullscreen();
} else return undefined;

#define __lnc__f464
/// __lnc__f464()
if (live_enabled) {
	window_set_caption(argument0);
}

#define __lnc__f465
/// __lnc__f465()
if (live_enabled) {
	window_set_min_width(argument0);
}

#define __lnc__f466
/// __lnc__f466()
if (live_enabled) {
	window_set_max_width(argument0);
}

#define __lnc__f467
/// __lnc__f467()
if (live_enabled) {
	window_set_min_height(argument0);
}

#define __lnc__f468
/// __lnc__f468()
if (live_enabled) {
	window_set_max_height(argument0);
}

#define __lnc__f469
/// __lnc__f469()->Any
if (live_enabled) {
	return window_get_visible_rects(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f470
/// __lnc__f470()->Any
if (live_enabled) {
	return window_get_caption();
} else return undefined;

#define __lnc__f471
/// __lnc__f471()
if (live_enabled) {
	window_set_cursor(argument0);
}

#define __lnc__f472
/// __lnc__f472()->Any
if (live_enabled) {
	return window_get_cursor();
} else return undefined;

#define __lnc__f473
/// __lnc__f473()
if (live_enabled) {
	window_set_colour(argument0);
}

#define __lnc__f474
/// __lnc__f474()->Any
if (live_enabled) {
	return window_get_colour();
} else return undefined;

#define __lnc__f475
/// __lnc__f475()
if (live_enabled) {
	window_set_position(argument0,argument1);
}

#define __lnc__f476
/// __lnc__f476()
if (live_enabled) {
	window_set_size(argument0,argument1);
}

#define __lnc__f477
/// __lnc__f477()
if (live_enabled) {
	window_set_rectangle(argument0,argument1,argument2,argument3);
}

#define __lnc__f478
/// __lnc__f478()
if (live_enabled) {
	window_center();
}

#define __lnc__f479
/// __lnc__f479()->Any
if (live_enabled) {
	return window_get_x();
} else return undefined;

#define __lnc__f480
/// __lnc__f480()->Any
if (live_enabled) {
	return window_get_y();
} else return undefined;

#define __lnc__f481
/// __lnc__f481()->Any
if (live_enabled) {
	return window_get_width();
} else return undefined;

#define __lnc__f482
/// __lnc__f482()->Any
if (live_enabled) {
	return window_get_height();
} else return undefined;

#define __lnc__f483
/// __lnc__f483()->Any
if (live_enabled) {
	return window_mouse_get_x();
} else return undefined;

#define __lnc__f484
/// __lnc__f484()->Any
if (live_enabled) {
	return window_mouse_get_y();
} else return undefined;

#define __lnc__f485
/// __lnc__f485()
if (live_enabled) {
	window_mouse_set(argument0,argument1);
}

#define __lnc__f486
/// __lnc__f486()->Any
if (live_enabled) {
	return window_view_mouse_get_x(argument0);
} else return undefined;

#define __lnc__f487
/// __lnc__f487()->Any
if (live_enabled) {
	return window_view_mouse_get_y(argument0);
} else return undefined;

#define __lnc__f488
/// __lnc__f488()->Any
if (live_enabled) {
	return window_views_mouse_get_x();
} else return undefined;

#define __lnc__f489
/// __lnc__f489()->Any
if (live_enabled) {
	return window_views_mouse_get_y();
} else return undefined;

#define __lnc__f490
/// __lnc__f490()
if (live_enabled) {
	sound_play(argument0);
}

#define __lnc__f491
/// __lnc__f491()
if (live_enabled) {
	sound_loop(argument0);
}

#define __lnc__f492
/// __lnc__f492()
if (live_enabled) {
	sound_stop(argument0);
}

#define __lnc__f493
/// __lnc__f493()
if (live_enabled) {
	sound_stop_all();
}

#define __lnc__f494
/// __lnc__f494()
if (live_enabled) {
	sound_isplaying(argument0);
}

#define __lnc__f495
/// __lnc__f495()
if (live_enabled) {
	sound_volume(argument0,argument1);
}

#define __lnc__f496
/// __lnc__f496()
if (live_enabled) {
	sound_global_volume(argument0);
}

#define __lnc__f497
/// __lnc__f497()
if (live_enabled) {
	sound_fade(argument0,argument1,argument2);
}

#define __lnc__f498
/// __lnc__f498()
if (live_enabled) {
	audio_listener_position(argument0,argument1,argument2);
}

#define __lnc__f499
/// __lnc__f499()
if (live_enabled) {
	audio_listener_velocity(argument0,argument1,argument2);
}

#define __lnc__f500
/// __lnc__f500()
if (live_enabled) {
	audio_listener_orientation(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f501
/// __lnc__f501()
if (live_enabled) {
	audio_emitter_position(argument0,argument1,argument2,argument3);
}

#define __lnc__f502
/// __lnc__f502()->Any
if (live_enabled) {
	return audio_emitter_create();
} else return undefined;

#define __lnc__f503
/// __lnc__f503()
if (live_enabled) {
	audio_emitter_free(argument0);
}

#define __lnc__f504
/// __lnc__f504()->Any
if (live_enabled) {
	return audio_emitter_exists(argument0);
} else return undefined;

#define __lnc__f505
/// __lnc__f505()
if (live_enabled) {
	audio_emitter_pitch(argument0,argument1);
}

#define __lnc__f506
/// __lnc__f506()
if (live_enabled) {
	audio_emitter_velocity(argument0,argument1,argument2,argument3);
}

#define __lnc__f507
/// __lnc__f507()
if (live_enabled) {
	audio_emitter_falloff(argument0,argument1,argument2,argument3);
}

#define __lnc__f508
/// __lnc__f508()
if (live_enabled) {
	audio_emitter_gain(argument0,argument1);
}

#define __lnc__f509
/// __lnc__f509()->Any
if (live_enabled) {
	return audio_play_sound(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f510
/// __lnc__f510()->Any
if (live_enabled) {
	return audio_play_sound_on(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f511
/// __lnc__f511()->Any
if (live_enabled) {
	return audio_play_sound_at(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
} else return undefined;

#define __lnc__f512
/// __lnc__f512()
if (live_enabled) {
	audio_stop_sound(argument0);
}

#define __lnc__f513
/// __lnc__f513()
if (live_enabled) {
	audio_resume_sound(argument0);
}

#define __lnc__f514
/// __lnc__f514()
if (live_enabled) {
	audio_pause_sound(argument0);
}

#define __lnc__f515
/// __lnc__f515()
if (live_enabled) {
	audio_channel_num(argument0);
}

#define __lnc__f516
/// __lnc__f516()->Any
if (live_enabled) {
	return audio_sound_length(argument0);
} else return undefined;

#define __lnc__f517
/// __lnc__f517()->Any
if (live_enabled) {
	return audio_get_type(argument0);
} else return undefined;

#define __lnc__f518
/// __lnc__f518()
if (live_enabled) {
	audio_falloff_set_model(argument0);
}

#define __lnc__f519
/// __lnc__f519()
if (live_enabled) {
	audio_master_gain(argument0);
}

#define __lnc__f520
/// __lnc__f520()
if (live_enabled) {
	audio_sound_gain(argument0,argument1,argument2);
}

#define __lnc__f521
/// __lnc__f521()
if (live_enabled) {
	audio_sound_pitch(argument0,argument1);
}

#define __lnc__f522
/// __lnc__f522()
if (live_enabled) {
	audio_stop_all();
}

#define __lnc__f523
/// __lnc__f523()
if (live_enabled) {
	audio_resume_all();
}

#define __lnc__f524
/// __lnc__f524()
if (live_enabled) {
	audio_pause_all();
}

#define __lnc__f525
/// __lnc__f525()->Any
if (live_enabled) {
	return audio_is_playing(argument0);
} else return undefined;

#define __lnc__f526
/// __lnc__f526()->Any
if (live_enabled) {
	return audio_is_paused(argument0);
} else return undefined;

#define __lnc__f527
/// __lnc__f527()->Any
if (live_enabled) {
	return audio_exists(argument0);
} else return undefined;

#define __lnc__f528
/// __lnc__f528()->Any
if (live_enabled) {
	return audio_emitter_get_gain(argument0);
} else return undefined;

#define __lnc__f529
/// __lnc__f529()->Any
if (live_enabled) {
	return audio_emitter_get_pitch(argument0);
} else return undefined;

#define __lnc__f530
/// __lnc__f530()->Any
if (live_enabled) {
	return audio_emitter_get_x(argument0);
} else return undefined;

#define __lnc__f531
/// __lnc__f531()->Any
if (live_enabled) {
	return audio_emitter_get_y(argument0);
} else return undefined;

#define __lnc__f532
/// __lnc__f532()->Any
if (live_enabled) {
	return audio_emitter_get_z(argument0);
} else return undefined;

#define __lnc__f533
/// __lnc__f533()->Any
if (live_enabled) {
	return audio_emitter_get_vx(argument0);
} else return undefined;

#define __lnc__f534
/// __lnc__f534()->Any
if (live_enabled) {
	return audio_emitter_get_vy(argument0);
} else return undefined;

#define __lnc__f535
/// __lnc__f535()->Any
if (live_enabled) {
	return audio_emitter_get_vz(argument0);
} else return undefined;

#define __lnc__f536
/// __lnc__f536()
if (live_enabled) {
	audio_listener_set_position(argument0,argument1,argument2,argument3);
}

#define __lnc__f537
/// __lnc__f537()
if (live_enabled) {
	audio_listener_set_velocity(argument0,argument1,argument2,argument3);
}

#define __lnc__f538
/// __lnc__f538()
if (live_enabled) {
	audio_listener_set_orientation(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f539
/// __lnc__f539()->Any
if (live_enabled) {
	return audio_listener_get_data(argument0);
} else return undefined;

#define __lnc__f540
/// __lnc__f540()
if (live_enabled) {
	audio_set_master_gain(argument0,argument1);
}

#define __lnc__f541
/// __lnc__f541()->Any
if (live_enabled) {
	return audio_get_master_gain(argument0);
} else return undefined;

#define __lnc__f542
/// __lnc__f542()->Any
if (live_enabled) {
	return audio_sound_get_gain(argument0);
} else return undefined;

#define __lnc__f543
/// __lnc__f543()->Any
if (live_enabled) {
	return audio_sound_get_pitch(argument0);
} else return undefined;

#define __lnc__f544
/// __lnc__f544()->Any
if (live_enabled) {
	return audio_get_name(argument0);
} else return undefined;

#define __lnc__f545
/// __lnc__f545()
if (live_enabled) {
	audio_sound_set_track_position(argument0,argument1);
}

#define __lnc__f546
/// __lnc__f546()->Any
if (live_enabled) {
	return audio_sound_get_track_position(argument0);
} else return undefined;

#define __lnc__f547
/// __lnc__f547()->Any
if (live_enabled) {
	return audio_create_stream(argument0);
} else return undefined;

#define __lnc__f548
/// __lnc__f548()
if (live_enabled) {
	audio_destroy_stream(argument0);
}

#define __lnc__f549
/// __lnc__f549()->Any
if (live_enabled) {
	return audio_create_sync_group(argument0);
} else return undefined;

#define __lnc__f550
/// __lnc__f550()
if (live_enabled) {
	audio_destroy_sync_group(argument0);
}

#define __lnc__f551
/// __lnc__f551()->Any
if (live_enabled) {
	return audio_play_in_sync_group(argument0,argument1);
} else return undefined;

#define __lnc__f552
/// __lnc__f552()
if (live_enabled) {
	audio_start_sync_group(argument0);
}

#define __lnc__f553
/// __lnc__f553()
if (live_enabled) {
	audio_stop_sync_group(argument0);
}

#define __lnc__f554
/// __lnc__f554()
if (live_enabled) {
	audio_pause_sync_group(argument0);
}

#define __lnc__f555
/// __lnc__f555()
if (live_enabled) {
	audio_resume_sync_group(argument0);
}

#define __lnc__f556
/// __lnc__f556()->Any
if (live_enabled) {
	return audio_sync_group_get_track_pos(argument0);
} else return undefined;

#define __lnc__f557
/// __lnc__f557()
if (live_enabled) {
	audio_sync_group_debug(argument0);
}

#define __lnc__f558
/// __lnc__f558()->Any
if (live_enabled) {
	return audio_sync_group_is_playing(argument0);
} else return undefined;

#define __lnc__f559
/// __lnc__f559()
if (live_enabled) {
	audio_debug(argument0);
}

#define __lnc__f560
/// __lnc__f560()->Any
if (live_enabled) {
	return audio_group_load(argument0);
} else return undefined;

#define __lnc__f561
/// __lnc__f561()
if (live_enabled) {
	audio_group_unload(argument0);
}

#define __lnc__f562
/// __lnc__f562()->Any
if (live_enabled) {
	return audio_group_is_loaded(argument0);
} else return undefined;

#define __lnc__f563
/// __lnc__f563()->Any
if (live_enabled) {
	return audio_group_load_progress(argument0);
} else return undefined;

#define __lnc__f564
/// __lnc__f564()->Any
if (live_enabled) {
	return audio_group_name(argument0);
} else return undefined;

#define __lnc__f565
/// __lnc__f565()
if (live_enabled) {
	audio_group_stop_all(argument0);
}

#define __lnc__f566
/// __lnc__f566()
if (live_enabled) {
	audio_group_set_gain(argument0,argument1,argument2);
}

#define __lnc__f567
/// __lnc__f567()->Any
if (live_enabled) {
	return audio_create_buffer_sound(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f568
/// __lnc__f568()
if (live_enabled) {
	audio_free_buffer_sound(argument0);
}

#define __lnc__f569
/// __lnc__f569()->Any
if (live_enabled) {
	return audio_create_play_queue(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f570
/// __lnc__f570()
if (live_enabled) {
	audio_free_play_queue(argument0);
}

#define __lnc__f571
/// __lnc__f571()
if (live_enabled) {
	audio_queue_sound(argument0,argument1,argument2,argument3);
}

#define __lnc__f572
/// __lnc__f572()->Any
if (live_enabled) {
	return audio_get_recorder_count();
} else return undefined;

#define __lnc__f573
/// __lnc__f573()->Any
if (live_enabled) {
	return audio_get_recorder_info(argument0);
} else return undefined;

#define __lnc__f574
/// __lnc__f574()->Any
if (live_enabled) {
	return audio_start_recording(argument0);
} else return undefined;

#define __lnc__f575
/// __lnc__f575()
if (live_enabled) {
	audio_stop_recording(argument0);
}

#define __lnc__f576
/// __lnc__f576()->Any
if (live_enabled) {
	return audio_sound_get_listener_mask(argument0);
} else return undefined;

#define __lnc__f577
/// __lnc__f577()->Any
if (live_enabled) {
	return audio_emitter_get_listener_mask(argument0);
} else return undefined;

#define __lnc__f578
/// __lnc__f578()->Any
if (live_enabled) {
	return audio_get_listener_mask();
} else return undefined;

#define __lnc__f579
/// __lnc__f579()
if (live_enabled) {
	audio_sound_set_listener_mask(argument0,argument1);
}

#define __lnc__f580
/// __lnc__f580()
if (live_enabled) {
	audio_emitter_set_listener_mask(argument0,argument1);
}

#define __lnc__f581
/// __lnc__f581()
if (live_enabled) {
	audio_set_listener_mask(argument0);
}

#define __lnc__f582
/// __lnc__f582()->Any
if (live_enabled) {
	return audio_get_listener_count();
} else return undefined;

#define __lnc__f583
/// __lnc__f583()->Any
if (live_enabled) {
	return audio_get_listener_info(argument0);
} else return undefined;

#define __lnc__f584
/// __lnc__f584()
if (live_enabled) {
	audio_system();
}

#define __lnc__f585
/// __lnc__f585()
if (live_enabled) {
	show_message(argument0);
}

#define __lnc__f586
/// __lnc__f586()
if (live_enabled) {
	show_message_async(argument0);
}

#define __lnc__f587
/// __lnc__f587()->Any
if (live_enabled) {
	return clickable_add(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f588
/// __lnc__f588()->Any
if (live_enabled) {
	return clickable_add_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f589
/// __lnc__f589()
if (live_enabled) {
	clickable_change(argument0,argument1,argument2,argument3);
}

#define __lnc__f590
/// __lnc__f590()
if (live_enabled) {
	clickable_change_ext(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f591
/// __lnc__f591()
if (live_enabled) {
	clickable_delete(argument0);
}

#define __lnc__f592
/// __lnc__f592()->Any
if (live_enabled) {
	return clickable_exists(argument0);
} else return undefined;

#define __lnc__f593
/// __lnc__f593()
if (live_enabled) {
	clickable_set_style(argument0,argument1);
}

#define __lnc__f594
/// __lnc__f594()->Any
if (live_enabled) {
	return show_question(argument0);
} else return undefined;

#define __lnc__f595
/// __lnc__f595()->Any
if (live_enabled) {
	return show_question_async(argument0);
} else return undefined;

#define __lnc__f596
/// __lnc__f596()->Any
if (live_enabled) {
	return get_integer(argument0,argument1);
} else return undefined;

#define __lnc__f597
/// __lnc__f597()->Any
if (live_enabled) {
	return get_string(argument0,argument1);
} else return undefined;

#define __lnc__f598
/// __lnc__f598()->Any
if (live_enabled) {
	return get_integer_async(argument0,argument1);
} else return undefined;

#define __lnc__f599
/// __lnc__f599()->Any
if (live_enabled) {
	return get_string_async(argument0,argument1);
} else return undefined;

#define __lnc__f600
/// __lnc__f600()->Any
if (live_enabled) {
	return get_login_async(argument0,argument1);
} else return undefined;

#define __lnc__f601
/// __lnc__f601()->Any
if (live_enabled) {
	return get_open_filename(argument0,argument1);
} else return undefined;

#define __lnc__f602
/// __lnc__f602()->Any
if (live_enabled) {
	return get_save_filename(argument0,argument1);
} else return undefined;

#define __lnc__f603
/// __lnc__f603()->Any
if (live_enabled) {
	return get_open_filename_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f604
/// __lnc__f604()->Any
if (live_enabled) {
	return get_save_filename_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f605
/// __lnc__f605()
if (live_enabled) {
	show_error(argument0,argument1);
}

#define __lnc__f606
/// __lnc__f606()
if (live_enabled) {
	highscore_clear();
}

#define __lnc__f607
/// __lnc__f607()
if (live_enabled) {
	highscore_add(argument0,argument1);
}

#define __lnc__f608
/// __lnc__f608()->Any
if (live_enabled) {
	return highscore_value(argument0);
} else return undefined;

#define __lnc__f609
/// __lnc__f609()->Any
if (live_enabled) {
	return highscore_name(argument0);
} else return undefined;

#define __lnc__f610
/// __lnc__f610()
if (live_enabled) {
	draw_highscore(argument0,argument1,argument2,argument3);
}

#define __lnc__f611
/// __lnc__f611()->Any
if (live_enabled) {
	return sprite_exists(argument0);
} else return undefined;

#define __lnc__f612
/// __lnc__f612()->Any
if (live_enabled) {
	return sprite_get_name(argument0);
} else return undefined;

#define __lnc__f613
/// __lnc__f613()->Any
if (live_enabled) {
	return sprite_get_number(argument0);
} else return undefined;

#define __lnc__f614
/// __lnc__f614()->Any
if (live_enabled) {
	return sprite_get_width(argument0);
} else return undefined;

#define __lnc__f615
/// __lnc__f615()->Any
if (live_enabled) {
	return sprite_get_height(argument0);
} else return undefined;

#define __lnc__f616
/// __lnc__f616()->Any
if (live_enabled) {
	return sprite_get_xoffset(argument0);
} else return undefined;

#define __lnc__f617
/// __lnc__f617()->Any
if (live_enabled) {
	return sprite_get_yoffset(argument0);
} else return undefined;

#define __lnc__f618
/// __lnc__f618()->Any
if (live_enabled) {
	return sprite_get_bbox_left(argument0);
} else return undefined;

#define __lnc__f619
/// __lnc__f619()->Any
if (live_enabled) {
	return sprite_get_bbox_right(argument0);
} else return undefined;

#define __lnc__f620
/// __lnc__f620()->Any
if (live_enabled) {
	return sprite_get_bbox_top(argument0);
} else return undefined;

#define __lnc__f621
/// __lnc__f621()->Any
if (live_enabled) {
	return sprite_get_bbox_bottom(argument0);
} else return undefined;

#define __lnc__f622
/// __lnc__f622()
if (live_enabled) {
	sprite_save(argument0,argument1,argument2);
}

#define __lnc__f623
/// __lnc__f623()
if (live_enabled) {
	sprite_save_strip(argument0,argument1);
}

#define __lnc__f624
/// __lnc__f624()
if (live_enabled) {
	sprite_set_cache_size(argument0,argument1);
}

#define __lnc__f625
/// __lnc__f625()
if (live_enabled) {
	sprite_set_cache_size_ext(argument0,argument1,argument2);
}

#define __lnc__f626
/// __lnc__f626()->Any
if (live_enabled) {
	return sprite_get_tpe(argument0,argument1);
} else return undefined;

#define __lnc__f627
/// __lnc__f627()
if (live_enabled) {
	sprite_prefetch(argument0);
}

#define __lnc__f628
/// __lnc__f628()
if (live_enabled) {
	sprite_prefetch_multi(argument0);
}

#define __lnc__f629
/// __lnc__f629()
if (live_enabled) {
	sprite_flush(argument0);
}

#define __lnc__f630
/// __lnc__f630()
if (live_enabled) {
	sprite_flush_multi(argument0);
}

#define __lnc__f631
/// __lnc__f631()->Any
if (live_enabled) {
	return sound_exists(argument0);
} else return undefined;

#define __lnc__f632
/// __lnc__f632()->Any
if (live_enabled) {
	return sound_get_name(argument0);
} else return undefined;

#define __lnc__f633
/// __lnc__f633()->Any
if (live_enabled) {
	return sound_get_kind(argument0);
} else return undefined;

#define __lnc__f634
/// __lnc__f634()->Any
if (live_enabled) {
	return sound_get_preload(argument0);
} else return undefined;

#define __lnc__f635
/// __lnc__f635()
if (live_enabled) {
	sound_discard(argument0);
}

#define __lnc__f636
/// __lnc__f636()
if (live_enabled) {
	sound_restore(argument0);
}

#define __lnc__f637
/// __lnc__f637()->Any
if (live_enabled) {
	return background_exists(argument0);
} else return undefined;

#define __lnc__f638
/// __lnc__f638()->Any
if (live_enabled) {
	return background_get_name(argument0);
} else return undefined;

#define __lnc__f639
/// __lnc__f639()->Any
if (live_enabled) {
	return background_get_width(argument0);
} else return undefined;

#define __lnc__f640
/// __lnc__f640()->Any
if (live_enabled) {
	return background_get_height(argument0);
} else return undefined;

#define __lnc__f641
/// __lnc__f641()
if (live_enabled) {
	background_save(argument0,argument1);
}

#define __lnc__f642
/// __lnc__f642()
if (live_enabled) {
	background_prefetch(argument0);
}

#define __lnc__f643
/// __lnc__f643()
if (live_enabled) {
	background_prefetch_multi(argument0);
}

#define __lnc__f644
/// __lnc__f644()
if (live_enabled) {
	background_flush(argument0);
}

#define __lnc__f645
/// __lnc__f645()
if (live_enabled) {
	background_flush_multi(argument0);
}

#define __lnc__f646
/// __lnc__f646()->Any
if (live_enabled) {
	return font_exists(argument0);
} else return undefined;

#define __lnc__f647
/// __lnc__f647()->Any
if (live_enabled) {
	return font_get_name(argument0);
} else return undefined;

#define __lnc__f648
/// __lnc__f648()->Any
if (live_enabled) {
	return font_get_fontname(argument0);
} else return undefined;

#define __lnc__f649
/// __lnc__f649()->Any
if (live_enabled) {
	return font_get_bold(argument0);
} else return undefined;

#define __lnc__f650
/// __lnc__f650()->Any
if (live_enabled) {
	return font_get_italic(argument0);
} else return undefined;

#define __lnc__f651
/// __lnc__f651()->Any
if (live_enabled) {
	return font_get_first(argument0);
} else return undefined;

#define __lnc__f652
/// __lnc__f652()->Any
if (live_enabled) {
	return font_get_last(argument0);
} else return undefined;

#define __lnc__f653
/// __lnc__f653()->Any
if (live_enabled) {
	return font_get_size(argument0);
} else return undefined;

#define __lnc__f654
/// __lnc__f654()
if (live_enabled) {
	font_set_cache_size(argument0,argument1);
}

#define __lnc__f655
/// __lnc__f655()->Any
if (live_enabled) {
	return path_exists(argument0);
} else return undefined;

#define __lnc__f656
/// __lnc__f656()->Any
if (live_enabled) {
	return path_get_name(argument0);
} else return undefined;

#define __lnc__f657
/// __lnc__f657()->Any
if (live_enabled) {
	return path_get_length(argument0);
} else return undefined;

#define __lnc__f658
/// __lnc__f658()->Any
if (live_enabled) {
	return path_get_time(argument0,argument1);
} else return undefined;

#define __lnc__f659
/// __lnc__f659()->Any
if (live_enabled) {
	return path_get_kind(argument0);
} else return undefined;

#define __lnc__f660
/// __lnc__f660()->Any
if (live_enabled) {
	return path_get_closed(argument0);
} else return undefined;

#define __lnc__f661
/// __lnc__f661()->Any
if (live_enabled) {
	return path_get_precision(argument0);
} else return undefined;

#define __lnc__f662
/// __lnc__f662()->Any
if (live_enabled) {
	return path_get_number(argument0);
} else return undefined;

#define __lnc__f663
/// __lnc__f663()->Any
if (live_enabled) {
	return path_get_point_x(argument0,argument1);
} else return undefined;

#define __lnc__f664
/// __lnc__f664()->Any
if (live_enabled) {
	return path_get_point_y(argument0,argument1);
} else return undefined;

#define __lnc__f665
/// __lnc__f665()->Any
if (live_enabled) {
	return path_get_point_speed(argument0,argument1);
} else return undefined;

#define __lnc__f666
/// __lnc__f666()->Any
if (live_enabled) {
	return path_get_x(argument0,argument1);
} else return undefined;

#define __lnc__f667
/// __lnc__f667()->Any
if (live_enabled) {
	return path_get_y(argument0,argument1);
} else return undefined;

#define __lnc__f668
/// __lnc__f668()->Any
if (live_enabled) {
	return path_get_speed(argument0,argument1);
} else return undefined;

#define __lnc__f669
/// __lnc__f669()->Any
if (live_enabled) {
	return script_exists(argument0);
} else return undefined;

#define __lnc__f670
/// __lnc__f670()->Any
if (live_enabled) {
	return script_get_name(argument0);
} else return undefined;

#define __lnc__f671
/// __lnc__f671()->Any
if (live_enabled) {
	return timeline_exists(argument0);
} else return undefined;

#define __lnc__f672
/// __lnc__f672()->Any
if (live_enabled) {
	return timeline_get_name(argument0);
} else return undefined;

#define __lnc__f673
/// __lnc__f673()
if (live_enabled) {
	timeline_moment_clear(argument0,argument1);
}

#define __lnc__f674
/// __lnc__f674()
if (live_enabled) {
	timeline_moment_add_script(argument0,argument1,argument2);
}

#define __lnc__f675
/// __lnc__f675()->Any
if (live_enabled) {
	return timeline_size(argument0);
} else return undefined;

#define __lnc__f676
/// __lnc__f676()->Any
if (live_enabled) {
	return timeline_max_moment(argument0);
} else return undefined;

#define __lnc__f677
/// __lnc__f677()->Any
if (live_enabled) {
	return object_exists(argument0);
} else return undefined;

#define __lnc__f678
/// __lnc__f678()->Any
if (live_enabled) {
	return object_get_name(argument0);
} else return undefined;

#define __lnc__f679
/// __lnc__f679()->Any
if (live_enabled) {
	return object_get_sprite(argument0);
} else return undefined;

#define __lnc__f680
/// __lnc__f680()->Any
if (live_enabled) {
	return object_get_solid(argument0);
} else return undefined;

#define __lnc__f681
/// __lnc__f681()->Any
if (live_enabled) {
	return object_get_visible(argument0);
} else return undefined;

#define __lnc__f682
/// __lnc__f682()->Any
if (live_enabled) {
	return object_get_depth(argument0);
} else return undefined;

#define __lnc__f683
/// __lnc__f683()->Any
if (live_enabled) {
	return object_get_persistent(argument0);
} else return undefined;

#define __lnc__f684
/// __lnc__f684()->Any
if (live_enabled) {
	return object_get_mask(argument0);
} else return undefined;

#define __lnc__f685
/// __lnc__f685()->Any
if (live_enabled) {
	return object_get_parent(argument0);
} else return undefined;

#define __lnc__f686
/// __lnc__f686()->Any
if (live_enabled) {
	return object_get_physics(argument0);
} else return undefined;

#define __lnc__f687
/// __lnc__f687()->Any
if (live_enabled) {
	return object_is_ancestor(argument0,argument1);
} else return undefined;

#define __lnc__f688
/// __lnc__f688()->Any
if (live_enabled) {
	return room_exists(argument0);
} else return undefined;

#define __lnc__f689
/// __lnc__f689()->Any
if (live_enabled) {
	return room_get_name(argument0);
} else return undefined;

#define __lnc__f690
/// __lnc__f690()
if (live_enabled) {
	sprite_set_offset(argument0,argument1,argument2);
}

#define __lnc__f691
/// __lnc__f691()->Any
if (live_enabled) {
	return sprite_duplicate(argument0);
} else return undefined;

#define __lnc__f692
/// __lnc__f692()
if (live_enabled) {
	sprite_assign(argument0,argument1);
}

#define __lnc__f693
/// __lnc__f693()
if (live_enabled) {
	sprite_merge(argument0,argument1);
}

#define __lnc__f694
/// __lnc__f694()->Any
if (live_enabled) {
	return sprite_add(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f695
/// __lnc__f695()
if (live_enabled) {
	sprite_replace(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f696
/// __lnc__f696()->Any
if (live_enabled) {
	return sprite_create_from_surface(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
} else return undefined;

#define __lnc__f697
/// __lnc__f697()->Any
if (live_enabled) {
	return sprite_add_from_surface(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f698
/// __lnc__f698()
if (live_enabled) {
	sprite_delete(argument0);
}

#define __lnc__f699
/// __lnc__f699()
if (live_enabled) {
	sprite_set_alpha_from_sprite(argument0,argument1);
}

#define __lnc__f700
/// __lnc__f700()
if (live_enabled) {
	sprite_collision_mask(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f701
/// __lnc__f701()
if (live_enabled) {
	sound_delete(argument0);
}

#define __lnc__f702
/// __lnc__f702()
if (live_enabled) {
	background_duplicate(argument0);
}

#define __lnc__f703
/// __lnc__f703()
if (live_enabled) {
	background_assign(argument0,argument1);
}

#define __lnc__f704
/// __lnc__f704()
if (live_enabled) {
	background_add(argument0,argument1,argument2);
}

#define __lnc__f705
/// __lnc__f705()
if (live_enabled) {
	background_replace(argument0,argument1,argument2,argument3);
}

#define __lnc__f706
/// __lnc__f706()->Any
if (live_enabled) {
	return background_create_colour(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f707
/// __lnc__f707()->Any
if (live_enabled) {
	return background_create_gradient(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f708
/// __lnc__f708()->Any
if (live_enabled) {
	return background_create_from_surface(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f709
/// __lnc__f709()
if (live_enabled) {
	background_delete(argument0);
}

#define __lnc__f710
/// __lnc__f710()
if (live_enabled) {
	background_set_alpha_from_background(argument0,argument1);
}

#define __lnc__f711
/// __lnc__f711()->Any
if (live_enabled) {
	return font_add(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f712
/// __lnc__f712()->Any
if (live_enabled) {
	return font_add_sprite(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f713
/// __lnc__f713()->Any
if (live_enabled) {
	return font_add_sprite_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f714
/// __lnc__f714()
if (live_enabled) {
	font_replace_sprite(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f715
/// __lnc__f715()
if (live_enabled) {
	font_replace_sprite_ext(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f716
/// __lnc__f716()
if (live_enabled) {
	font_delete(argument0);
}

#define __lnc__f717
/// __lnc__f717()
if (live_enabled) {
	font_set_dynamic_texture_size(argument0);
}

#define __lnc__f718
/// __lnc__f718()->Any
if (live_enabled) {
	return font_get_dynamic_texture_size();
} else return undefined;

#define __lnc__f719
/// __lnc__f719()
if (live_enabled) {
	path_set_kind(argument0,argument1);
}

#define __lnc__f720
/// __lnc__f720()
if (live_enabled) {
	path_set_closed(argument0,argument1);
}

#define __lnc__f721
/// __lnc__f721()
if (live_enabled) {
	path_set_precision(argument0,argument1);
}

#define __lnc__f722
/// __lnc__f722()->Any
if (live_enabled) {
	return path_add();
} else return undefined;

#define __lnc__f723
/// __lnc__f723()
if (live_enabled) {
	path_assign(argument0,argument1);
}

#define __lnc__f724
/// __lnc__f724()->Any
if (live_enabled) {
	return path_duplicate(argument0);
} else return undefined;

#define __lnc__f725
/// __lnc__f725()
if (live_enabled) {
	path_append(argument0,argument1);
}

#define __lnc__f726
/// __lnc__f726()
if (live_enabled) {
	path_delete(argument0);
}

#define __lnc__f727
/// __lnc__f727()
if (live_enabled) {
	path_add_point(argument0,argument1,argument2,argument3);
}

#define __lnc__f728
/// __lnc__f728()
if (live_enabled) {
	path_insert_point(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f729
/// __lnc__f729()
if (live_enabled) {
	path_change_point(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f730
/// __lnc__f730()
if (live_enabled) {
	path_delete_point(argument0,argument1);
}

#define __lnc__f731
/// __lnc__f731()
if (live_enabled) {
	path_clear_points(argument0);
}

#define __lnc__f732
/// __lnc__f732()
if (live_enabled) {
	path_reverse(argument0);
}

#define __lnc__f733
/// __lnc__f733()
if (live_enabled) {
	path_mirror(argument0);
}

#define __lnc__f734
/// __lnc__f734()
if (live_enabled) {
	path_flip(argument0);
}

#define __lnc__f735
/// __lnc__f735()
if (live_enabled) {
	path_rotate(argument0,argument1);
}

#define __lnc__f736
/// __lnc__f736()
if (live_enabled) {
	path_rescale(argument0,argument1,argument2);
}

#define __lnc__f737
/// __lnc__f737()
if (live_enabled) {
	path_shift(argument0,argument1,argument2);
}

#define __lnc__f738
/// __lnc__f738()->Any
if (live_enabled) {
	return timeline_add();
} else return undefined;

#define __lnc__f739
/// __lnc__f739()
if (live_enabled) {
	timeline_delete(argument0);
}

#define __lnc__f740
/// __lnc__f740()
if (live_enabled) {
	timeline_clear(argument0);
}

#define __lnc__f741
/// __lnc__f741()
if (live_enabled) {
	object_set_sprite(argument0,argument1);
}

#define __lnc__f742
/// __lnc__f742()
if (live_enabled) {
	object_set_solid(argument0,argument1);
}

#define __lnc__f743
/// __lnc__f743()
if (live_enabled) {
	object_set_visible(argument0,argument1);
}

#define __lnc__f744
/// __lnc__f744()
if (live_enabled) {
	object_set_depth(argument0,argument1);
}

#define __lnc__f745
/// __lnc__f745()
if (live_enabled) {
	object_set_persistent(argument0,argument1);
}

#define __lnc__f746
/// __lnc__f746()
if (live_enabled) {
	object_set_mask(argument0,argument1);
}

#define __lnc__f747
/// __lnc__f747()
if (live_enabled) {
	room_set_width(argument0,argument1);
}

#define __lnc__f748
/// __lnc__f748()
if (live_enabled) {
	room_set_height(argument0,argument1);
}

#define __lnc__f749
/// __lnc__f749()
if (live_enabled) {
	room_set_persistent(argument0,argument1);
}

#define __lnc__f750
/// __lnc__f750()
if (live_enabled) {
	room_set_background_colour(argument0,argument1,argument2);
}

#define __lnc__f751
/// __lnc__f751()
if (live_enabled) {
	room_set_background(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
}

#define __lnc__f752
/// __lnc__f752()
if (live_enabled) {
	room_set_view(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14,argument15);
}

#define __lnc__f753
/// __lnc__f753()
if (live_enabled) {
	room_set_view_enabled(argument0,argument1);
}

#define __lnc__f754
/// __lnc__f754()->Any
if (live_enabled) {
	return room_add();
} else return undefined;

#define __lnc__f755
/// __lnc__f755()->Any
if (live_enabled) {
	return room_duplicate(argument0);
} else return undefined;

#define __lnc__f756
/// __lnc__f756()
if (live_enabled) {
	room_assign(argument0,argument1);
}

#define __lnc__f757
/// __lnc__f757()->Any
if (live_enabled) {
	return room_instance_add(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f758
/// __lnc__f758()
if (live_enabled) {
	room_instance_clear(argument0);
}

#define __lnc__f759
/// __lnc__f759()
if (live_enabled) {
	room_tile_add(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f760
/// __lnc__f760()
if (live_enabled) {
	room_tile_add_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
}

#define __lnc__f761
/// __lnc__f761()
if (live_enabled) {
	room_tile_clear(argument0);
}

#define __lnc__f762
/// __lnc__f762()->Any
if (live_enabled) {
	return asset_get_index(argument0);
} else return undefined;

#define __lnc__f763
/// __lnc__f763()->Any
if (live_enabled) {
	return asset_get_type(argument0);
} else return undefined;

#define __lnc__f764
/// __lnc__f764()->Any
if (live_enabled) {
	return file_text_open_from_string(argument0);
} else return undefined;

#define __lnc__f765
/// __lnc__f765()->Any
if (live_enabled) {
	return file_text_open_read(argument0);
} else return undefined;

#define __lnc__f766
/// __lnc__f766()->Any
if (live_enabled) {
	return file_text_open_write(argument0);
} else return undefined;

#define __lnc__f767
/// __lnc__f767()->Any
if (live_enabled) {
	return file_text_open_append(argument0);
} else return undefined;

#define __lnc__f768
/// __lnc__f768()
if (live_enabled) {
	file_text_close(argument0);
}

#define __lnc__f769
/// __lnc__f769()
if (live_enabled) {
	file_text_write_string(argument0,argument1);
}

#define __lnc__f770
/// __lnc__f770()
if (live_enabled) {
	file_text_write_real(argument0,argument1);
}

#define __lnc__f771
/// __lnc__f771()
if (live_enabled) {
	file_text_writeln(argument0);
}

#define __lnc__f772
/// __lnc__f772()->Any
if (live_enabled) {
	return file_text_read_string(argument0);
} else return undefined;

#define __lnc__f773
/// __lnc__f773()->Any
if (live_enabled) {
	return file_text_read_real(argument0);
} else return undefined;

#define __lnc__f774
/// __lnc__f774()->Any
if (live_enabled) {
	return file_text_readln(argument0);
} else return undefined;

#define __lnc__f775
/// __lnc__f775()->Any
if (live_enabled) {
	return file_text_eof(argument0);
} else return undefined;

#define __lnc__f776
/// __lnc__f776()->Any
if (live_enabled) {
	return file_text_eoln(argument0);
} else return undefined;

#define __lnc__f777
/// __lnc__f777()->Any
if (live_enabled) {
	return file_exists(argument0);
} else return undefined;

#define __lnc__f778
/// __lnc__f778()
if (live_enabled) {
	file_delete(argument0);
}

#define __lnc__f779
/// __lnc__f779()
if (live_enabled) {
	file_rename(argument0,argument1);
}

#define __lnc__f780
/// __lnc__f780()
if (live_enabled) {
	file_copy(argument0,argument1);
}

#define __lnc__f781
/// __lnc__f781()->Any
if (live_enabled) {
	return directory_exists(argument0);
} else return undefined;

#define __lnc__f782
/// __lnc__f782()->Any
if (live_enabled) {
	return directory_create(argument0);
} else return undefined;

#define __lnc__f783
/// __lnc__f783()
if (live_enabled) {
	directory_destroy(argument0);
}

#define __lnc__f784
/// __lnc__f784()->Any
if (live_enabled) {
	return file_find_first(argument0,argument1);
} else return undefined;

#define __lnc__f785
/// __lnc__f785()->Any
if (live_enabled) {
	return file_find_next();
} else return undefined;

#define __lnc__f786
/// __lnc__f786()->Any
if (live_enabled) {
	return file_find_close();
} else return undefined;

#define __lnc__f787
/// __lnc__f787()->Any
if (live_enabled) {
	return file_attributes(argument0,argument1);
} else return undefined;

#define __lnc__f788
/// __lnc__f788()->Any
if (live_enabled) {
	return filename_name(argument0);
} else return undefined;

#define __lnc__f789
/// __lnc__f789()->Any
if (live_enabled) {
	return filename_path(argument0);
} else return undefined;

#define __lnc__f790
/// __lnc__f790()->Any
if (live_enabled) {
	return filename_dir(argument0);
} else return undefined;

#define __lnc__f791
/// __lnc__f791()->Any
if (live_enabled) {
	return filename_drive(argument0);
} else return undefined;

#define __lnc__f792
/// __lnc__f792()->Any
if (live_enabled) {
	return filename_ext(argument0);
} else return undefined;

#define __lnc__f793
/// __lnc__f793()->Any
if (live_enabled) {
	return filename_change_ext(argument0,argument1);
} else return undefined;

#define __lnc__f794
/// __lnc__f794()->Any
if (live_enabled) {
	return file_bin_open(argument0,argument1);
} else return undefined;

#define __lnc__f795
/// __lnc__f795()
if (live_enabled) {
	file_bin_rewrite(argument0);
}

#define __lnc__f796
/// __lnc__f796()
if (live_enabled) {
	file_bin_close(argument0);
}

#define __lnc__f797
/// __lnc__f797()->Any
if (live_enabled) {
	return file_bin_position(argument0);
} else return undefined;

#define __lnc__f798
/// __lnc__f798()->Any
if (live_enabled) {
	return file_bin_size(argument0);
} else return undefined;

#define __lnc__f799
/// __lnc__f799()
if (live_enabled) {
	file_bin_seek(argument0,argument1);
}

#define __lnc__f800
/// __lnc__f800()
if (live_enabled) {
	file_bin_write_byte(argument0,argument1);
}

#define __lnc__f801
/// __lnc__f801()->Any
if (live_enabled) {
	return file_bin_read_byte(argument0);
} else return undefined;

#define __lnc__f802
/// __lnc__f802()->Any
if (live_enabled) {
	return parameter_count();
} else return undefined;

#define __lnc__f803
/// __lnc__f803()->Any
if (live_enabled) {
	return parameter_string(argument0);
} else return undefined;

#define __lnc__f804
/// __lnc__f804()->Any
if (live_enabled) {
	return environment_get_variable(argument0);
} else return undefined;

#define __lnc__f805
/// __lnc__f805()
if (live_enabled) {
	ini_open_from_string(argument0);
}

#define __lnc__f806
/// __lnc__f806()
if (live_enabled) {
	ini_open(argument0);
}

#define __lnc__f807
/// __lnc__f807()->Any
if (live_enabled) {
	return ini_close();
} else return undefined;

#define __lnc__f808
/// __lnc__f808()->Any
if (live_enabled) {
	return ini_read_string(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f809
/// __lnc__f809()->Any
if (live_enabled) {
	return ini_read_real(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f810
/// __lnc__f810()
if (live_enabled) {
	ini_write_string(argument0,argument1,argument2);
}

#define __lnc__f811
/// __lnc__f811()
if (live_enabled) {
	ini_write_real(argument0,argument1,argument2);
}

#define __lnc__f812
/// __lnc__f812()->Any
if (live_enabled) {
	return ini_key_exists(argument0,argument1);
} else return undefined;

#define __lnc__f813
/// __lnc__f813()->Any
if (live_enabled) {
	return ini_section_exists(argument0);
} else return undefined;

#define __lnc__f814
/// __lnc__f814()
if (live_enabled) {
	ini_key_delete(argument0,argument1);
}

#define __lnc__f815
/// __lnc__f815()
if (live_enabled) {
	ini_section_delete(argument0);
}

#define __lnc__f816
/// __lnc__f816()
if (live_enabled) {
	ds_set_precision(argument0);
}

#define __lnc__f817
/// __lnc__f817()->Any
if (live_enabled) {
	return ds_exists(argument0,argument1);
} else return undefined;

#define __lnc__f818
/// __lnc__f818()->Any
if (live_enabled) {
	return ds_stack_create();
} else return undefined;

#define __lnc__f819
/// __lnc__f819()
if (live_enabled) {
	ds_stack_destroy(argument0);
}

#define __lnc__f820
/// __lnc__f820()
if (live_enabled) {
	ds_stack_clear(argument0);
}

#define __lnc__f821
/// __lnc__f821()
if (live_enabled) {
	ds_stack_copy(argument0,argument1);
}

#define __lnc__f822
/// __lnc__f822()->Any
if (live_enabled) {
	return ds_stack_size(argument0);
} else return undefined;

#define __lnc__f823
/// __lnc__f823()
if (live_enabled) {
	ds_stack_empty(argument0);
}

#define __lnc__f824
/// __lnc__f824()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("ds_stack_push needs at least 2 arguments, got "+string(argument_count));break;
		case 2:ds_stack_push(argument[0],argument[1]);break;
		case 3:ds_stack_push(argument[0],argument[1],argument[2]);break;
		case 4:ds_stack_push(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:ds_stack_push(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f825
/// __lnc__f825()
if (live_enabled) {
	ds_stack_pop(argument0);
}

#define __lnc__f826
/// __lnc__f826()->Any
if (live_enabled) {
	return ds_stack_top(argument0);
} else return undefined;

#define __lnc__f827
/// __lnc__f827()->Any
if (live_enabled) {
	return ds_stack_write(argument0);
} else return undefined;

#define __lnc__f828
/// __lnc__f828()->Any
if (live_enabled) {
	return ds_stack_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f829
/// __lnc__f829()->Any
if (live_enabled) {
	return ds_queue_create();
} else return undefined;

#define __lnc__f830
/// __lnc__f830()
if (live_enabled) {
	ds_queue_destroy(argument0);
}

#define __lnc__f831
/// __lnc__f831()
if (live_enabled) {
	ds_queue_clear(argument0);
}

#define __lnc__f832
/// __lnc__f832()
if (live_enabled) {
	ds_queue_copy(argument0,argument1);
}

#define __lnc__f833
/// __lnc__f833()->Any
if (live_enabled) {
	return ds_queue_size(argument0);
} else return undefined;

#define __lnc__f834
/// __lnc__f834()->Any
if (live_enabled) {
	return ds_queue_empty(argument0);
} else return undefined;

#define __lnc__f835
/// __lnc__f835()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("ds_queue_enqueue needs at least 2 arguments, got "+string(argument_count));break;
		case 2:ds_queue_enqueue(argument[0],argument[1]);break;
		case 3:ds_queue_enqueue(argument[0],argument[1],argument[2]);break;
		case 4:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:ds_queue_enqueue(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f836
/// __lnc__f836()->Any
if (live_enabled) {
	return ds_queue_dequeue(argument0);
} else return undefined;

#define __lnc__f837
/// __lnc__f837()->Any
if (live_enabled) {
	return ds_queue_head(argument0);
} else return undefined;

#define __lnc__f838
/// __lnc__f838()->Any
if (live_enabled) {
	return ds_queue_tail(argument0);
} else return undefined;

#define __lnc__f839
/// __lnc__f839()->Any
if (live_enabled) {
	return ds_queue_write(argument0);
} else return undefined;

#define __lnc__f840
/// __lnc__f840()->Any
if (live_enabled) {
	return ds_queue_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f841
/// __lnc__f841()->Any
if (live_enabled) {
	return ds_list_create();
} else return undefined;

#define __lnc__f842
/// __lnc__f842()
if (live_enabled) {
	ds_list_destroy(argument0);
}

#define __lnc__f843
/// __lnc__f843()
if (live_enabled) {
	ds_list_clear(argument0);
}

#define __lnc__f844
/// __lnc__f844()
if (live_enabled) {
	ds_list_copy(argument0,argument1);
}

#define __lnc__f845
/// __lnc__f845()->Any
if (live_enabled) {
	return ds_list_size(argument0);
} else return undefined;

#define __lnc__f846
/// __lnc__f846()->Any
if (live_enabled) {
	return ds_list_empty(argument0);
} else return undefined;

#define __lnc__f847
/// __lnc__f847()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("ds_list_add needs at least 2 arguments, got "+string(argument_count));break;
		case 2:ds_list_add(argument[0],argument[1]);break;
		case 3:ds_list_add(argument[0],argument[1],argument[2]);break;
		case 4:ds_list_add(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:ds_list_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f848
/// __lnc__f848()
if (live_enabled) {
	ds_list_insert(argument0,argument1,argument2);
}

#define __lnc__f849
/// __lnc__f849()
if (live_enabled) {
	ds_list_replace(argument0,argument1,argument2);
}

#define __lnc__f850
/// __lnc__f850()
if (live_enabled) {
	ds_list_delete(argument0,argument1);
}

#define __lnc__f851
/// __lnc__f851()->Any
if (live_enabled) {
	return ds_list_find_index(argument0,argument1);
} else return undefined;

#define __lnc__f852
/// __lnc__f852()->Any
if (live_enabled) {
	return ds_list_find_value(argument0,argument1);
} else return undefined;

#define __lnc__f853
/// __lnc__f853()
if (live_enabled) {
	ds_list_mark_as_list(argument0,argument1);
}

#define __lnc__f854
/// __lnc__f854()
if (live_enabled) {
	ds_list_mark_as_map(argument0,argument1);
}

#define __lnc__f855
/// __lnc__f855()
if (live_enabled) {
	ds_list_sort(argument0,argument1);
}

#define __lnc__f856
/// __lnc__f856()
if (live_enabled) {
	ds_list_shuffle(argument0);
}

#define __lnc__f857
/// __lnc__f857()->Any
if (live_enabled) {
	return ds_list_write(argument0);
} else return undefined;

#define __lnc__f858
/// __lnc__f858()->Any
if (live_enabled) {
	return ds_list_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f859
/// __lnc__f859()->Any
if (live_enabled) {
	return ds_map_create();
} else return undefined;

#define __lnc__f860
/// __lnc__f860()
if (live_enabled) {
	ds_map_destroy(argument0);
}

#define __lnc__f861
/// __lnc__f861()
if (live_enabled) {
	ds_map_clear(argument0);
}

#define __lnc__f862
/// __lnc__f862()
if (live_enabled) {
	ds_map_copy(argument0,argument1);
}

#define __lnc__f863
/// __lnc__f863()->Any
if (live_enabled) {
	return ds_map_size(argument0);
} else return undefined;

#define __lnc__f864
/// __lnc__f864()->Any
if (live_enabled) {
	return ds_map_empty(argument0);
} else return undefined;

#define __lnc__f865
/// __lnc__f865()
if (live_enabled) {
	ds_map_add(argument0,argument1,argument2);
}

#define __lnc__f866
/// __lnc__f866()
if (live_enabled) {
	ds_map_add_list(argument0,argument1,argument2);
}

#define __lnc__f867
/// __lnc__f867()
if (live_enabled) {
	ds_map_add_map(argument0,argument1,argument2);
}

#define __lnc__f868
/// __lnc__f868()
if (live_enabled) {
	ds_map_replace(argument0,argument1,argument2);
}

#define __lnc__f869
/// __lnc__f869()
if (live_enabled) {
	ds_map_replace_map(argument0,argument1,argument2);
}

#define __lnc__f870
/// __lnc__f870()
if (live_enabled) {
	ds_map_replace_list(argument0,argument1,argument2);
}

#define __lnc__f871
/// __lnc__f871()
if (live_enabled) {
	ds_map_delete(argument0,argument1);
}

#define __lnc__f872
/// __lnc__f872()->Any
if (live_enabled) {
	return ds_map_exists(argument0,argument1);
} else return undefined;

#define __lnc__f873
/// __lnc__f873()->Any
if (live_enabled) {
	return ds_map_find_value(argument0,argument1);
} else return undefined;

#define __lnc__f874
/// __lnc__f874()->Any
if (live_enabled) {
	return ds_map_find_previous(argument0,argument1);
} else return undefined;

#define __lnc__f875
/// __lnc__f875()->Any
if (live_enabled) {
	return ds_map_find_next(argument0,argument1);
} else return undefined;

#define __lnc__f876
/// __lnc__f876()->Any
if (live_enabled) {
	return ds_map_find_first(argument0);
} else return undefined;

#define __lnc__f877
/// __lnc__f877()->Any
if (live_enabled) {
	return ds_map_find_last(argument0);
} else return undefined;

#define __lnc__f878
/// __lnc__f878()->Any
if (live_enabled) {
	return ds_map_write(argument0);
} else return undefined;

#define __lnc__f879
/// __lnc__f879()->Any
if (live_enabled) {
	return ds_map_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f880
/// __lnc__f880()
if (live_enabled) {
	ds_map_secure_save(argument0,argument1);
}

#define __lnc__f881
/// __lnc__f881()->Any
if (live_enabled) {
	return ds_map_secure_load(argument0);
} else return undefined;

#define __lnc__f882
/// __lnc__f882()->Any
if (live_enabled) {
	return ds_map_secure_load_buffer(argument0);
} else return undefined;

#define __lnc__f883
/// __lnc__f883()
if (live_enabled) {
	ds_map_secure_save_buffer(argument0,argument1);
}

#define __lnc__f884
/// __lnc__f884()->Any
if (live_enabled) {
	return ds_priority_create();
} else return undefined;

#define __lnc__f885
/// __lnc__f885()
if (live_enabled) {
	ds_priority_destroy(argument0);
}

#define __lnc__f886
/// __lnc__f886()
if (live_enabled) {
	ds_priority_clear(argument0);
}

#define __lnc__f887
/// __lnc__f887()
if (live_enabled) {
	ds_priority_copy(argument0,argument1);
}

#define __lnc__f888
/// __lnc__f888()->Any
if (live_enabled) {
	return ds_priority_size(argument0);
} else return undefined;

#define __lnc__f889
/// __lnc__f889()->Any
if (live_enabled) {
	return ds_priority_empty(argument0);
} else return undefined;

#define __lnc__f890
/// __lnc__f890()
if (live_enabled) {
	ds_priority_add(argument0,argument1,argument2);
}

#define __lnc__f891
/// __lnc__f891()
if (live_enabled) {
	ds_priority_change_priority(argument0,argument1,argument2);
}

#define __lnc__f892
/// __lnc__f892()->Any
if (live_enabled) {
	return ds_priority_find_priority(argument0,argument1);
} else return undefined;

#define __lnc__f893
/// __lnc__f893()
if (live_enabled) {
	ds_priority_delete_value(argument0,argument1);
}

#define __lnc__f894
/// __lnc__f894()->Any
if (live_enabled) {
	return ds_priority_delete_min(argument0);
} else return undefined;

#define __lnc__f895
/// __lnc__f895()->Any
if (live_enabled) {
	return ds_priority_find_min(argument0);
} else return undefined;

#define __lnc__f896
/// __lnc__f896()->Any
if (live_enabled) {
	return ds_priority_delete_max(argument0);
} else return undefined;

#define __lnc__f897
/// __lnc__f897()->Any
if (live_enabled) {
	return ds_priority_find_max(argument0);
} else return undefined;

#define __lnc__f898
/// __lnc__f898()->Any
if (live_enabled) {
	return ds_priority_write(argument0);
} else return undefined;

#define __lnc__f899
/// __lnc__f899()->Any
if (live_enabled) {
	return ds_priority_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f900
/// __lnc__f900()->Any
if (live_enabled) {
	return ds_grid_create(argument0,argument1);
} else return undefined;

#define __lnc__f901
/// __lnc__f901()
if (live_enabled) {
	ds_grid_destroy(argument0);
}

#define __lnc__f902
/// __lnc__f902()
if (live_enabled) {
	ds_grid_copy(argument0,argument1);
}

#define __lnc__f903
/// __lnc__f903()
if (live_enabled) {
	ds_grid_resize(argument0,argument1,argument2);
}

#define __lnc__f904
/// __lnc__f904()->Any
if (live_enabled) {
	return ds_grid_width(argument0);
} else return undefined;

#define __lnc__f905
/// __lnc__f905()->Any
if (live_enabled) {
	return ds_grid_height(argument0);
} else return undefined;

#define __lnc__f906
/// __lnc__f906()
if (live_enabled) {
	ds_grid_clear(argument0,argument1);
}

#define __lnc__f907
/// __lnc__f907()
if (live_enabled) {
	ds_grid_set(argument0,argument1,argument2,argument3);
}

#define __lnc__f908
/// __lnc__f908()
if (live_enabled) {
	ds_grid_add(argument0,argument1,argument2,argument3);
}

#define __lnc__f909
/// __lnc__f909()
if (live_enabled) {
	ds_grid_multiply(argument0,argument1,argument2,argument3);
}

#define __lnc__f910
/// __lnc__f910()
if (live_enabled) {
	ds_grid_set_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f911
/// __lnc__f911()
if (live_enabled) {
	ds_grid_add_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f912
/// __lnc__f912()
if (live_enabled) {
	ds_grid_multiply_region(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f913
/// __lnc__f913()
if (live_enabled) {
	ds_grid_set_disk(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f914
/// __lnc__f914()
if (live_enabled) {
	ds_grid_add_disk(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f915
/// __lnc__f915()
if (live_enabled) {
	ds_grid_multiply_disk(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f916
/// __lnc__f916()
if (live_enabled) {
	ds_grid_set_grid_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f917
/// __lnc__f917()
if (live_enabled) {
	ds_grid_add_grid_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f918
/// __lnc__f918()
if (live_enabled) {
	ds_grid_multiply_grid_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f919
/// __lnc__f919()->Any
if (live_enabled) {
	return ds_grid_get(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f920
/// __lnc__f920()->Any
if (live_enabled) {
	return ds_grid_get_sum(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f921
/// __lnc__f921()->Any
if (live_enabled) {
	return ds_grid_get_max(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f922
/// __lnc__f922()->Any
if (live_enabled) {
	return ds_grid_get_min(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f923
/// __lnc__f923()->Any
if (live_enabled) {
	return ds_grid_get_mean(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f924
/// __lnc__f924()->Any
if (live_enabled) {
	return ds_grid_get_disk_sum(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f925
/// __lnc__f925()->Any
if (live_enabled) {
	return ds_grid_get_disk_min(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f926
/// __lnc__f926()->Any
if (live_enabled) {
	return ds_grid_get_disk_max(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f927
/// __lnc__f927()->Any
if (live_enabled) {
	return ds_grid_get_disk_mean(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f928
/// __lnc__f928()->Any
if (live_enabled) {
	return ds_grid_value_exists(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f929
/// __lnc__f929()->Any
if (live_enabled) {
	return ds_grid_value_x(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f930
/// __lnc__f930()->Any
if (live_enabled) {
	return ds_grid_value_y(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f931
/// __lnc__f931()->Any
if (live_enabled) {
	return ds_grid_value_disk_exists(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f932
/// __lnc__f932()->Any
if (live_enabled) {
	return ds_grid_value_disk_x(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f933
/// __lnc__f933()->Any
if (live_enabled) {
	return ds_grid_value_disk_y(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f934
/// __lnc__f934()
if (live_enabled) {
	ds_grid_shuffle(argument0);
}

#define __lnc__f935
/// __lnc__f935()->Any
if (live_enabled) {
	return ds_grid_write(argument0);
} else return undefined;

#define __lnc__f936
/// __lnc__f936()->Any
if (live_enabled) {
	return ds_grid_read(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f937
/// __lnc__f937()
if (live_enabled) {
	ds_grid_sort(argument0,argument1,argument2);
}

#define __lnc__f938
/// __lnc__f938()->Any
if (live_enabled) {
	return effect_create_below(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f939
/// __lnc__f939()->Any
if (live_enabled) {
	return effect_create_above(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f940
/// __lnc__f940()
if (live_enabled) {
	effect_clear();
}

#define __lnc__f941
/// __lnc__f941()->Any
if (live_enabled) {
	return part_type_create();
} else return undefined;

#define __lnc__f942
/// __lnc__f942()
if (live_enabled) {
	part_type_destroy(argument0);
}

#define __lnc__f943
/// __lnc__f943()->Any
if (live_enabled) {
	return part_type_exists(argument0);
} else return undefined;

#define __lnc__f944
/// __lnc__f944()
if (live_enabled) {
	part_type_clear(argument0);
}

#define __lnc__f945
/// __lnc__f945()
if (live_enabled) {
	part_type_shape(argument0,argument1);
}

#define __lnc__f946
/// __lnc__f946()
if (live_enabled) {
	part_type_sprite(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f947
/// __lnc__f947()->Any
if (live_enabled) {
	return part_type_size(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f948
/// __lnc__f948()
if (live_enabled) {
	part_type_scale(argument0,argument1,argument2);
}

#define __lnc__f949
/// __lnc__f949()
if (live_enabled) {
	part_type_orientation(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f950
/// __lnc__f950()
if (live_enabled) {
	part_type_life(argument0,argument1,argument2);
}

#define __lnc__f951
/// __lnc__f951()
if (live_enabled) {
	part_type_step(argument0,argument1,argument2);
}

#define __lnc__f952
/// __lnc__f952()
if (live_enabled) {
	part_type_death(argument0,argument1,argument2);
}

#define __lnc__f953
/// __lnc__f953()
if (live_enabled) {
	part_type_speed(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f954
/// __lnc__f954()
if (live_enabled) {
	part_type_direction(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f955
/// __lnc__f955()
if (live_enabled) {
	part_type_gravity(argument0,argument1,argument2);
}

#define __lnc__f956
/// __lnc__f956()
if (live_enabled) {
	part_type_colour1(argument0,argument1);
}

#define __lnc__f957
/// __lnc__f957()
if (live_enabled) {
	part_type_colour2(argument0,argument1,argument2);
}

#define __lnc__f958
/// __lnc__f958()
if (live_enabled) {
	part_type_colour3(argument0,argument1,argument2,argument3);
}

#define __lnc__f959
/// __lnc__f959()
if (live_enabled) {
	part_type_colour_mix(argument0,argument1,argument2);
}

#define __lnc__f960
/// __lnc__f960()
if (live_enabled) {
	part_type_colour_rgb(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f961
/// __lnc__f961()
if (live_enabled) {
	part_type_colour_hsv(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f962
/// __lnc__f962()
if (live_enabled) {
	part_type_alpha1(argument0,argument1);
}

#define __lnc__f963
/// __lnc__f963()
if (live_enabled) {
	part_type_alpha2(argument0,argument1,argument2);
}

#define __lnc__f964
/// __lnc__f964()
if (live_enabled) {
	part_type_alpha3(argument0,argument1,argument2,argument3);
}

#define __lnc__f965
/// __lnc__f965()
if (live_enabled) {
	part_type_blend(argument0,argument1);
}

#define __lnc__f966
/// __lnc__f966()->Any
if (live_enabled) {
	return part_system_create();
} else return undefined;

#define __lnc__f967
/// __lnc__f967()
if (live_enabled) {
	part_system_destroy(argument0);
}

#define __lnc__f968
/// __lnc__f968()->Any
if (live_enabled) {
	return part_system_exists(argument0);
} else return undefined;

#define __lnc__f969
/// __lnc__f969()
if (live_enabled) {
	part_system_clear(argument0);
}

#define __lnc__f970
/// __lnc__f970()
if (live_enabled) {
	part_system_draw_order(argument0,argument1);
}

#define __lnc__f971
/// __lnc__f971()
if (live_enabled) {
	part_system_depth(argument0,argument1);
}

#define __lnc__f972
/// __lnc__f972()
if (live_enabled) {
	part_system_position(argument0,argument1,argument2);
}

#define __lnc__f973
/// __lnc__f973()
if (live_enabled) {
	part_system_automatic_update(argument0,argument1);
}

#define __lnc__f974
/// __lnc__f974()
if (live_enabled) {
	part_system_automatic_draw(argument0,argument1);
}

#define __lnc__f975
/// __lnc__f975()
if (live_enabled) {
	part_system_update(argument0);
}

#define __lnc__f976
/// __lnc__f976()
if (live_enabled) {
	part_system_drawit(argument0);
}

#define __lnc__f977
/// __lnc__f977()->Any
if (live_enabled) {
	return part_particles_create(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f978
/// __lnc__f978()->Any
if (live_enabled) {
	return part_particles_create_colour(argument0,argument1,argument2,argument3,argument4,argument5);
} else return undefined;

#define __lnc__f979
/// __lnc__f979()
if (live_enabled) {
	part_particles_clear(argument0);
}

#define __lnc__f980
/// __lnc__f980()
if (live_enabled) {
	part_particles_count(argument0);
}

#define __lnc__f981
/// __lnc__f981()->Any
if (live_enabled) {
	return part_emitter_create(argument0);
} else return undefined;

#define __lnc__f982
/// __lnc__f982()
if (live_enabled) {
	part_emitter_destroy(argument0,argument1);
}

#define __lnc__f983
/// __lnc__f983()
if (live_enabled) {
	part_emitter_destroy_all(argument0);
}

#define __lnc__f984
/// __lnc__f984()->Any
if (live_enabled) {
	return part_emitter_exists(argument0,argument1);
} else return undefined;

#define __lnc__f985
/// __lnc__f985()
if (live_enabled) {
	part_emitter_clear(argument0,argument1);
}

#define __lnc__f986
/// __lnc__f986()
if (live_enabled) {
	part_emitter_region(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f987
/// __lnc__f987()
if (live_enabled) {
	part_emitter_burst(argument0,argument1,argument2,argument3);
}

#define __lnc__f988
/// __lnc__f988()
if (live_enabled) {
	part_emitter_stream(argument0,argument1,argument2,argument3);
}

#define __lnc__f989
/// __lnc__f989()->Any
if (live_enabled) {
	return window_handle();
} else return undefined;

#define __lnc__f990
/// __lnc__f990()->Any
if (live_enabled) {
	return window_device();
} else return undefined;

#define __lnc__f991
/// __lnc__f991()
if (live_enabled) {
	d3d_start();
}

#define __lnc__f992
/// __lnc__f992()
if (live_enabled) {
	d3d_end();
}

#define __lnc__f993
/// __lnc__f993()
if (live_enabled) {
	d3d_set_hidden(argument0);
}

#define __lnc__f994
/// __lnc__f994()
if (live_enabled) {
	d3d_set_perspective(argument0);
}

#define __lnc__f995
/// __lnc__f995()
if (live_enabled) {
	d3d_set_depth(argument0);
}

#define __lnc__f996
/// __lnc__f996()
if (live_enabled) {
	d3d_primitive_begin(argument0);
}

#define __lnc__f997
/// __lnc__f997()
if (live_enabled) {
	d3d_vertex(argument0,argument1,argument2);
}

#define __lnc__f998
/// __lnc__f998()
if (live_enabled) {
	d3d_vertex_colour(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f999
/// __lnc__f999()
if (live_enabled) {
	d3d_primitive_end();
}

#define __lnc__f1000
/// __lnc__f1000()
if (live_enabled) {
	d3d_primitive_begin_texture(argument0,argument1);
}

#define __lnc__f1001
/// __lnc__f1001()
if (live_enabled) {
	d3d_vertex_texture(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1002
/// __lnc__f1002()
if (live_enabled) {
	d3d_vertex_texture_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f1003
/// __lnc__f1003()
if (live_enabled) {
	d3d_draw_block(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1004
/// __lnc__f1004()
if (live_enabled) {
	d3d_draw_cylinder(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1005
/// __lnc__f1005()
if (live_enabled) {
	d3d_draw_cone(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1006
/// __lnc__f1006()
if (live_enabled) {
	d3d_draw_ellipsoid(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f1007
/// __lnc__f1007()
if (live_enabled) {
	d3d_draw_wall(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1008
/// __lnc__f1008()
if (live_enabled) {
	d3d_draw_floor(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1009
/// __lnc__f1009()
if (live_enabled) {
	d3d_set_projection(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1010
/// __lnc__f1010()
if (live_enabled) {
	d3d_set_projection_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12);
}

#define __lnc__f1011
/// __lnc__f1011()
if (live_enabled) {
	d3d_set_projection_ortho(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1012
/// __lnc__f1012()
if (live_enabled) {
	d3d_set_projection_perspective(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1013
/// __lnc__f1013()
if (live_enabled) {
	d3d_transform_set_identity();
}

#define __lnc__f1014
/// __lnc__f1014()
if (live_enabled) {
	d3d_transform_set_translation(argument0,argument1,argument2);
}

#define __lnc__f1015
/// __lnc__f1015()
if (live_enabled) {
	d3d_transform_set_scaling(argument0,argument1,argument2);
}

#define __lnc__f1016
/// __lnc__f1016()
if (live_enabled) {
	d3d_transform_set_rotation_x(argument0);
}

#define __lnc__f1017
/// __lnc__f1017()
if (live_enabled) {
	d3d_transform_set_rotation_y(argument0);
}

#define __lnc__f1018
/// __lnc__f1018()
if (live_enabled) {
	d3d_transform_set_rotation_z(argument0);
}

#define __lnc__f1019
/// __lnc__f1019()
if (live_enabled) {
	d3d_transform_set_rotation_axis(argument0,argument1,argument2,argument3);
}

#define __lnc__f1020
/// __lnc__f1020()
if (live_enabled) {
	d3d_transform_add_translation(argument0,argument1,argument2);
}

#define __lnc__f1021
/// __lnc__f1021()
if (live_enabled) {
	d3d_transform_add_scaling(argument0,argument1,argument2);
}

#define __lnc__f1022
/// __lnc__f1022()
if (live_enabled) {
	d3d_transform_add_rotation_x(argument0);
}

#define __lnc__f1023
/// __lnc__f1023()
if (live_enabled) {
	d3d_transform_add_rotation_y(argument0);
}

#define __lnc__f1024
/// __lnc__f1024()
if (live_enabled) {
	d3d_transform_add_rotation_z(argument0);
}

#define __lnc__f1025
/// __lnc__f1025()
if (live_enabled) {
	d3d_transform_add_rotation_axis(argument0,argument1,argument2,argument3);
}

#define __lnc__f1026
/// __lnc__f1026()
if (live_enabled) {
	d3d_transform_stack_clear();
}

#define __lnc__f1027
/// __lnc__f1027()
if (live_enabled) {
	d3d_transform_stack_empty();
}

#define __lnc__f1028
/// __lnc__f1028()
if (live_enabled) {
	d3d_transform_stack_push();
}

#define __lnc__f1029
/// __lnc__f1029()
if (live_enabled) {
	d3d_transform_stack_pop();
}

#define __lnc__f1030
/// __lnc__f1030()
if (live_enabled) {
	d3d_transform_stack_top();
}

#define __lnc__f1031
/// __lnc__f1031()
if (live_enabled) {
	d3d_transform_stack_discard();
}

#define __lnc__f1032
/// __lnc__f1032()
if (live_enabled) {
	d3d_transform_vertex(argument0,argument1,argument2);
}

#define __lnc__f1033
/// __lnc__f1033()
if (live_enabled) {
	d3d_set_fog(argument0,argument1,argument2,argument3);
}

#define __lnc__f1034
/// __lnc__f1034()
if (live_enabled) {
	d3d_set_lighting(argument0);
}

#define __lnc__f1035
/// __lnc__f1035()
if (live_enabled) {
	d3d_set_shading(argument0);
}

#define __lnc__f1036
/// __lnc__f1036()
if (live_enabled) {
	d3d_set_culling(argument0);
}

#define __lnc__f1037
/// __lnc__f1037()
if (live_enabled) {
	d3d_set_zwriteenable(argument0);
}

#define __lnc__f1038
/// __lnc__f1038()
if (live_enabled) {
	d3d_light_define_ambient(argument0);
}

#define __lnc__f1039
/// __lnc__f1039()
if (live_enabled) {
	d3d_light_define_direction(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1040
/// __lnc__f1040()
if (live_enabled) {
	d3d_light_define_point(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f1041
/// __lnc__f1041()
if (live_enabled) {
	d3d_light_enable(argument0,argument1);
}

#define __lnc__f1042
/// __lnc__f1042()
if (live_enabled) {
	d3d_vertex_normal(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f1043
/// __lnc__f1043()
if (live_enabled) {
	d3d_vertex_normal_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f1044
/// __lnc__f1044()
if (live_enabled) {
	d3d_vertex_normal_texture(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f1045
/// __lnc__f1045()
if (live_enabled) {
	d3d_vertex_normal_texture_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f1046
/// __lnc__f1046()->Any
if (live_enabled) {
	return d3d_model_create();
} else return undefined;

#define __lnc__f1047
/// __lnc__f1047()
if (live_enabled) {
	d3d_model_destroy(argument0);
}

#define __lnc__f1048
/// __lnc__f1048()
if (live_enabled) {
	d3d_model_clear(argument0);
}

#define __lnc__f1049
/// __lnc__f1049()
if (live_enabled) {
	d3d_model_save(argument0,argument1);
}

#define __lnc__f1050
/// __lnc__f1050()->Any
if (live_enabled) {
	return d3d_model_load(argument0,argument1);
} else return undefined;

#define __lnc__f1051
/// __lnc__f1051()
if (live_enabled) {
	d3d_model_save_buffer(argument0,argument1);
}

#define __lnc__f1052
/// __lnc__f1052()->Any
if (live_enabled) {
	return d3d_model_load_buffer(argument0,argument1);
} else return undefined;

#define __lnc__f1053
/// __lnc__f1053()
if (live_enabled) {
	d3d_model_draw(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1054
/// __lnc__f1054()
if (live_enabled) {
	d3d_model_primitive_begin(argument0,argument1);
}

#define __lnc__f1055
/// __lnc__f1055()
if (live_enabled) {
	d3d_model_vertex(argument0,argument1,argument2,argument3);
}

#define __lnc__f1056
/// __lnc__f1056()
if (live_enabled) {
	d3d_model_vertex_colour(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f1057
/// __lnc__f1057()
if (live_enabled) {
	d3d_model_vertex_texture(argument0,argument1,argument2,argument3,argument4,argument5);
}

#define __lnc__f1058
/// __lnc__f1058()
if (live_enabled) {
	d3d_model_vertex_texture_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
}

#define __lnc__f1059
/// __lnc__f1059()
if (live_enabled) {
	d3d_model_vertex_normal(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

#define __lnc__f1060
/// __lnc__f1060()
if (live_enabled) {
	d3d_model_vertex_normal_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1061
/// __lnc__f1061()
if (live_enabled) {
	d3d_model_vertex_normal_texture(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1062
/// __lnc__f1062()
if (live_enabled) {
	d3d_model_vertex_normal_texture_colour(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1063
/// __lnc__f1063()
if (live_enabled) {
	d3d_model_primitive_end(argument0);
}

#define __lnc__f1064
/// __lnc__f1064()
if (live_enabled) {
	d3d_model_block(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1065
/// __lnc__f1065()
if (live_enabled) {
	d3d_model_cylinder(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1066
/// __lnc__f1066()
if (live_enabled) {
	d3d_model_cone(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1067
/// __lnc__f1067()
if (live_enabled) {
	d3d_model_ellipsoid(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
}

#define __lnc__f1068
/// __lnc__f1068()
if (live_enabled) {
	d3d_model_wall(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1069
/// __lnc__f1069()
if (live_enabled) {
	d3d_model_floor(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1070
/// __lnc__f1070()->Any
if (live_enabled) {
	return matrix_get(argument0);
} else return undefined;

#define __lnc__f1071
/// __lnc__f1071()
if (live_enabled) {
	matrix_set(argument0,argument1);
}

#define __lnc__f1072
/// __lnc__f1072()->Any
if (live_enabled) {
	return matrix_build(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
} else return undefined;

#define __lnc__f1073
/// __lnc__f1073()->Any
if (live_enabled) {
	return matrix_multiply(argument0,argument1);
} else return undefined;

#define __lnc__f1074
/// __lnc__f1074()->Any
if (live_enabled) {
	return os_get_config();
} else return undefined;

#define __lnc__f1075
/// __lnc__f1075()->Any
if (live_enabled) {
	return os_get_info();
} else return undefined;

#define __lnc__f1076
/// __lnc__f1076()->Any
if (live_enabled) {
	return os_get_language();
} else return undefined;

#define __lnc__f1077
/// __lnc__f1077()->Any
if (live_enabled) {
	return os_get_region();
} else return undefined;

#define __lnc__f1078
/// __lnc__f1078()
if (live_enabled) {
	os_lock_orientation(argument0);
}

#define __lnc__f1079
/// __lnc__f1079()
if (live_enabled) {
	os_check_permission(argument0);
}

#define __lnc__f1080
/// __lnc__f1080()
if (live_enabled) {
	os_request_permission(argument0);
}

#define __lnc__f1081
/// __lnc__f1081()->Any
if (live_enabled) {
	return display_get_dpi_x();
} else return undefined;

#define __lnc__f1082
/// __lnc__f1082()->Any
if (live_enabled) {
	return display_get_dpi_y();
} else return undefined;

#define __lnc__f1083
/// __lnc__f1083()
if (live_enabled) {
	display_set_gui_size(argument0,argument1);
}

#define __lnc__f1084
/// __lnc__f1084()
if (live_enabled) {
	display_set_gui_maximise(argument0,argument1,argument2,argument3);
}

#define __lnc__f1085
/// __lnc__f1085()
if (live_enabled) {
	device_mouse_dbclick_enable(argument0);
}

#define __lnc__f1086
/// __lnc__f1086()
if (live_enabled) {
	virtual_key_add(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1087
/// __lnc__f1087()
if (live_enabled) {
	virtual_key_hide(argument0);
}

#define __lnc__f1088
/// __lnc__f1088()
if (live_enabled) {
	virtual_key_delete(argument0);
}

#define __lnc__f1089
/// __lnc__f1089()
if (live_enabled) {
	virtual_key_show(argument0);
}

#define __lnc__f1090
/// __lnc__f1090()
if (live_enabled) {
	draw_enable_alphablend(argument0);
}

#define __lnc__f1091
/// __lnc__f1091()
if (live_enabled) {
	draw_enable_drawevent(argument0);
}

#define __lnc__f1092
/// __lnc__f1092()
if (live_enabled) {
	draw_enable_swf_aa(argument0);
}

#define __lnc__f1093
/// __lnc__f1093()
if (live_enabled) {
	draw_set_swf_aa_level(argument0);
}

#define __lnc__f1094
/// __lnc__f1094()->Any
if (live_enabled) {
	return draw_get_swf_aa_level();
} else return undefined;

#define __lnc__f1095
/// __lnc__f1095()
if (live_enabled) {
	draw_texture_flush();
}

#define __lnc__f1096
/// __lnc__f1096()
if (live_enabled) {
	draw_flush();
}

#define __lnc__f1097
/// __lnc__f1097()
if (live_enabled) {
	shop_leave_rating(argument0,argument1,argument2,argument3);
}

#define __lnc__f1098
/// __lnc__f1098()->Any
if (live_enabled) {
	return url_get_domain();
} else return undefined;

#define __lnc__f1099
/// __lnc__f1099()
if (live_enabled) {
	url_open(argument0);
}

#define __lnc__f1100
/// __lnc__f1100()
if (live_enabled) {
	url_open_ext(argument0,argument1);
}

#define __lnc__f1101
/// __lnc__f1101()
if (live_enabled) {
	url_open_full(argument0,argument1,argument2);
}

#define __lnc__f1102
/// __lnc__f1102()->Any
if (live_enabled) {
	return get_timer();
} else return undefined;

#define __lnc__f1103
/// __lnc__f1103()->Any
if (live_enabled) {
	return device_get_tilt_x();
} else return undefined;

#define __lnc__f1104
/// __lnc__f1104()->Any
if (live_enabled) {
	return device_get_tilt_y();
} else return undefined;

#define __lnc__f1105
/// __lnc__f1105()->Any
if (live_enabled) {
	return device_get_tilt_z();
} else return undefined;

#define __lnc__f1106
/// __lnc__f1106()->Any
if (live_enabled) {
	return device_is_keypad_open();
} else return undefined;

#define __lnc__f1107
/// __lnc__f1107()->Any
if (live_enabled) {
	return device_mouse_check_button(argument0,argument1);
} else return undefined;

#define __lnc__f1108
/// __lnc__f1108()->Any
if (live_enabled) {
	return device_mouse_check_button_pressed(argument0,argument1);
} else return undefined;

#define __lnc__f1109
/// __lnc__f1109()->Any
if (live_enabled) {
	return device_mouse_check_button_released(argument0,argument1);
} else return undefined;

#define __lnc__f1110
/// __lnc__f1110()->Any
if (live_enabled) {
	return device_mouse_x(argument0);
} else return undefined;

#define __lnc__f1111
/// __lnc__f1111()->Any
if (live_enabled) {
	return device_mouse_y(argument0);
} else return undefined;

#define __lnc__f1112
/// __lnc__f1112()->Any
if (live_enabled) {
	return device_mouse_raw_x(argument0);
} else return undefined;

#define __lnc__f1113
/// __lnc__f1113()->Any
if (live_enabled) {
	return device_mouse_raw_y(argument0);
} else return undefined;

#define __lnc__f1114
/// __lnc__f1114()->Any
if (live_enabled) {
	return device_mouse_x_to_gui(argument0);
} else return undefined;

#define __lnc__f1115
/// __lnc__f1115()->Any
if (live_enabled) {
	return device_mouse_y_to_gui(argument0);
} else return undefined;

#define __lnc__f1116
/// __lnc__f1116()->Any
if (live_enabled) {
	return gamepad_is_supported();
} else return undefined;

#define __lnc__f1117
/// __lnc__f1117()->Any
if (live_enabled) {
	return gamepad_get_device_count();
} else return undefined;

#define __lnc__f1118
/// __lnc__f1118()->Any
if (live_enabled) {
	return gamepad_is_connected(argument0);
} else return undefined;

#define __lnc__f1119
/// __lnc__f1119()->Any
if (live_enabled) {
	return gamepad_get_description(argument0);
} else return undefined;

#define __lnc__f1120
/// __lnc__f1120()->Any
if (live_enabled) {
	return gamepad_get_button_threshold(argument0);
} else return undefined;

#define __lnc__f1121
/// __lnc__f1121()
if (live_enabled) {
	gamepad_set_button_threshold(argument0,argument1);
}

#define __lnc__f1122
/// __lnc__f1122()->Any
if (live_enabled) {
	return gamepad_get_axis_deadzone(argument0);
} else return undefined;

#define __lnc__f1123
/// __lnc__f1123()
if (live_enabled) {
	gamepad_set_axis_deadzone(argument0,argument1);
}

#define __lnc__f1124
/// __lnc__f1124()->Any
if (live_enabled) {
	return gamepad_button_count(argument0);
} else return undefined;

#define __lnc__f1125
/// __lnc__f1125()->Any
if (live_enabled) {
	return gamepad_button_check(argument0,argument1);
} else return undefined;

#define __lnc__f1126
/// __lnc__f1126()->Any
if (live_enabled) {
	return gamepad_button_check_pressed(argument0,argument1);
} else return undefined;

#define __lnc__f1127
/// __lnc__f1127()->Any
if (live_enabled) {
	return gamepad_button_check_released(argument0,argument1);
} else return undefined;

#define __lnc__f1128
/// __lnc__f1128()->Any
if (live_enabled) {
	return gamepad_button_value(argument0,argument1);
} else return undefined;

#define __lnc__f1129
/// __lnc__f1129()->Any
if (live_enabled) {
	return gamepad_axis_count(argument0);
} else return undefined;

#define __lnc__f1130
/// __lnc__f1130()->Any
if (live_enabled) {
	return gamepad_axis_value(argument0,argument1);
} else return undefined;

#define __lnc__f1131
/// __lnc__f1131()
if (live_enabled) {
	gamepad_set_vibration(argument0,argument1,argument2);
}

#define __lnc__f1132
/// __lnc__f1132()
if (live_enabled) {
	gamepad_set_color(argument0,argument1);
}

#define __lnc__f1133
/// __lnc__f1133()
if (live_enabled) {
	gamepad_set_colour(argument0,argument1);
}

#define __lnc__f1134
/// __lnc__f1134()->Any
if (live_enabled) {
	return os_is_paused();
} else return undefined;

#define __lnc__f1135
/// __lnc__f1135()->Any
if (live_enabled) {
	return window_has_focus();
} else return undefined;

#define __lnc__f1136
/// __lnc__f1136()->Any
if (live_enabled) {
	return code_is_compiled();
} else return undefined;

#define __lnc__f1137
/// __lnc__f1137()->Any
if (live_enabled) {
	return http_get(argument0);
} else return undefined;

#define __lnc__f1138
/// __lnc__f1138()->Any
if (live_enabled) {
	return http_get_file(argument0,argument1);
} else return undefined;

#define __lnc__f1139
/// __lnc__f1139()->Any
if (live_enabled) {
	return http_post_string(argument0,argument1);
} else return undefined;

#define __lnc__f1140
/// __lnc__f1140()->Any
if (live_enabled) {
	return http_request(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1141
/// __lnc__f1141()->Any
if (live_enabled) {
	return json_encode(argument0);
} else return undefined;

#define __lnc__f1142
/// __lnc__f1142()->Any
if (live_enabled) {
	return json_decode(argument0);
} else return undefined;

#define __lnc__f1143
/// __lnc__f1143()
if (live_enabled) {
	zip_unzip(argument0,argument1);
}

#define __lnc__f1144
/// __lnc__f1144()->Any
if (live_enabled) {
	return base64_encode(argument0);
} else return undefined;

#define __lnc__f1145
/// __lnc__f1145()->Any
if (live_enabled) {
	return base64_decode(argument0);
} else return undefined;

#define __lnc__f1146
/// __lnc__f1146()->Any
if (live_enabled) {
	return md5_string_unicode(argument0);
} else return undefined;

#define __lnc__f1147
/// __lnc__f1147()->Any
if (live_enabled) {
	return md5_string_utf8(argument0);
} else return undefined;

#define __lnc__f1148
/// __lnc__f1148()->Any
if (live_enabled) {
	return md5_file(argument0);
} else return undefined;

#define __lnc__f1149
/// __lnc__f1149()->Any
if (live_enabled) {
	return os_is_network_connected();
} else return undefined;

#define __lnc__f1150
/// __lnc__f1150()->Any
if (live_enabled) {
	return sha1_string_unicode(argument0);
} else return undefined;

#define __lnc__f1151
/// __lnc__f1151()->Any
if (live_enabled) {
	return sha1_string_utf8(argument0);
} else return undefined;

#define __lnc__f1152
/// __lnc__f1152()->Any
if (live_enabled) {
	return sha1_file(argument0);
} else return undefined;

#define __lnc__f1153
/// __lnc__f1153()
if (live_enabled) {
	os_powersave_enable(argument0);
}

#define __lnc__f1154
/// __lnc__f1154()->Any
if (live_enabled) {
	return physics_world_create(argument0);
} else return undefined;

#define __lnc__f1155
/// __lnc__f1155()
if (live_enabled) {
	physics_world_gravity(argument0,argument1);
}

#define __lnc__f1156
/// __lnc__f1156()
if (live_enabled) {
	physics_world_update_speed(argument0);
}

#define __lnc__f1157
/// __lnc__f1157()
if (live_enabled) {
	physics_world_update_iterations(argument0);
}

#define __lnc__f1158
/// __lnc__f1158()
if (live_enabled) {
	physics_world_draw_debug(argument0);
}

#define __lnc__f1159
/// __lnc__f1159()
if (live_enabled) {
	physics_pause_enable(argument0);
}

#define __lnc__f1160
/// __lnc__f1160()->Any
if (live_enabled) {
	return physics_fixture_create();
} else return undefined;

#define __lnc__f1161
/// __lnc__f1161()
if (live_enabled) {
	physics_fixture_set_kinematic(argument0);
}

#define __lnc__f1162
/// __lnc__f1162()
if (live_enabled) {
	physics_fixture_set_density(argument0,argument1);
}

#define __lnc__f1163
/// __lnc__f1163()
if (live_enabled) {
	physics_fixture_set_awake(argument0,argument1);
}

#define __lnc__f1164
/// __lnc__f1164()
if (live_enabled) {
	physics_fixture_set_restitution(argument0,argument1);
}

#define __lnc__f1165
/// __lnc__f1165()
if (live_enabled) {
	physics_fixture_set_friction(argument0,argument1);
}

#define __lnc__f1166
/// __lnc__f1166()
if (live_enabled) {
	physics_fixture_set_collision_group(argument0,argument1);
}

#define __lnc__f1167
/// __lnc__f1167()
if (live_enabled) {
	physics_fixture_set_sensor(argument0,argument1);
}

#define __lnc__f1168
/// __lnc__f1168()
if (live_enabled) {
	physics_fixture_set_linear_damping(argument0,argument1);
}

#define __lnc__f1169
/// __lnc__f1169()
if (live_enabled) {
	physics_fixture_set_angular_damping(argument0,argument1);
}

#define __lnc__f1170
/// __lnc__f1170()
if (live_enabled) {
	physics_fixture_set_circle_shape(argument0,argument1);
}

#define __lnc__f1171
/// __lnc__f1171()
if (live_enabled) {
	physics_fixture_set_box_shape(argument0,argument1,argument2);
}

#define __lnc__f1172
/// __lnc__f1172()
if (live_enabled) {
	physics_fixture_set_edge_shape(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1173
/// __lnc__f1173()
if (live_enabled) {
	physics_fixture_set_polygon_shape(argument0);
}

#define __lnc__f1174
/// __lnc__f1174()
if (live_enabled) {
	physics_fixture_set_chain_shape(argument0,argument1);
}

#define __lnc__f1175
/// __lnc__f1175()
if (live_enabled) {
	physics_fixture_add_point(argument0,argument1,argument2);
}

#define __lnc__f1176
/// __lnc__f1176()
if (live_enabled) {
	physics_fixture_bind(argument0,argument1);
}

#define __lnc__f1177
/// __lnc__f1177()
if (live_enabled) {
	physics_fixture_bind_ext(argument0,argument1,argument2,argument3);
}

#define __lnc__f1178
/// __lnc__f1178()
if (live_enabled) {
	physics_fixture_delete(argument0);
}

#define __lnc__f1179
/// __lnc__f1179()
if (live_enabled) {
	physics_apply_force(argument0,argument1,argument2,argument3);
}

#define __lnc__f1180
/// __lnc__f1180()
if (live_enabled) {
	physics_apply_impulse(argument0,argument1,argument2,argument3);
}

#define __lnc__f1181
/// __lnc__f1181()
if (live_enabled) {
	physics_apply_angular_impulse(argument0);
}

#define __lnc__f1182
/// __lnc__f1182()
if (live_enabled) {
	physics_apply_local_force(argument0,argument1,argument2,argument3);
}

#define __lnc__f1183
/// __lnc__f1183()
if (live_enabled) {
	physics_apply_local_impulse(argument0,argument1,argument2,argument3);
}

#define __lnc__f1184
/// __lnc__f1184()
if (live_enabled) {
	physics_apply_torque(argument0);
}

#define __lnc__f1185
/// __lnc__f1185()
if (live_enabled) {
	physics_mass_properties(argument0,argument1,argument2,argument3);
}

#define __lnc__f1186
/// __lnc__f1186()
if (live_enabled) {
	physics_draw_debug();
}

#define __lnc__f1187
/// __lnc__f1187()
if (live_enabled) {
	physics_test_overlap(argument0,argument1,argument2,argument3);
}

#define __lnc__f1188
/// __lnc__f1188()
if (live_enabled) {
	physics_remove_fixture(argument0,argument1);
}

#define __lnc__f1189
/// __lnc__f1189()
if (live_enabled) {
	physics_set_friction(argument0,argument1);
}

#define __lnc__f1190
/// __lnc__f1190()
if (live_enabled) {
	physics_set_density(argument0,argument1);
}

#define __lnc__f1191
/// __lnc__f1191()
if (live_enabled) {
	physics_set_restitution(argument0,argument1);
}

#define __lnc__f1192
/// __lnc__f1192()->Any
if (live_enabled) {
	return physics_get_friction(argument0);
} else return undefined;

#define __lnc__f1193
/// __lnc__f1193()->Any
if (live_enabled) {
	return physics_get_density(argument0);
} else return undefined;

#define __lnc__f1194
/// __lnc__f1194()->Any
if (live_enabled) {
	return physics_get_restitution(argument0);
} else return undefined;

#define __lnc__f1195
/// __lnc__f1195()->Any
if (live_enabled) {
	return physics_joint_distance_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f1196
/// __lnc__f1196()->Any
if (live_enabled) {
	return physics_joint_rope_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1197
/// __lnc__f1197()->Any
if (live_enabled) {
	return physics_joint_revolute_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
} else return undefined;

#define __lnc__f1198
/// __lnc__f1198()->Any
if (live_enabled) {
	return physics_joint_prismatic_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12);
} else return undefined;

#define __lnc__f1199
/// __lnc__f1199()->Any
if (live_enabled) {
	return physics_joint_pulley_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
} else return undefined;

#define __lnc__f1200
/// __lnc__f1200()->Any
if (live_enabled) {
	return physics_joint_wheel_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
} else return undefined;

#define __lnc__f1201
/// __lnc__f1201()->Any
if (live_enabled) {
	return physics_joint_weld_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1202
/// __lnc__f1202()->Any
if (live_enabled) {
	return physics_joint_friction_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f1203
/// __lnc__f1203()->Any
if (live_enabled) {
	return physics_joint_gear_create(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1204
/// __lnc__f1204()
if (live_enabled) {
	physics_joint_enable_motor(argument0,argument1);
}

#define __lnc__f1205
/// __lnc__f1205()->Any
if (live_enabled) {
	return physics_joint_get_value(argument0,argument1);
} else return undefined;

#define __lnc__f1206
/// __lnc__f1206()
if (live_enabled) {
	physics_joint_set_value(argument0,argument1,argument2);
}

#define __lnc__f1207
/// __lnc__f1207()
if (live_enabled) {
	physics_joint_delete(argument0);
}

#define __lnc__f1208
/// __lnc__f1208()->Any
if (live_enabled) {
	return physics_particle_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1209
/// __lnc__f1209()
if (live_enabled) {
	physics_particle_delete(argument0);
}

#define __lnc__f1210
/// __lnc__f1210()
if (live_enabled) {
	physics_particle_delete_region_circle(argument0,argument1,argument2);
}

#define __lnc__f1211
/// __lnc__f1211()
if (live_enabled) {
	physics_particle_delete_region_box(argument0,argument1,argument2,argument3);
}

#define __lnc__f1212
/// __lnc__f1212()
if (live_enabled) {
	physics_particle_delete_region_poly(argument0);
}

#define __lnc__f1213
/// __lnc__f1213()
if (live_enabled) {
	physics_particle_set_flags(argument0,argument1);
}

#define __lnc__f1214
/// __lnc__f1214()
if (live_enabled) {
	physics_particle_set_category_flags(argument0,argument1);
}

#define __lnc__f1215
/// __lnc__f1215()
if (live_enabled) {
	physics_particle_draw(argument0,argument1,argument2,argument3);
}

#define __lnc__f1216
/// __lnc__f1216()
if (live_enabled) {
	physics_particle_draw_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1217
/// __lnc__f1217()
if (live_enabled) {
	physics_particle_count();
}

#define __lnc__f1218
/// __lnc__f1218()->Any
if (live_enabled) {
	return physics_particle_get_data(argument0,argument1);
} else return undefined;

#define __lnc__f1219
/// __lnc__f1219()->Any
if (live_enabled) {
	return physics_particle_get_data_particle(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1220
/// __lnc__f1220()
if (live_enabled) {
	physics_particle_group_begin(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11);
}

#define __lnc__f1221
/// __lnc__f1221()
if (live_enabled) {
	physics_particle_group_circle(argument0);
}

#define __lnc__f1222
/// __lnc__f1222()
if (live_enabled) {
	physics_particle_group_box(argument0,argument1);
}

#define __lnc__f1223
/// __lnc__f1223()
if (live_enabled) {
	physics_particle_group_polygon();
}

#define __lnc__f1224
/// __lnc__f1224()
if (live_enabled) {
	physics_particle_group_add_point(argument0,argument1);
}

#define __lnc__f1225
/// __lnc__f1225()
if (live_enabled) {
	physics_particle_group_end();
}

#define __lnc__f1226
/// __lnc__f1226()
if (live_enabled) {
	physics_particle_group_join(argument0,argument1);
}

#define __lnc__f1227
/// __lnc__f1227()
if (live_enabled) {
	physics_particle_group_delete(argument0);
}

#define __lnc__f1228
/// __lnc__f1228()
if (live_enabled) {
	physics_particle_group_count(argument0);
}

#define __lnc__f1229
/// __lnc__f1229()->Any
if (live_enabled) {
	return physics_particle_group_get_data(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1230
/// __lnc__f1230()->Any
if (live_enabled) {
	return physics_particle_group_get_mass(argument0);
} else return undefined;

#define __lnc__f1231
/// __lnc__f1231()->Any
if (live_enabled) {
	return physics_particle_group_get_inertia(argument0);
} else return undefined;

#define __lnc__f1232
/// __lnc__f1232()->Any
if (live_enabled) {
	return physics_particle_group_get_centre_x(argument0);
} else return undefined;

#define __lnc__f1233
/// __lnc__f1233()->Any
if (live_enabled) {
	return physics_particle_group_get_centre_y(argument0);
} else return undefined;

#define __lnc__f1234
/// __lnc__f1234()->Any
if (live_enabled) {
	return physics_particle_group_get_vel_x(argument0);
} else return undefined;

#define __lnc__f1235
/// __lnc__f1235()->Any
if (live_enabled) {
	return physics_particle_group_get_vel_y(argument0);
} else return undefined;

#define __lnc__f1236
/// __lnc__f1236()->Any
if (live_enabled) {
	return physics_particle_group_get_ang_vel(argument0);
} else return undefined;

#define __lnc__f1237
/// __lnc__f1237()->Any
if (live_enabled) {
	return physics_particle_group_get_x(argument0);
} else return undefined;

#define __lnc__f1238
/// __lnc__f1238()->Any
if (live_enabled) {
	return physics_particle_group_get_y(argument0);
} else return undefined;

#define __lnc__f1239
/// __lnc__f1239()->Any
if (live_enabled) {
	return physics_particle_group_get_angle(argument0);
} else return undefined;

#define __lnc__f1240
/// __lnc__f1240()
if (live_enabled) {
	physics_particle_set_group_flags(argument0,argument1);
}

#define __lnc__f1241
/// __lnc__f1241()->Any
if (live_enabled) {
	return physics_particle_get_group_flags(argument0);
} else return undefined;

#define __lnc__f1242
/// __lnc__f1242()->Any
if (live_enabled) {
	return physics_particle_get_max_count();
} else return undefined;

#define __lnc__f1243
/// __lnc__f1243()->Any
if (live_enabled) {
	return physics_particle_get_radius();
} else return undefined;

#define __lnc__f1244
/// __lnc__f1244()->Any
if (live_enabled) {
	return physics_particle_get_density();
} else return undefined;

#define __lnc__f1245
/// __lnc__f1245()->Any
if (live_enabled) {
	return physics_particle_get_damping();
} else return undefined;

#define __lnc__f1246
/// __lnc__f1246()->Any
if (live_enabled) {
	return physics_particle_get_gravity_scale();
} else return undefined;

#define __lnc__f1247
/// __lnc__f1247()
if (live_enabled) {
	physics_particle_set_max_count(argument0);
}

#define __lnc__f1248
/// __lnc__f1248()
if (live_enabled) {
	physics_particle_set_radius(argument0);
}

#define __lnc__f1249
/// __lnc__f1249()
if (live_enabled) {
	physics_particle_set_density(argument0);
}

#define __lnc__f1250
/// __lnc__f1250()
if (live_enabled) {
	physics_particle_set_damping(argument0);
}

#define __lnc__f1251
/// __lnc__f1251()
if (live_enabled) {
	physics_particle_set_gravity_scale(argument0);
}

#define __lnc__f1252
/// __lnc__f1252()->Any
if (live_enabled) {
	return network_create_socket(argument0);
} else return undefined;

#define __lnc__f1253
/// __lnc__f1253()->Any
if (live_enabled) {
	return network_create_socket_ext(argument0,argument1);
} else return undefined;

#define __lnc__f1254
/// __lnc__f1254()->Any
if (live_enabled) {
	return network_create_server(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1255
/// __lnc__f1255()->Any
if (live_enabled) {
	return network_create_server_raw(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1256
/// __lnc__f1256()
if (live_enabled) {
	network_connect(argument0,argument1,argument2);
}

#define __lnc__f1257
/// __lnc__f1257()
if (live_enabled) {
	network_connect_raw(argument0,argument1,argument2);
}

#define __lnc__f1258
/// __lnc__f1258()
if (live_enabled) {
	network_send_packet(argument0,argument1,argument2);
}

#define __lnc__f1259
/// __lnc__f1259()
if (live_enabled) {
	network_send_raw(argument0,argument1,argument2);
}

#define __lnc__f1260
/// __lnc__f1260()
if (live_enabled) {
	network_send_broadcast(argument0,argument1,argument2,argument3);
}

#define __lnc__f1261
/// __lnc__f1261()
if (live_enabled) {
	network_send_udp(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1262
/// __lnc__f1262()
if (live_enabled) {
	network_send_udp_raw(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1263
/// __lnc__f1263()
if (live_enabled) {
	network_set_timeout(argument0,argument1,argument2);
}

#define __lnc__f1264
/// __lnc__f1264()
if (live_enabled) {
	network_set_config(argument0,argument1);
}

#define __lnc__f1265
/// __lnc__f1265()
if (live_enabled) {
	network_resolve(argument0);
}

#define __lnc__f1266
/// __lnc__f1266()
if (live_enabled) {
	network_destroy(argument0);
}

#define __lnc__f1267
/// __lnc__f1267()->Any
if (live_enabled) {
	return buffer_create(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1268
/// __lnc__f1268()
if (live_enabled) {
	buffer_write(argument0,argument1,argument2);
}

#define __lnc__f1269
/// __lnc__f1269()->Any
if (live_enabled) {
	return buffer_read(argument0,argument1);
} else return undefined;

#define __lnc__f1270
/// __lnc__f1270()
if (live_enabled) {
	buffer_seek(argument0,argument1,argument2);
}

#define __lnc__f1271
/// __lnc__f1271()->Any
if (live_enabled) {
	return buffer_get_surface(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1272
/// __lnc__f1272()
if (live_enabled) {
	buffer_set_surface(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1273
/// __lnc__f1273()
if (live_enabled) {
	buffer_delete(argument0);
}

#define __lnc__f1274
/// __lnc__f1274()->Any
if (live_enabled) {
	return buffer_exists(argument0);
} else return undefined;

#define __lnc__f1275
/// __lnc__f1275()->Any
if (live_enabled) {
	return buffer_get_type(argument0);
} else return undefined;

#define __lnc__f1276
/// __lnc__f1276()->Any
if (live_enabled) {
	return buffer_get_alignment(argument0);
} else return undefined;

#define __lnc__f1277
/// __lnc__f1277()
if (live_enabled) {
	buffer_poke(argument0,argument1,argument2,argument3);
}

#define __lnc__f1278
/// __lnc__f1278()->Any
if (live_enabled) {
	return buffer_peek(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1279
/// __lnc__f1279()
if (live_enabled) {
	buffer_save(argument0,argument1);
}

#define __lnc__f1280
/// __lnc__f1280()
if (live_enabled) {
	buffer_save_ext(argument0,argument1,argument2,argument3);
}

#define __lnc__f1281
/// __lnc__f1281()->Any
if (live_enabled) {
	return buffer_load(argument0);
} else return undefined;

#define __lnc__f1282
/// __lnc__f1282()->Any
if (live_enabled) {
	return buffer_load_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1283
/// __lnc__f1283()->Any
if (live_enabled) {
	return buffer_load_partial(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1284
/// __lnc__f1284()
if (live_enabled) {
	buffer_copy(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1285
/// __lnc__f1285()
if (live_enabled) {
	buffer_fill(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1286
/// __lnc__f1286()->Any
if (live_enabled) {
	return buffer_get_size(argument0);
} else return undefined;

#define __lnc__f1287
/// __lnc__f1287()->Any
if (live_enabled) {
	return buffer_tell(argument0);
} else return undefined;

#define __lnc__f1288
/// __lnc__f1288()
if (live_enabled) {
	buffer_resize(argument0,argument1);
}

#define __lnc__f1289
/// __lnc__f1289()->Any
if (live_enabled) {
	return buffer_md5(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1290
/// __lnc__f1290()->Any
if (live_enabled) {
	return buffer_sha1(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1291
/// __lnc__f1291()->Any
if (live_enabled) {
	return buffer_base64_encode(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1292
/// __lnc__f1292()->Any
if (live_enabled) {
	return buffer_base64_decode(argument0);
} else return undefined;

#define __lnc__f1293
/// __lnc__f1293()->Any
if (live_enabled) {
	return buffer_base64_decode_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1294
/// __lnc__f1294()->Any
if (live_enabled) {
	return buffer_sizeof(argument0);
} else return undefined;

#define __lnc__f1295
/// __lnc__f1295()->Any
if (live_enabled) {
	return buffer_get_address(argument0);
} else return undefined;

#define __lnc__f1296
/// __lnc__f1296()->Any
if (live_enabled) {
	return buffer_create_from_vertex_buffer(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1297
/// __lnc__f1297()->Any
if (live_enabled) {
	return buffer_create_from_vertex_buffer_ext(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1298
/// __lnc__f1298()
if (live_enabled) {
	buffer_copy_from_vertex_buffer(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1299
/// __lnc__f1299()
if (live_enabled) {
	buffer_async_group_begin(argument0);
}

#define __lnc__f1300
/// __lnc__f1300()
if (live_enabled) {
	buffer_async_group_option(argument0,argument1);
}

#define __lnc__f1301
/// __lnc__f1301()
if (live_enabled) {
	buffer_async_group_end();
}

#define __lnc__f1302
/// __lnc__f1302()->Any
if (live_enabled) {
	return buffer_load_async(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1303
/// __lnc__f1303()
if (live_enabled) {
	buffer_save_async(argument0,argument1,argument2,argument3);
}

#define __lnc__f1304
/// __lnc__f1304()
if (live_enabled) {
	gml_release_mode(argument0);
}

#define __lnc__f1305
/// __lnc__f1305()
if (live_enabled) {
	steam_activate_overlay(argument0);
}

#define __lnc__f1306
/// __lnc__f1306()->Any
if (live_enabled) {
	return steam_is_overlay_enabled();
} else return undefined;

#define __lnc__f1307
/// __lnc__f1307()->Any
if (live_enabled) {
	return steam_is_overlay_activated();
} else return undefined;

#define __lnc__f1308
/// __lnc__f1308()->Any
if (live_enabled) {
	return steam_get_persona_name();
} else return undefined;

#define __lnc__f1309
/// __lnc__f1309()->Any
if (live_enabled) {
	return steam_initialised();
} else return undefined;

#define __lnc__f1310
/// __lnc__f1310()->Any
if (live_enabled) {
	return steam_is_cloud_enabled_for_app();
} else return undefined;

#define __lnc__f1311
/// __lnc__f1311()->Any
if (live_enabled) {
	return steam_is_cloud_enabled_for_account();
} else return undefined;

#define __lnc__f1312
/// __lnc__f1312()->Any
if (live_enabled) {
	return steam_file_persisted(argument0);
} else return undefined;

#define __lnc__f1313
/// __lnc__f1313()->Any
if (live_enabled) {
	return steam_get_quota_total();
} else return undefined;

#define __lnc__f1314
/// __lnc__f1314()->Any
if (live_enabled) {
	return steam_get_quota_free();
} else return undefined;

#define __lnc__f1315
/// __lnc__f1315()->Any
if (live_enabled) {
	return steam_file_write(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1316
/// __lnc__f1316()->Any
if (live_enabled) {
	return steam_file_write_file(argument0,argument1);
} else return undefined;

#define __lnc__f1317
/// __lnc__f1317()->Any
if (live_enabled) {
	return steam_file_read(argument0);
} else return undefined;

#define __lnc__f1318
/// __lnc__f1318()
if (live_enabled) {
	steam_file_delete(argument0);
}

#define __lnc__f1319
/// __lnc__f1319()->Any
if (live_enabled) {
	return steam_file_exists(argument0);
} else return undefined;

#define __lnc__f1320
/// __lnc__f1320()->Any
if (live_enabled) {
	return steam_file_size(argument0);
} else return undefined;

#define __lnc__f1321
/// __lnc__f1321()
if (live_enabled) {
	steam_file_share(argument0);
}

#define __lnc__f1322
/// __lnc__f1322()
if (live_enabled) {
	steam_publish_workshop_file(argument0,argument1,argument2,argument3);
}

#define __lnc__f1323
/// __lnc__f1323()->Any
if (live_enabled) {
	return steam_is_screenshot_requested();
} else return undefined;

#define __lnc__f1324
/// __lnc__f1324()
if (live_enabled) {
	steam_send_screenshot(argument0,argument1,argument2);
}

#define __lnc__f1325
/// __lnc__f1325()->Any
if (live_enabled) {
	return steam_is_user_logged_on();
} else return undefined;

#define __lnc__f1326
/// __lnc__f1326()->Any
if (live_enabled) {
	return steam_get_user_steam_id();
} else return undefined;

#define __lnc__f1327
/// __lnc__f1327()->Any
if (live_enabled) {
	return steam_user_owns_dlc(argument0);
} else return undefined;

#define __lnc__f1328
/// __lnc__f1328()->Any
if (live_enabled) {
	return steam_user_installed_dlc(argument0);
} else return undefined;

#define __lnc__f1329
/// __lnc__f1329()
if (live_enabled) {
	steam_set_achievement(argument0);
}

#define __lnc__f1330
/// __lnc__f1330()->Any
if (live_enabled) {
	return steam_get_achievement(argument0);
} else return undefined;

#define __lnc__f1331
/// __lnc__f1331()
if (live_enabled) {
	steam_clear_achievement(argument0);
}

#define __lnc__f1332
/// __lnc__f1332()
if (live_enabled) {
	steam_set_stat_int(argument0,argument1);
}

#define __lnc__f1333
/// __lnc__f1333()
if (live_enabled) {
	steam_set_stat_float(argument0,argument1);
}

#define __lnc__f1334
/// __lnc__f1334()
if (live_enabled) {
	steam_set_stat_avg_rate(argument0,argument1,argument2);
}

#define __lnc__f1335
/// __lnc__f1335()->Any
if (live_enabled) {
	return steam_get_stat_int(argument0);
} else return undefined;

#define __lnc__f1336
/// __lnc__f1336()->Any
if (live_enabled) {
	return steam_get_stat_float(argument0);
} else return undefined;

#define __lnc__f1337
/// __lnc__f1337()->Any
if (live_enabled) {
	return steam_get_stat_avg_rate(argument0);
} else return undefined;

#define __lnc__f1338
/// __lnc__f1338()
if (live_enabled) {
	steam_reset_all_stats();
}

#define __lnc__f1339
/// __lnc__f1339()
if (live_enabled) {
	steam_reset_all_stats_achievements();
}

#define __lnc__f1340
/// __lnc__f1340()->Any
if (live_enabled) {
	return steam_stats_ready();
} else return undefined;

#define __lnc__f1341
/// __lnc__f1341()->Any
if (live_enabled) {
	return steam_create_leaderboard(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1342
/// __lnc__f1342()->Any
if (live_enabled) {
	return steam_upload_score(argument0,argument1);
} else return undefined;

#define __lnc__f1343
/// __lnc__f1343()->Any
if (live_enabled) {
	return steam_upload_score_ext(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1344
/// __lnc__f1344()->Any
if (live_enabled) {
	return steam_download_scores_around_user(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1345
/// __lnc__f1345()->Any
if (live_enabled) {
	return steam_download_scores(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1346
/// __lnc__f1346()->Any
if (live_enabled) {
	return steam_download_friends_scores(argument0);
} else return undefined;

#define __lnc__f1347
/// __lnc__f1347()->Any
if (live_enabled) {
	return steam_upload_score_buffer(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1348
/// __lnc__f1348()->Any
if (live_enabled) {
	return steam_upload_score_buffer_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1349
/// __lnc__f1349()->Any
if (live_enabled) {
	return steam_current_game_language();
} else return undefined;

#define __lnc__f1350
/// __lnc__f1350()->Any
if (live_enabled) {
	return steam_available_languages();
} else return undefined;

#define __lnc__f1351
/// __lnc__f1351()
if (live_enabled) {
	steam_activate_overlay_browser(argument0);
}

#define __lnc__f1352
/// __lnc__f1352()
if (live_enabled) {
	steam_activate_overlay_user(argument0,argument1);
}

#define __lnc__f1353
/// __lnc__f1353()
if (live_enabled) {
	steam_activate_overlay_store(argument0);
}

#define __lnc__f1354
/// __lnc__f1354()->Any
if (live_enabled) {
	return steam_get_user_persona_name(argument0);
} else return undefined;

#define __lnc__f1355
/// __lnc__f1355()->Any
if (live_enabled) {
	return steam_get_app_id();
} else return undefined;

#define __lnc__f1356
/// __lnc__f1356()->Any
if (live_enabled) {
	return steam_get_user_account_id();
} else return undefined;

#define __lnc__f1357
/// __lnc__f1357()->Any
if (live_enabled) {
	return steam_ugc_download(argument0,argument1);
} else return undefined;

#define __lnc__f1358
/// __lnc__f1358()->Any
if (live_enabled) {
	return steam_ugc_create_item(argument0,argument1);
} else return undefined;

#define __lnc__f1359
/// __lnc__f1359()
if (live_enabled) {
	steam_ugc_start_item_update(argument0,argument1);
}

#define __lnc__f1360
/// __lnc__f1360()
if (live_enabled) {
	steam_ugc_set_item_title(argument0,argument1);
}

#define __lnc__f1361
/// __lnc__f1361()
if (live_enabled) {
	steam_ugc_set_item_description(argument0,argument1);
}

#define __lnc__f1362
/// __lnc__f1362()
if (live_enabled) {
	steam_ugc_set_item_visibility(argument0,argument1);
}

#define __lnc__f1363
/// __lnc__f1363()
if (live_enabled) {
	steam_ugc_set_item_tags(argument0,argument1);
}

#define __lnc__f1364
/// __lnc__f1364()
if (live_enabled) {
	steam_ugc_set_item_content(argument0,argument1);
}

#define __lnc__f1365
/// __lnc__f1365()
if (live_enabled) {
	steam_ugc_set_item_preview(argument0,argument1);
}

#define __lnc__f1366
/// __lnc__f1366()->Any
if (live_enabled) {
	return steam_ugc_submit_item_update(argument0,argument1);
} else return undefined;

#define __lnc__f1367
/// __lnc__f1367()->Any
if (live_enabled) {
	return steam_ugc_get_item_update_progress(argument0,argument1);
} else return undefined;

#define __lnc__f1368
/// __lnc__f1368()->Any
if (live_enabled) {
	return steam_ugc_subscribe_item(argument0);
} else return undefined;

#define __lnc__f1369
/// __lnc__f1369()->Any
if (live_enabled) {
	return steam_ugc_unsubscribe_item(argument0);
} else return undefined;

#define __lnc__f1370
/// __lnc__f1370()->Any
if (live_enabled) {
	return steam_ugc_num_subscribed_items();
} else return undefined;

#define __lnc__f1371
/// __lnc__f1371()->Any
if (live_enabled) {
	return steam_ugc_get_subscribed_items(argument0);
} else return undefined;

#define __lnc__f1372
/// __lnc__f1372()->Any
if (live_enabled) {
	return steam_ugc_get_item_install_info(argument0,argument1);
} else return undefined;

#define __lnc__f1373
/// __lnc__f1373()->Any
if (live_enabled) {
	return steam_ugc_get_item_update_info(argument0,argument1);
} else return undefined;

#define __lnc__f1374
/// __lnc__f1374()->Any
if (live_enabled) {
	return steam_ugc_request_item_details(argument0,argument1);
} else return undefined;

#define __lnc__f1375
/// __lnc__f1375()->Any
if (live_enabled) {
	return steam_ugc_create_query_user(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1376
/// __lnc__f1376()->Any
if (live_enabled) {
	return steam_ugc_create_query_user_ex(argument0,argument1,argument2,argument3,argument4,argument5,argument6);
} else return undefined;

#define __lnc__f1377
/// __lnc__f1377()->Any
if (live_enabled) {
	return steam_ugc_create_query_all(argument0,argument1,argument2);
} else return undefined;

#define __lnc__f1378
/// __lnc__f1378()->Any
if (live_enabled) {
	return steam_ugc_create_query_all_ex(argument0,argument1,argument2,argument3,argument4);
} else return undefined;

#define __lnc__f1379
/// __lnc__f1379()->Any
if (live_enabled) {
	return steam_ugc_query_set_cloud_filename_filter(argument0,argument1);
} else return undefined;

#define __lnc__f1380
/// __lnc__f1380()
if (live_enabled) {
	steam_ugc_query_set_match_any_tag(argument0,argument1);
}

#define __lnc__f1381
/// __lnc__f1381()
if (live_enabled) {
	steam_ugc_query_set_search_text(argument0,argument1);
}

#define __lnc__f1382
/// __lnc__f1382()
if (live_enabled) {
	steam_ugc_query_set_ranked_by_trend_days(argument0,argument1);
}

#define __lnc__f1383
/// __lnc__f1383()
if (live_enabled) {
	steam_ugc_query_add_required_tag(argument0,argument1);
}

#define __lnc__f1384
/// __lnc__f1384()
if (live_enabled) {
	steam_ugc_query_add_excluded_tag(argument0,argument1);
}

#define __lnc__f1385
/// __lnc__f1385()
if (live_enabled) {
	steam_ugc_query_set_return_long_description(argument0,argument1);
}

#define __lnc__f1386
/// __lnc__f1386()
if (live_enabled) {
	steam_ugc_query_set_return_total_only(argument0,argument1);
}

#define __lnc__f1387
/// __lnc__f1387()
if (live_enabled) {
	steam_ugc_query_set_allow_cached_response(argument0,argument1);
}

#define __lnc__f1388
/// __lnc__f1388()
if (live_enabled) {
	steam_ugc_send_query(argument0);
}

#define __lnc__f1389
/// __lnc__f1389()
if (live_enabled) {
	shader_set(argument0);
}

#define __lnc__f1390
/// __lnc__f1390()
if (live_enabled) {
	shader_reset();
}

#define __lnc__f1391
/// __lnc__f1391()->Any
if (live_enabled) {
	return shader_current();
} else return undefined;

#define __lnc__f1392
/// __lnc__f1392()->Any
if (live_enabled) {
	return shader_is_compiled(argument0);
} else return undefined;

#define __lnc__f1393
/// __lnc__f1393()->Any
if (live_enabled) {
	return shader_get_sampler_index(argument0,argument1);
} else return undefined;

#define __lnc__f1394
/// __lnc__f1394()->Any
if (live_enabled) {
	return shader_get_uniform(argument0,argument1);
} else return undefined;

#define __lnc__f1395
/// __lnc__f1395()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("shader_set_uniform_i needs at least 2 arguments, got "+string(argument_count));break;
		case 2:shader_set_uniform_i(argument[0],argument[1]);break;
		case 3:shader_set_uniform_i(argument[0],argument[1],argument[2]);break;
		case 4:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:shader_set_uniform_i(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f1396
/// __lnc__f1396()
if (live_enabled) {
	shader_set_uniform_i_array(argument0,argument1);
}

#define __lnc__f1397
/// __lnc__f1397()
if (live_enabled) {
	switch(argument_count){
		case 0:case 1:gml_thread_error("shader_set_uniform_f needs at least 2 arguments, got "+string(argument_count));break;
		case 2:shader_set_uniform_f(argument[0],argument[1]);break;
		case 3:shader_set_uniform_f(argument[0],argument[1],argument[2]);break;
		case 4:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3]);break;
		case 5:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4]);break;
		case 6:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);break;
		case 7:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);break;
		case 8:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);break;
		case 9:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);break;
		case 10:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);break;
		case 11:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);break;
		case 12:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11]);break;
		case 13:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);break;
		case 14:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13]);break;
		case 15:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14]);break;
		default:shader_set_uniform_f(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12],argument[13],argument[14],argument[15]);
	}
}

#define __lnc__f1398
/// __lnc__f1398()
if (live_enabled) {
	shader_set_uniform_f_array(argument0,argument1);
}

#define __lnc__f1399
/// __lnc__f1399()
if (live_enabled) {
	shader_set_uniform_matrix(argument0);
}

#define __lnc__f1400
/// __lnc__f1400()
if (live_enabled) {
	shader_set_uniform_matrix_array(argument0,argument1);
}

#define __lnc__f1401
/// __lnc__f1401()
if (live_enabled) {
	shader_enable_corner_id(argument0);
}

#define __lnc__f1402
/// __lnc__f1402()
if (live_enabled) {
	texture_set_stage(argument0,argument1);
}

#define __lnc__f1403
/// __lnc__f1403()->Any
if (live_enabled) {
	return texture_get_texel_width(argument0);
} else return undefined;

#define __lnc__f1404
/// __lnc__f1404()->Any
if (live_enabled) {
	return texture_get_texel_height(argument0);
} else return undefined;

#define __lnc__f1405
/// __lnc__f1405()->Any
if (live_enabled) {
	return shaders_are_supported();
} else return undefined;

#define __lnc__f1406
/// __lnc__f1406()
if (live_enabled) {
	vertex_format_begin();
}

#define __lnc__f1407
/// __lnc__f1407()
if (live_enabled) {
	vertex_format_end();
}

#define __lnc__f1408
/// __lnc__f1408()
if (live_enabled) {
	vertex_format_delete(argument0);
}

#define __lnc__f1409
/// __lnc__f1409()
if (live_enabled) {
	vertex_format_add_position();
}

#define __lnc__f1410
/// __lnc__f1410()
if (live_enabled) {
	vertex_format_add_position_3d();
}

#define __lnc__f1411
/// __lnc__f1411()
if (live_enabled) {
	vertex_format_add_colour();
}

#define __lnc__f1412
/// __lnc__f1412()
if (live_enabled) {
	vertex_format_add_normal();
}

#define __lnc__f1413
/// __lnc__f1413()
if (live_enabled) {
	vertex_format_add_textcoord();
}

#define __lnc__f1414
/// __lnc__f1414()
if (live_enabled) {
	vertex_format_add_custom(argument0,argument1);
}

#define __lnc__f1415
/// __lnc__f1415()->Any
if (live_enabled) {
	return vertex_create_buffer();
} else return undefined;

#define __lnc__f1416
/// __lnc__f1416()->Any
if (live_enabled) {
	return vertex_create_buffer_ext(argument0);
} else return undefined;

#define __lnc__f1417
/// __lnc__f1417()
if (live_enabled) {
	vertex_delete_buffer(argument0);
}

#define __lnc__f1418
/// __lnc__f1418()
if (live_enabled) {
	vertex_begin(argument0,argument1);
}

#define __lnc__f1419
/// __lnc__f1419()
if (live_enabled) {
	vertex_end(argument0);
}

#define __lnc__f1420
/// __lnc__f1420()
if (live_enabled) {
	vertex_position(argument0,argument1,argument2);
}

#define __lnc__f1421
/// __lnc__f1421()
if (live_enabled) {
	vertex_position_3d(argument0,argument1,argument2,argument3);
}

#define __lnc__f1422
/// __lnc__f1422()
if (live_enabled) {
	vertex_colour(argument0,argument1,argument2);
}

#define __lnc__f1423
/// __lnc__f1423()
if (live_enabled) {
	vertex_argb(argument0,argument1);
}

#define __lnc__f1424
/// __lnc__f1424()
if (live_enabled) {
	vertex_texcoord(argument0,argument1,argument2);
}

#define __lnc__f1425
/// __lnc__f1425()
if (live_enabled) {
	vertex_normal(argument0,argument1,argument2,argument3);
}

#define __lnc__f1426
/// __lnc__f1426()
if (live_enabled) {
	vertex_float1(argument0,argument1);
}

#define __lnc__f1427
/// __lnc__f1427()
if (live_enabled) {
	vertex_float2(argument0,argument1,argument2);
}

#define __lnc__f1428
/// __lnc__f1428()
if (live_enabled) {
	vertex_float3(argument0,argument1,argument2,argument3);
}

#define __lnc__f1429
/// __lnc__f1429()
if (live_enabled) {
	vertex_float4(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1430
/// __lnc__f1430()
if (live_enabled) {
	vertex_ubyte4(argument0,argument1,argument2,argument3,argument4);
}

#define __lnc__f1431
/// __lnc__f1431()
if (live_enabled) {
	vertex_submit(argument0,argument1,argument2);
}

#define __lnc__f1432
/// __lnc__f1432()
if (live_enabled) {
	vertex_freeze(argument0);
}

#define __lnc__f1433
/// __lnc__f1433()->Any
if (live_enabled) {
	return vertex_get_number(argument0);
} else return undefined;

#define __lnc__f1434
/// __lnc__f1434()->Any
if (live_enabled) {
	return vertex_get_buffer_size(argument0);
} else return undefined;

#define __lnc__f1435
/// __lnc__f1435()->Any
if (live_enabled) {
	return vertex_create_buffer_from_buffer(argument0,argument1);
} else return undefined;

#define __lnc__f1436
/// __lnc__f1436()->Any
if (live_enabled) {
	return vertex_create_buffer_from_buffer_ext(argument0,argument1,argument2,argument3);
} else return undefined;

#define __lnc__f1437
/// __lnc__f1437()
if (live_enabled) {
	skeleton_animation_set(argument0);
}

#define __lnc__f1438
/// __lnc__f1438()->Any
if (live_enabled) {
	return skeleton_animation_get();
} else return undefined;

#define __lnc__f1439
/// __lnc__f1439()
if (live_enabled) {
	skeleton_animation_mix(argument0,argument1,argument2);
}

#define __lnc__f1440
/// __lnc__f1440()
if (live_enabled) {
	skeleton_animation_set_ext(argument0,argument1);
}

#define __lnc__f1441
/// __lnc__f1441()->Any
if (live_enabled) {
	return skeleton_animation_get_ext(argument0);
} else return undefined;

#define __lnc__f1442
/// __lnc__f1442()->Any
if (live_enabled) {
	return skeleton_animation_get_duration(argument0);
} else return undefined;

#define __lnc__f1443
/// __lnc__f1443()->Any
if (live_enabled) {
	return skeleton_animation_get_frames(argument0);
} else return undefined;

#define __lnc__f1444
/// __lnc__f1444()
if (live_enabled) {
	skeleton_animation_clear(argument0);
}

#define __lnc__f1445
/// __lnc__f1445()
if (live_enabled) {
	skeleton_skin_set(argument0);
}

#define __lnc__f1446
/// __lnc__f1446()->Any
if (live_enabled) {
	return skeleton_skin_get();
} else return undefined;

#define __lnc__f1447
/// __lnc__f1447()
if (live_enabled) {
	skeleton_attachment_set(argument0,argument1);
}

#define __lnc__f1448
/// __lnc__f1448()->Any
if (live_enabled) {
	return skeleton_attachment_get(argument0);
} else return undefined;

#define __lnc__f1449
/// __lnc__f1449()->Any
if (live_enabled) {
	return skeleton_attachment_create(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);
} else return undefined;

#define __lnc__f1450
/// __lnc__f1450()
if (live_enabled) {
	skeleton_collision_draw_set(argument0);
}

#define __lnc__f1451
/// __lnc__f1451()->Any
if (live_enabled) {
	return skeleton_bone_data_get(argument0,argument1);
} else return undefined;

#define __lnc__f1452
/// __lnc__f1452()
if (live_enabled) {
	skeleton_bone_data_set(argument0,argument1);
}

#define __lnc__f1453
/// __lnc__f1453()->Any
if (live_enabled) {
	return skeleton_bone_state_get(argument0,argument1);
} else return undefined;

#define __lnc__f1454
/// __lnc__f1454()
if (live_enabled) {
	skeleton_bone_state_set(argument0,argument1);
}

#define __lnc__f1455
/// __lnc__f1455()->Any
if (live_enabled) {
	return skeleton_animation_get_frame(argument0);
} else return undefined;

#define __lnc__f1456
/// __lnc__f1456()
if (live_enabled) {
	skeleton_animation_set_frame(argument0,argument1);
}

#define __lnc__f1457
/// __lnc__f1457()->Any
if (live_enabled) {
	return skeleton_get_minmax();
} else return undefined;

#define __lnc__f1458
/// __lnc__f1458()->Any
if (live_enabled) {
	return skeleton_get_num_bounds();
} else return undefined;

#define __lnc__f1459
/// __lnc__f1459()->Any
if (live_enabled) {
	return skeleton_get_bounds(argument0);
} else return undefined;

#define __lnc__f1460
/// __lnc__f1460()
if (live_enabled) {
	draw_skeleton(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1461
/// __lnc__f1461()
if (live_enabled) {
	draw_skeleton_time(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1462
/// __lnc__f1462()
if (live_enabled) {
	draw_skeleton_instance(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);
}

#define __lnc__f1463
/// __lnc__f1463()
if (live_enabled) {
	draw_skeleton_collision(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
}

#define __lnc__f1464
/// __lnc__f1464()
if (live_enabled) {
	skeleton_animation_list(argument0,argument1);
}

#define __lnc__f1465
/// __lnc__f1465()
if (live_enabled) {
	skeleton_skin_list(argument0,argument1);
}

#define __lnc__f1466
/// __lnc__f1466()
if (live_enabled) {
	skeleton_slot_data(argument0,argument1);
}

#define __lnc__f1467
/// __lnc__f1467(...args2:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		gravity = argument[1];
		return undefined;
	} else return gravity;
} else return undefined;

#define __lnc__f1468
/// __lnc__f1468(...args3:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		gravity_direction = argument[1];
		return undefined;
	} else return gravity_direction;
} else return undefined;

#define __lnc__f1469
/// __lnc__f1469()->dynamic
if (live_enabled) {
	return instance_count;
} else return undefined;

#define __lnc__f1470
/// __lnc__f1470()->dynamic
if (live_enabled) {
	return instance_id;
} else return undefined;

#define __lnc__f1471
/// __lnc__f1471(...args4:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		room_speed = argument[1];
		return undefined;
	} else return room_speed;
} else return undefined;

#define __lnc__f1472
/// __lnc__f1472()->dynamic
if (live_enabled) {
	return fps;
} else return undefined;

#define __lnc__f1473
/// __lnc__f1473()->dynamic
if (live_enabled) {
	return fps_real;
} else return undefined;

#define __lnc__f1474
/// __lnc__f1474()->dynamic
if (live_enabled) {
	return current_time;
} else return undefined;

#define __lnc__f1475
/// __lnc__f1475()->dynamic
if (live_enabled) {
	return current_year;
} else return undefined;

#define __lnc__f1476
/// __lnc__f1476()->dynamic
if (live_enabled) {
	return current_month;
} else return undefined;

#define __lnc__f1477
/// __lnc__f1477()->dynamic
if (live_enabled) {
	return current_day;
} else return undefined;

#define __lnc__f1478
/// __lnc__f1478()->dynamic
if (live_enabled) {
	return current_weekday;
} else return undefined;

#define __lnc__f1479
/// __lnc__f1479()->dynamic
if (live_enabled) {
	return current_hour;
} else return undefined;

#define __lnc__f1480
/// __lnc__f1480()->dynamic
if (live_enabled) {
	return current_minute;
} else return undefined;

#define __lnc__f1481
/// __lnc__f1481()->dynamic
if (live_enabled) {
	return current_second;
} else return undefined;

#define __lnc__f1482
/// __lnc__f1482()->dynamic
if (live_enabled) {
	return room;
} else return undefined;

#define __lnc__f1483
/// __lnc__f1483()->dynamic
if (live_enabled) {
	return room_first;
} else return undefined;

#define __lnc__f1484
/// __lnc__f1484()->dynamic
if (live_enabled) {
	return room_last;
} else return undefined;

#define __lnc__f1485
/// __lnc__f1485()->dynamic
if (live_enabled) {
	return room_width;
} else return undefined;

#define __lnc__f1486
/// __lnc__f1486()->dynamic
if (live_enabled) {
	return room_height;
} else return undefined;

#define __lnc__f1487
/// __lnc__f1487(...args5:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		room_caption = argument[1];
		return undefined;
	} else return room_caption;
} else return undefined;

#define __lnc__f1488
/// __lnc__f1488(...args6:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		room_persistent = argument[1];
		return undefined;
	} else return room_persistent;
} else return undefined;

#define __lnc__f1489
/// __lnc__f1489(...args7:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		score = argument[1];
		return undefined;
	} else return score;
} else return undefined;

#define __lnc__f1490
/// __lnc__f1490(...args8:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		lives = argument[1];
		return undefined;
	} else return lives;
} else return undefined;

#define __lnc__f1491
/// __lnc__f1491(...args9:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		health = argument[1];
		return undefined;
	} else return health;
} else return undefined;

#define __lnc__f1492
/// __lnc__f1492()->dynamic
if (live_enabled) {
	return event_type;
} else return undefined;

#define __lnc__f1493
/// __lnc__f1493()->dynamic
if (live_enabled) {
	return event_number;
} else return undefined;

#define __lnc__f1494
/// __lnc__f1494()->dynamic
if (live_enabled) {
	return event_object;
} else return undefined;

#define __lnc__f1495
/// __lnc__f1495()->dynamic
if (live_enabled) {
	return event_action;
} else return undefined;

#define __lnc__f1496
/// __lnc__f1496()->dynamic
if (live_enabled) {
	return application_surface;
} else return undefined;

#define __lnc__f1497
/// __lnc__f1497()->dynamic
if (live_enabled) {
	return debug_mode;
} else return undefined;

#define __lnc__f1498
/// __lnc__f1498(...args10:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		keyboard_key = argument[1];
		return undefined;
	} else return keyboard_key;
} else return undefined;

#define __lnc__f1499
/// __lnc__f1499(...args11:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		keyboard_lastkey = argument[1];
		return undefined;
	} else return keyboard_lastkey;
} else return undefined;

#define __lnc__f1500
/// __lnc__f1500(...args12:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		keyboard_lastchar = argument[1];
		return undefined;
	} else return keyboard_lastchar;
} else return undefined;

#define __lnc__f1501
/// __lnc__f1501(...args13:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		keyboard_string = argument[1];
		return undefined;
	} else return keyboard_string;
} else return undefined;

#define __lnc__f1502
/// __lnc__f1502()->dynamic
if (live_enabled) {
	return mouse_x;
} else return undefined;

#define __lnc__f1503
/// __lnc__f1503()->dynamic
if (live_enabled) {
	return mouse_y;
} else return undefined;

#define __lnc__f1504
/// __lnc__f1504(...args14:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		mouse_button = argument[1];
		return undefined;
	} else return mouse_button;
} else return undefined;

#define __lnc__f1505
/// __lnc__f1505(...args15:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		mouse_lastbutton = argument[1];
		return undefined;
	} else return mouse_lastbutton;
} else return undefined;

#define __lnc__f1506
/// __lnc__f1506(...args16:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		cursor_sprite = argument[1];
		return undefined;
	} else return cursor_sprite;
} else return undefined;

#define __lnc__f1507
/// __lnc__f1507(...args17:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		background_colour = argument[1];
		return undefined;
	} else return background_colour;
} else return undefined;

#define __lnc__f1508
/// __lnc__f1508(...args18:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		background_showcolour = argument[1];
		return undefined;
	} else return background_showcolour;
} else return undefined;

#define __lnc__f1509
/// __lnc__f1509(...args19:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_visible[argument[2]] = argument[1];
		return undefined;
	} else return background_visible[argument[2]];
} else return undefined;

#define __lnc__f1510
/// __lnc__f1510(...args20:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_foreground[argument[2]] = argument[1];
		return undefined;
	} else return background_foreground[argument[2]];
} else return undefined;

#define __lnc__f1511
/// __lnc__f1511(...args21:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_index[argument[2]] = argument[1];
		return undefined;
	} else return background_index[argument[2]];
} else return undefined;

#define __lnc__f1512
/// __lnc__f1512(...args22:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_x[argument[2]] = argument[1];
		return undefined;
	} else return background_x[argument[2]];
} else return undefined;

#define __lnc__f1513
/// __lnc__f1513(...args23:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0...7]"));
	if(argument[0]){
		background_y[argument[2]] = argument[1];
		return undefined;
	} else return background_y[argument[2]];
} else return undefined;

#define __lnc__f1514
/// __lnc__f1514(...args24:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0...7]"));
	return background_width[argument[2]];
} else return undefined;

#define __lnc__f1515
/// __lnc__f1515(...args25:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0...7]"));
	return background_height[argument[2]];
} else return undefined;

#define __lnc__f1516
/// __lnc__f1516(...args26:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_htiled[argument[2]] = argument[1];
		return undefined;
	} else return background_htiled[argument[2]];
} else return undefined;

#define __lnc__f1517
/// __lnc__f1517(...args27:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_vtiled[argument[2]] = argument[1];
		return undefined;
	} else return background_vtiled[argument[2]];
} else return undefined;

#define __lnc__f1518
/// __lnc__f1518(...args28:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_xscale[argument[2]] = argument[1];
		return undefined;
	} else return background_xscale[argument[2]];
} else return undefined;

#define __lnc__f1519
/// __lnc__f1519(...args29:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_yscale[argument[2]] = argument[1];
		return undefined;
	} else return background_yscale[argument[2]];
} else return undefined;

#define __lnc__f1520
/// __lnc__f1520(...args30:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_hspeed[argument[2]] = argument[1];
		return undefined;
	} else return background_hspeed[argument[2]];
} else return undefined;

#define __lnc__f1521
/// __lnc__f1521(...args31:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_vspeed[argument[2]] = argument[1];
		return undefined;
	} else return background_vspeed[argument[2]];
} else return undefined;

#define __lnc__f1522
/// __lnc__f1522(...args32:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_blend[argument[2]] = argument[1];
		return undefined;
	} else return background_blend[argument[2]];
} else return undefined;

#define __lnc__f1523
/// __lnc__f1523(...args33:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		background_alpha[argument[2]] = argument[1];
		return undefined;
	} else return background_alpha[argument[2]];
} else return undefined;

#define __lnc__f1524
/// __lnc__f1524(...args34:dynamic)->dynamic
if (live_enabled) {
	if(argument[0]){
		view_enabled = argument[1];
		return undefined;
	} else return view_enabled;
} else return undefined;

#define __lnc__f1525
/// __lnc__f1525()->dynamic
if (live_enabled) {
	return view_current;
} else return undefined;

#define __lnc__f1526
/// __lnc__f1526(...args35:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_visible[argument[2]] = argument[1];
		return undefined;
	} else return view_visible[argument[2]];
} else return undefined;

#define __lnc__f1527
/// __lnc__f1527(...args36:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_xview[argument[2]] = argument[1];
		return undefined;
	} else return view_xview[argument[2]];
} else return undefined;

#define __lnc__f1528
/// __lnc__f1528(...args37:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_yview[argument[2]] = argument[1];
		return undefined;
	} else return view_yview[argument[2]];
} else return undefined;

#define __lnc__f1529
/// __lnc__f1529(...args38:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_wview[argument[2]] = argument[1];
		return undefined;
	} else return view_wview[argument[2]];
} else return undefined;

#define __lnc__f1530
/// __lnc__f1530(...args39:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_hview[argument[2]] = argument[1];
		return undefined;
	} else return view_hview[argument[2]];
} else return undefined;

#define __lnc__f1531
/// __lnc__f1531(...args40:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_xport[argument[2]] = argument[1];
		return undefined;
	} else return view_xport[argument[2]];
} else return undefined;

#define __lnc__f1532
/// __lnc__f1532(...args41:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_yport[argument[2]] = argument[1];
		return undefined;
	} else return view_yport[argument[2]];
} else return undefined;

#define __lnc__f1533
/// __lnc__f1533(...args42:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_wport[argument[2]] = argument[1];
		return undefined;
	} else return view_wport[argument[2]];
} else return undefined;

#define __lnc__f1534
/// __lnc__f1534(...args43:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_hport[argument[2]] = argument[1];
		return undefined;
	} else return view_hport[argument[2]];
} else return undefined;

#define __lnc__f1535
/// __lnc__f1535(...args44:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_angle[argument[2]] = argument[1];
		return undefined;
	} else return view_angle[argument[2]];
} else return undefined;

#define __lnc__f1536
/// __lnc__f1536(...args45:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_hborder[argument[2]] = argument[1];
		return undefined;
	} else return view_hborder[argument[2]];
} else return undefined;

#define __lnc__f1537
/// __lnc__f1537(...args46:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_vborder[argument[2]] = argument[1];
		return undefined;
	} else return view_vborder[argument[2]];
} else return undefined;

#define __lnc__f1538
/// __lnc__f1538(...args47:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_hspeed[argument[2]] = argument[1];
		return undefined;
	} else return view_hspeed[argument[2]];
} else return undefined;

#define __lnc__f1539
/// __lnc__f1539(...args48:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_vspeed[argument[2]] = argument[1];
		return undefined;
	} else return view_vspeed[argument[2]];
} else return undefined;

#define __lnc__f1540
/// __lnc__f1540(...args49:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_object[argument[2]] = argument[1];
		return undefined;
	} else return view_object[argument[2]];
} else return undefined;

#define __lnc__f1541
/// __lnc__f1541(...args50:dynamic)->dynamic
if (live_enabled) {
	if(argument[2]<0||argument[2]>7)return gml_thread_error(("Index ("+string(argument[2])+") is out of range [0..7]"));
	if(argument[0]){
		view_surface_id[argument[2]] = argument[1];
		return undefined;
	} else return view_surface_id[argument[2]];
} else return undefined;

#define __lnc__f1542
/// __lnc__f1542()->dynamic
if (live_enabled) {
	return game_id;
} else return undefined;

#define __lnc__f1543
/// __lnc__f1543()->dynamic
if (live_enabled) {
	return game_display_name;
} else return undefined;

#define __lnc__f1544
/// __lnc__f1544()->dynamic
if (live_enabled) {
	return game_project_name;
} else return undefined;

#define __lnc__f1545
/// __lnc__f1545()->dynamic
if (live_enabled) {
	return game_save_id;
} else return undefined;

#define __lnc__f1546
/// __lnc__f1546()->dynamic
if (live_enabled) {
	return working_directory;
} else return undefined;

#define __lnc__f1547
/// __lnc__f1547()->dynamic
if (live_enabled) {
	return temp_directory;
} else return undefined;

#define __lnc__f1548
/// __lnc__f1548()->dynamic
if (live_enabled) {
	return program_directory;
} else return undefined;

#define __lnc__f1549
/// __lnc__f1549()->dynamic
if (live_enabled) {
	return browser_width;
} else return undefined;

#define __lnc__f1550
/// __lnc__f1550()->dynamic
if (live_enabled) {
	return browser_height;
} else return undefined;

#define __lnc__f1551
/// __lnc__f1551()->dynamic
if (live_enabled) {
	return os_type;
} else return undefined;

#define __lnc__f1552
/// __lnc__f1552()->dynamic
if (live_enabled) {
	return os_device;
} else return undefined;

#define __lnc__f1553
/// __lnc__f1553()->dynamic
if (live_enabled) {
	return os_browser;
} else return undefined;

#define __lnc__f1554
/// __lnc__f1554()->dynamic
if (live_enabled) {
	return os_version;
} else return undefined;

#define __lnc__f1555
/// __lnc__f1555()->dynamic
if (live_enabled) {
	return display_aa;
} else return undefined;

#define __lnc__f1556
/// __lnc__f1556()->dynamic
if (live_enabled) {
	return async_load;
} else return undefined;

#define __lnc__f1557
/// __lnc__f1557()->dynamic
if (live_enabled) {
	return delta_time;
} else return undefined;

#define __lnc__f1558
/// __lnc__f1558()->dynamic
if (live_enabled) {
	return webgl_enabled;
} else return undefined;

#define __lnc_const_decl_f0
/// __lnc_const_decl_f0()
if (live_enabled) {
	gml_const_add("pi",pi);
	gml_const_add("GM_build_date",GM_build_date);
	gml_const_add("GM_version",GM_version);
	gml_const_add("GM_runtime_version",GM_runtime_version);
	gml_const_add("timezone_local",timezone_local);
	gml_const_add("timezone_utc",timezone_utc);
	gml_const_add("path_action_stop",path_action_stop);
	gml_const_add("path_action_restart",path_action_restart);
	gml_const_add("path_action_continue",path_action_continue);
	gml_const_add("path_action_reverse",path_action_reverse);
	gml_const_add("ev_create",ev_create);
	gml_const_add("ev_destroy",ev_destroy);
	gml_const_add("ev_step",ev_step);
	gml_const_add("ev_alarm",ev_alarm);
	gml_const_add("ev_keyboard",ev_keyboard);
	gml_const_add("ev_mouse",ev_mouse);
	gml_const_add("ev_collision",ev_collision);
	gml_const_add("ev_other",ev_other);
	gml_const_add("ev_draw",ev_draw);
	gml_const_add("ev_draw_begin",ev_draw_begin);
	gml_const_add("ev_draw_end",ev_draw_end);
	gml_const_add("ev_draw_pre",ev_draw_pre);
	gml_const_add("ev_draw_post",ev_draw_post);
	gml_const_add("ev_keypress",ev_keypress);
	gml_const_add("ev_keyrelease",ev_keyrelease);
	gml_const_add("ev_trigger",ev_trigger);
	gml_const_add("ev_left_button",ev_left_button);
	gml_const_add("ev_right_button",ev_right_button);
	gml_const_add("ev_middle_button",ev_middle_button);
	gml_const_add("ev_no_button",ev_no_button);
	gml_const_add("ev_left_press",ev_left_press);
	gml_const_add("ev_right_press",ev_right_press);
}

#define __lnc_const_decl_f1
/// __lnc_const_decl_f1()
if (live_enabled) {
	gml_const_add("ev_middle_press",ev_middle_press);
	gml_const_add("ev_left_release",ev_left_release);
	gml_const_add("ev_right_release",ev_right_release);
	gml_const_add("ev_middle_release",ev_middle_release);
	gml_const_add("ev_mouse_enter",ev_mouse_enter);
	gml_const_add("ev_mouse_leave",ev_mouse_leave);
	gml_const_add("ev_mouse_wheel_up",ev_mouse_wheel_up);
	gml_const_add("ev_mouse_wheel_down",ev_mouse_wheel_down);
	gml_const_add("ev_global_left_button",ev_global_left_button);
	gml_const_add("ev_global_right_button",ev_global_right_button);
	gml_const_add("ev_global_middle_button",ev_global_middle_button);
	gml_const_add("ev_global_left_press",ev_global_left_press);
	gml_const_add("ev_global_right_press",ev_global_right_press);
	gml_const_add("ev_global_middle_press",ev_global_middle_press);
	gml_const_add("ev_global_left_release",ev_global_left_release);
	gml_const_add("ev_global_right_release",ev_global_right_release);
	gml_const_add("ev_global_middle_release",ev_global_middle_release);
	gml_const_add("ev_outside",ev_outside);
	gml_const_add("ev_boundary",ev_boundary);
	gml_const_add("ev_game_start",ev_game_start);
	gml_const_add("ev_game_end",ev_game_end);
	gml_const_add("ev_room_start",ev_room_start);
	gml_const_add("ev_room_end",ev_room_end);
	gml_const_add("ev_no_more_lives",ev_no_more_lives);
	gml_const_add("ev_animation_end",ev_animation_end);
	gml_const_add("ev_end_of_path",ev_end_of_path);
	gml_const_add("ev_no_more_health",ev_no_more_health);
	gml_const_add("ev_user0",ev_user0);
	gml_const_add("ev_user1",ev_user1);
	gml_const_add("ev_user2",ev_user2);
	gml_const_add("ev_user3",ev_user3);
	gml_const_add("ev_user4",ev_user4);
}

#define __lnc_const_decl_f2
/// __lnc_const_decl_f2()
if (live_enabled) {
	gml_const_add("ev_user5",ev_user5);
	gml_const_add("ev_user6",ev_user6);
	gml_const_add("ev_user7",ev_user7);
	gml_const_add("ev_user8",ev_user8);
	gml_const_add("ev_user9",ev_user9);
	gml_const_add("ev_user10",ev_user10);
	gml_const_add("ev_user11",ev_user11);
	gml_const_add("ev_user12",ev_user12);
	gml_const_add("ev_user13",ev_user13);
	gml_const_add("ev_user14",ev_user14);
	gml_const_add("ev_user15",ev_user15);
	gml_const_add("ev_step_normal",ev_step_normal);
	gml_const_add("ev_step_begin",ev_step_begin);
	gml_const_add("ev_step_end",ev_step_end);
	gml_const_add("ev_gui",ev_gui);
	gml_const_add("ev_gui_begin",ev_gui_begin);
	gml_const_add("ev_gui_end",ev_gui_end);
	gml_const_add("vk_nokey",vk_nokey);
	gml_const_add("vk_anykey",vk_anykey);
	gml_const_add("vk_enter",vk_enter);
	gml_const_add("vk_return",vk_return);
	gml_const_add("vk_shift",vk_shift);
	gml_const_add("vk_control",vk_control);
	gml_const_add("vk_alt",vk_alt);
	gml_const_add("vk_escape",vk_escape);
	gml_const_add("vk_space",vk_space);
	gml_const_add("vk_backspace",vk_backspace);
	gml_const_add("vk_tab",vk_tab);
	gml_const_add("vk_pause",vk_pause);
	gml_const_add("vk_printscreen",vk_printscreen);
	gml_const_add("vk_left",vk_left);
	gml_const_add("vk_right",vk_right);
}

#define __lnc_const_decl_f3
/// __lnc_const_decl_f3()
if (live_enabled) {
	gml_const_add("vk_up",vk_up);
	gml_const_add("vk_down",vk_down);
	gml_const_add("vk_home",vk_home);
	gml_const_add("vk_end",vk_end);
	gml_const_add("vk_delete",vk_delete);
	gml_const_add("vk_insert",vk_insert);
	gml_const_add("vk_pageup",vk_pageup);
	gml_const_add("vk_pagedown",vk_pagedown);
	gml_const_add("vk_f1",vk_f1);
	gml_const_add("vk_f2",vk_f2);
	gml_const_add("vk_f3",vk_f3);
	gml_const_add("vk_f4",vk_f4);
	gml_const_add("vk_f5",vk_f5);
	gml_const_add("vk_f6",vk_f6);
	gml_const_add("vk_f7",vk_f7);
	gml_const_add("vk_f8",vk_f8);
	gml_const_add("vk_f9",vk_f9);
	gml_const_add("vk_f10",vk_f10);
	gml_const_add("vk_f11",vk_f11);
	gml_const_add("vk_f12",vk_f12);
	gml_const_add("vk_numpad0",vk_numpad0);
	gml_const_add("vk_numpad1",vk_numpad1);
	gml_const_add("vk_numpad2",vk_numpad2);
	gml_const_add("vk_numpad3",vk_numpad3);
	gml_const_add("vk_numpad4",vk_numpad4);
	gml_const_add("vk_numpad5",vk_numpad5);
	gml_const_add("vk_numpad6",vk_numpad6);
	gml_const_add("vk_numpad7",vk_numpad7);
	gml_const_add("vk_numpad8",vk_numpad8);
	gml_const_add("vk_numpad9",vk_numpad9);
	gml_const_add("vk_divide",vk_divide);
	gml_const_add("vk_multiply",vk_multiply);
}

#define __lnc_const_decl_f4
/// __lnc_const_decl_f4()
if (live_enabled) {
	gml_const_add("vk_subtract",vk_subtract);
	gml_const_add("vk_add",vk_add);
	gml_const_add("vk_decimal",vk_decimal);
	gml_const_add("vk_lshift",vk_lshift);
	gml_const_add("vk_lcontrol",vk_lcontrol);
	gml_const_add("vk_lalt",vk_lalt);
	gml_const_add("vk_rshift",vk_rshift);
	gml_const_add("vk_rcontrol",vk_rcontrol);
	gml_const_add("vk_ralt",vk_ralt);
	gml_const_add("mb_any",mb_any);
	gml_const_add("mb_none",mb_none);
	gml_const_add("mb_left",mb_left);
	gml_const_add("mb_right",mb_right);
	gml_const_add("mb_middle",mb_middle);
	gml_const_add("c_aqua",c_aqua);
	gml_const_add("c_black",c_black);
	gml_const_add("c_blue",c_blue);
	gml_const_add("c_dkgray",c_dkgray);
	gml_const_add("c_fuchsia",c_fuchsia);
	gml_const_add("c_gray",c_gray);
	gml_const_add("c_green",c_green);
	gml_const_add("c_lime",c_lime);
	gml_const_add("c_ltgray",c_ltgray);
	gml_const_add("c_maroon",c_maroon);
	gml_const_add("c_navy",c_navy);
	gml_const_add("c_olive",c_olive);
	gml_const_add("c_purple",c_purple);
	gml_const_add("c_red",c_red);
	gml_const_add("c_silver",c_silver);
	gml_const_add("c_teal",c_teal);
	gml_const_add("c_white",c_white);
	gml_const_add("c_yellow",c_yellow);
}

#define __lnc_const_decl_f5
/// __lnc_const_decl_f5()
if (live_enabled) {
	gml_const_add("c_orange",c_orange);
	gml_const_add("fa_left",fa_left);
	gml_const_add("fa_center",fa_center);
	gml_const_add("fa_right",fa_right);
	gml_const_add("fa_top",fa_top);
	gml_const_add("fa_middle",fa_middle);
	gml_const_add("fa_bottom",fa_bottom);
	gml_const_add("pr_pointlist",pr_pointlist);
	gml_const_add("pr_linelist",pr_linelist);
	gml_const_add("pr_linestrip",pr_linestrip);
	gml_const_add("pr_trianglelist",pr_trianglelist);
	gml_const_add("pr_trianglestrip",pr_trianglestrip);
	gml_const_add("pr_trianglefan",pr_trianglefan);
	gml_const_add("bm_normal",bm_normal);
	gml_const_add("bm_add",bm_add);
	gml_const_add("bm_max",bm_max);
	gml_const_add("bm_subtract",bm_subtract);
	gml_const_add("bm_zero",bm_zero);
	gml_const_add("bm_one",bm_one);
	gml_const_add("bm_src_colour",bm_src_colour);
	gml_const_add("bm_inv_src_colour",bm_inv_src_colour);
	gml_const_add("bm_src_alpha",bm_src_alpha);
	gml_const_add("bm_inv_src_alpha",bm_inv_src_alpha);
	gml_const_add("bm_dest_alpha",bm_dest_alpha);
	gml_const_add("bm_inv_dest_alpha",bm_inv_dest_alpha);
	gml_const_add("bm_dest_colour",bm_dest_colour);
	gml_const_add("bm_inv_dest_colour",bm_inv_dest_colour);
	gml_const_add("bm_src_alpha_sat",bm_src_alpha_sat);
	gml_const_add("audio_falloff_none",audio_falloff_none);
	gml_const_add("audio_falloff_inverse_distance",audio_falloff_inverse_distance);
	gml_const_add("audio_falloff_inverse_distance_clamped",audio_falloff_inverse_distance_clamped);
	gml_const_add("audio_falloff_linear_distance",audio_falloff_linear_distance);
}

#define __lnc_const_decl_f6
/// __lnc_const_decl_f6()
if (live_enabled) {
	gml_const_add("audio_falloff_linear_distance_clamped",audio_falloff_linear_distance_clamped);
	gml_const_add("audio_falloff_exponent_distance",audio_falloff_exponent_distance);
	gml_const_add("audio_falloff_exponent_distance_clamped",audio_falloff_exponent_distance_clamped);
	gml_const_add("audio_old_system",audio_old_system);
	gml_const_add("audio_new_system",audio_new_system);
	gml_const_add("audio_mono",audio_mono);
	gml_const_add("audio_stereo",audio_stereo);
	gml_const_add("audio_3d",audio_3d);
	gml_const_add("vbm_fast",vbm_fast);
	gml_const_add("vbm_compatible",vbm_compatible);
	gml_const_add("vbm_most_compatible",vbm_most_compatible);
	gml_const_add("cr_default",cr_default);
	gml_const_add("cr_none",cr_none);
	gml_const_add("cr_arrow",cr_arrow);
	gml_const_add("cr_cross",cr_cross);
	gml_const_add("cr_beam",cr_beam);
	gml_const_add("cr_size_nesw",cr_size_nesw);
	gml_const_add("cr_size_ns",cr_size_ns);
	gml_const_add("cr_size_nwse",cr_size_nwse);
	gml_const_add("cr_size_we",cr_size_we);
	gml_const_add("cr_uparrow",cr_uparrow);
	gml_const_add("cr_hourglass",cr_hourglass);
	gml_const_add("cr_drag",cr_drag);
	gml_const_add("cr_appstart",cr_appstart);
	gml_const_add("cr_handpoint",cr_handpoint);
	gml_const_add("cr_size_all",cr_size_all);
	gml_const_add("asset_object",asset_object);
	gml_const_add("asset_unknown",asset_unknown);
	gml_const_add("asset_sprite",asset_sprite);
	gml_const_add("asset_sound",asset_sound);
	gml_const_add("asset_room",asset_room);
	gml_const_add("asset_background",asset_background);
}

#define __lnc_const_decl_f7
/// __lnc_const_decl_f7()
if (live_enabled) {
	gml_const_add("asset_path",asset_path);
	gml_const_add("asset_script",asset_script);
	gml_const_add("asset_font",asset_font);
	gml_const_add("asset_timeline",asset_timeline);
	gml_const_add("fa_readonly",fa_readonly);
	gml_const_add("fa_hidden",fa_hidden);
	gml_const_add("fa_sysfile",fa_sysfile);
	gml_const_add("fa_volumeid",fa_volumeid);
	gml_const_add("fa_directory",fa_directory);
	gml_const_add("fa_archive",fa_archive);
	gml_const_add("ds_type_map",ds_type_map);
	gml_const_add("ds_type_list",ds_type_list);
	gml_const_add("ds_type_stack",ds_type_stack);
	gml_const_add("ds_type_queue",ds_type_queue);
	gml_const_add("ds_type_grid",ds_type_grid);
	gml_const_add("ds_type_priority",ds_type_priority);
	gml_const_add("ef_explosion",ef_explosion);
	gml_const_add("ef_ring",ef_ring);
	gml_const_add("ef_ellipse",ef_ellipse);
	gml_const_add("ef_firework",ef_firework);
	gml_const_add("ef_smoke",ef_smoke);
	gml_const_add("ef_smokeup",ef_smokeup);
	gml_const_add("ef_star",ef_star);
	gml_const_add("ef_spark",ef_spark);
	gml_const_add("ef_flare",ef_flare);
	gml_const_add("ef_cloud",ef_cloud);
	gml_const_add("ef_rain",ef_rain);
	gml_const_add("ef_snow",ef_snow);
	gml_const_add("pt_shape_pixel",pt_shape_pixel);
	gml_const_add("pt_shape_disk",pt_shape_disk);
	gml_const_add("pt_shape_square",pt_shape_square);
	gml_const_add("pt_shape_line",pt_shape_line);
}

#define __lnc_const_decl_f8
/// __lnc_const_decl_f8()
if (live_enabled) {
	gml_const_add("pt_shape_star",pt_shape_star);
	gml_const_add("pt_shape_circle",pt_shape_circle);
	gml_const_add("pt_shape_ring",pt_shape_ring);
	gml_const_add("pt_shape_sphere",pt_shape_sphere);
	gml_const_add("pt_shape_flare",pt_shape_flare);
	gml_const_add("pt_shape_spark",pt_shape_spark);
	gml_const_add("pt_shape_explosion",pt_shape_explosion);
	gml_const_add("pt_shape_cloud",pt_shape_cloud);
	gml_const_add("pt_shape_smoke",pt_shape_smoke);
	gml_const_add("pt_shape_snow",pt_shape_snow);
	gml_const_add("ps_distr_linear",ps_distr_linear);
	gml_const_add("ps_distr_gaussian",ps_distr_gaussian);
	gml_const_add("ps_distr_invgaussian",ps_distr_invgaussian);
	gml_const_add("ps_shape_rectangle",ps_shape_rectangle);
	gml_const_add("ps_shape_ellipse",ps_shape_ellipse);
	gml_const_add("ps_shape_diamond",ps_shape_diamond);
	gml_const_add("ps_shape_line",ps_shape_line);
	gml_const_add("matrix_view",matrix_view);
	gml_const_add("matrix_projection",matrix_projection);
	gml_const_add("matrix_world",matrix_world);
	gml_const_add("os_win32",os_win32);
	gml_const_add("os_windows",os_windows);
	gml_const_add("os_macosx",os_macosx);
	gml_const_add("os_psp",os_psp);
	gml_const_add("os_ios",os_ios);
	gml_const_add("os_android",os_android);
	gml_const_add("os_symbian",os_symbian);
	gml_const_add("os_linux",os_linux);
	gml_const_add("os_unknown",os_unknown);
	gml_const_add("os_winphone",os_winphone);
	gml_const_add("os_tizen",os_tizen);
	gml_const_add("os_win8native",os_win8native);
}

#define __lnc_const_decl_f9
/// __lnc_const_decl_f9()
if (live_enabled) {
	gml_const_add("os_wiiu",os_wiiu);
	gml_const_add("os_3ds",os_3ds);
	gml_const_add("os_psvita",os_psvita);
	gml_const_add("os_bb10",os_bb10);
	gml_const_add("os_ps4",os_ps4);
	gml_const_add("os_xboxone",os_xboxone);
	gml_const_add("os_ps3",os_ps3);
	gml_const_add("os_xbox360",os_xbox360);
	gml_const_add("os_uwp",os_uwp);
	gml_const_add("browser_not_a_browser",browser_not_a_browser);
	gml_const_add("browser_unknown",browser_unknown);
	gml_const_add("browser_ie",browser_ie);
	gml_const_add("browser_firefox",browser_firefox);
	gml_const_add("browser_chrome",browser_chrome);
	gml_const_add("browser_safari",browser_safari);
	gml_const_add("browser_safari_mobile",browser_safari_mobile);
	gml_const_add("browser_opera",browser_opera);
	gml_const_add("browser_tizen",browser_tizen);
	gml_const_add("browser_windows_store",browser_windows_store);
	gml_const_add("browser_ie_mobile",browser_ie_mobile);
	gml_const_add("device_ios_unknown",device_ios_unknown);
	gml_const_add("device_ios_iphone",device_ios_iphone);
	gml_const_add("device_ios_iphone_retina",device_ios_iphone_retina);
	gml_const_add("device_ios_ipad",device_ios_ipad);
	gml_const_add("device_ios_ipad_retina",device_ios_ipad_retina);
	gml_const_add("device_ios_iphone5",device_ios_iphone5);
	gml_const_add("device_ios_iphone6",device_ios_iphone6);
	gml_const_add("device_ios_iphone6plus",device_ios_iphone6plus);
	gml_const_add("device_ios_iphone6s",device_ios_iphone6s);
	gml_const_add("device_ios_iphone6splus",device_ios_iphone6splus);
	gml_const_add("device_emulator",device_emulator);
	gml_const_add("device_tablet",device_tablet);
}

#define __lnc_const_decl_f10
/// __lnc_const_decl_f10()
if (live_enabled) {
	gml_const_add("display_landscape",display_landscape);
	gml_const_add("display_landscape_flipped",display_landscape_flipped);
	gml_const_add("display_portrait",display_portrait);
	gml_const_add("display_portrait_flipped",display_portrait_flipped);
	gml_const_add("phy_joint_anchor_1_x",phy_joint_anchor_1_x);
	gml_const_add("phy_joint_anchor_1_y",phy_joint_anchor_1_y);
	gml_const_add("phy_joint_anchor_2_x",phy_joint_anchor_2_x);
	gml_const_add("phy_joint_anchor_2_y",phy_joint_anchor_2_y);
	gml_const_add("phy_joint_reaction_force_x",phy_joint_reaction_force_x);
	gml_const_add("phy_joint_reaction_force_y",phy_joint_reaction_force_y);
	gml_const_add("phy_joint_reaction_torque",phy_joint_reaction_torque);
	gml_const_add("phy_joint_motor_speed",phy_joint_motor_speed);
	gml_const_add("phy_joint_angle",phy_joint_angle);
	gml_const_add("phy_joint_motor_torque",phy_joint_motor_torque);
	gml_const_add("phy_joint_max_motor_torque",phy_joint_max_motor_torque);
	gml_const_add("phy_joint_translation",phy_joint_translation);
	gml_const_add("phy_joint_speed",phy_joint_speed);
	gml_const_add("phy_joint_motor_force",phy_joint_motor_force);
	gml_const_add("phy_joint_max_motor_force",phy_joint_max_motor_force);
	gml_const_add("phy_joint_length_1",phy_joint_length_1);
	gml_const_add("phy_joint_length_2",phy_joint_length_2);
	gml_const_add("phy_joint_damping_ratio",phy_joint_damping_ratio);
	gml_const_add("phy_joint_frequency",phy_joint_frequency);
	gml_const_add("phy_joint_lower_angle_limit",phy_joint_lower_angle_limit);
	gml_const_add("phy_joint_upper_angle_limit",phy_joint_upper_angle_limit);
	gml_const_add("phy_joint_angle_limits",phy_joint_angle_limits);
	gml_const_add("phy_joint_max_length",phy_joint_max_length);
	gml_const_add("phy_joint_max_torque",phy_joint_max_torque);
	gml_const_add("phy_joint_max_force",phy_joint_max_force);
	gml_const_add("phy_debug_render_aabb",phy_debug_render_aabb);
	gml_const_add("phy_debug_render_collision_pairs",phy_debug_render_collision_pairs);
	gml_const_add("phy_debug_render_coms",phy_debug_render_coms);
}

#define __lnc_const_decl_f11
/// __lnc_const_decl_f11()
if (live_enabled) {
	gml_const_add("phy_debug_render_core_shapes",phy_debug_render_core_shapes);
	gml_const_add("phy_debug_render_joints",phy_debug_render_joints);
	gml_const_add("phy_debug_render_obb",phy_debug_render_obb);
	gml_const_add("phy_debug_render_shapes",phy_debug_render_shapes);
	gml_const_add("phy_particle_flag_water",phy_particle_flag_water);
	gml_const_add("phy_particle_flag_zombie",phy_particle_flag_zombie);
	gml_const_add("phy_particle_flag_wall",phy_particle_flag_wall);
	gml_const_add("phy_particle_flag_spring",phy_particle_flag_spring);
	gml_const_add("phy_particle_flag_elastic",phy_particle_flag_elastic);
	gml_const_add("phy_particle_flag_viscous",phy_particle_flag_viscous);
	gml_const_add("phy_particle_flag_powder",phy_particle_flag_powder);
	gml_const_add("phy_particle_flag_tensile",phy_particle_flag_tensile);
	gml_const_add("phy_particle_flag_colourmixing",phy_particle_flag_colourmixing);
	gml_const_add("phy_particle_group_flag_solid",phy_particle_group_flag_solid);
	gml_const_add("phy_particle_group_flag_rigid",phy_particle_group_flag_rigid);
	gml_const_add("phy_particle_data_flag_typeflags",phy_particle_data_flag_typeflags);
	gml_const_add("phy_particle_data_flag_position",phy_particle_data_flag_position);
	gml_const_add("phy_particle_data_flag_velocity",phy_particle_data_flag_velocity);
	gml_const_add("phy_particle_data_flag_colour",phy_particle_data_flag_colour);
	gml_const_add("phy_particle_data_flag_category",phy_particle_data_flag_category);
	gml_const_add("network_socket_tcp",network_socket_tcp);
	gml_const_add("network_socket_udp",network_socket_udp);
	gml_const_add("network_socket_bluetooth",network_socket_bluetooth);
	gml_const_add("network_type_connect",network_type_connect);
	gml_const_add("network_type_disconnect",network_type_disconnect);
	gml_const_add("network_type_data",network_type_data);
	gml_const_add("network_type_non_blocking_connect",network_type_non_blocking_connect);
	gml_const_add("network_config_connect_timeout",network_config_connect_timeout);
	gml_const_add("network_config_use_non_blocking_socket",network_config_use_non_blocking_socket);
	gml_const_add("network_config_enable_reliable_udp",network_config_enable_reliable_udp);
	gml_const_add("network_config_disable_reliable_udp",network_config_disable_reliable_udp);
	gml_const_add("buffer_fixed",buffer_fixed);
}

#define __lnc_const_decl_f12
/// __lnc_const_decl_f12()
if (live_enabled) {
	gml_const_add("buffer_grow",buffer_grow);
	gml_const_add("buffer_wrap",buffer_wrap);
	gml_const_add("buffer_fast",buffer_fast);
	gml_const_add("buffer_vbuffer",buffer_vbuffer);
	gml_const_add("buffer_network",buffer_network);
	gml_const_add("buffer_u8",buffer_u8);
	gml_const_add("buffer_s8",buffer_s8);
	gml_const_add("buffer_u16",buffer_u16);
	gml_const_add("buffer_s16",buffer_s16);
	gml_const_add("buffer_u32",buffer_u32);
	gml_const_add("buffer_s32",buffer_s32);
	gml_const_add("buffer_u64",buffer_u64);
	gml_const_add("buffer_f16",buffer_f16);
	gml_const_add("buffer_f32",buffer_f32);
	gml_const_add("buffer_f64",buffer_f64);
	gml_const_add("buffer_bool",buffer_bool);
	gml_const_add("buffer_string",buffer_string);
	gml_const_add("buffer_text",buffer_text);
	gml_const_add("buffer_seek_start",buffer_seek_start);
	gml_const_add("buffer_seek_relative",buffer_seek_relative);
	gml_const_add("buffer_seek_end",buffer_seek_end);
	gml_const_add("gp_face1",gp_face1);
	gml_const_add("gp_face2",gp_face2);
	gml_const_add("gp_face3",gp_face3);
	gml_const_add("gp_face4",gp_face4);
	gml_const_add("gp_shoulderl",gp_shoulderl);
	gml_const_add("gp_shoulderr",gp_shoulderr);
	gml_const_add("gp_shoulderlb",gp_shoulderlb);
	gml_const_add("gp_shoulderrb",gp_shoulderrb);
	gml_const_add("gp_select",gp_select);
	gml_const_add("gp_start",gp_start);
	gml_const_add("gp_stickl",gp_stickl);
}

#define __lnc_const_decl_f13
/// __lnc_const_decl_f13()
if (live_enabled) {
	gml_const_add("gp_stickr",gp_stickr);
	gml_const_add("gp_padu",gp_padu);
	gml_const_add("gp_padd",gp_padd);
	gml_const_add("gp_padl",gp_padl);
	gml_const_add("gp_padr",gp_padr);
	gml_const_add("gp_axislh",gp_axislh);
	gml_const_add("gp_axislv",gp_axislv);
	gml_const_add("gp_axisrh",gp_axisrh);
	gml_const_add("gp_axisrv",gp_axisrv);
	gml_const_add("ov_friends",ov_friends);
	gml_const_add("ov_community",ov_community);
	gml_const_add("ov_players",ov_players);
	gml_const_add("ov_settings",ov_settings);
	gml_const_add("ov_gamegroup",ov_gamegroup);
	gml_const_add("ov_achievements",ov_achievements);
	gml_const_add("lb_sort_none",lb_sort_none);
	gml_const_add("lb_sort_ascending",lb_sort_ascending);
	gml_const_add("lb_sort_descending",lb_sort_descending);
	gml_const_add("lb_disp_none",lb_disp_none);
	gml_const_add("lb_disp_numeric",lb_disp_numeric);
	gml_const_add("lb_disp_time_sec",lb_disp_time_sec);
	gml_const_add("lb_disp_time_ms",lb_disp_time_ms);
	gml_const_add("ugc_result_success",ugc_result_success);
	gml_const_add("ugc_filetype_community",ugc_filetype_community);
	gml_const_add("ugc_filetype_microtrans",ugc_filetype_microtrans);
	gml_const_add("ugc_visibility_public",ugc_visibility_public);
	gml_const_add("ugc_visibility_friends_only",ugc_visibility_friends_only);
	gml_const_add("ugc_visibility_private",ugc_visibility_private);
	gml_const_add("ugc_query_RankedByVote",ugc_query_RankedByVote);
	gml_const_add("ugc_query_RankedByPublicationDate",ugc_query_RankedByPublicationDate);
	gml_const_add("ugc_query_AcceptedForGameRankedByAcceptanceDate",ugc_query_AcceptedForGameRankedByAcceptanceDate);
	gml_const_add("ugc_query_RankedByTrend",ugc_query_RankedByTrend);
}

#define __lnc_const_decl_f14
/// __lnc_const_decl_f14()
if (live_enabled) {
	gml_const_add("ugc_query_FavoritedByFriendsRankedByPublicationDate",ugc_query_FavoritedByFriendsRankedByPublicationDate);
	gml_const_add("ugc_query_CreatedByFriendsRankedByPublicationDate",ugc_query_CreatedByFriendsRankedByPublicationDate);
	gml_const_add("ugc_query_RankedByNumTimesReported",ugc_query_RankedByNumTimesReported);
	gml_const_add("ugc_query_CreatedByFollowedUsersRankedByPublicationDate",ugc_query_CreatedByFollowedUsersRankedByPublicationDate);
	gml_const_add("ugc_query_NotYetRated",ugc_query_NotYetRated);
	gml_const_add("ugc_query_RankedByTotalVotesAsc",ugc_query_RankedByTotalVotesAsc);
	gml_const_add("ugc_query_RankedByVotesUp",ugc_query_RankedByVotesUp);
	gml_const_add("ugc_query_RankedByTextSearch",ugc_query_RankedByTextSearch);
	gml_const_add("ugc_sortorder_CreationOrderDesc",ugc_sortorder_CreationOrderDesc);
	gml_const_add("ugc_sortorder_CreationOrderAsc",ugc_sortorder_CreationOrderAsc);
	gml_const_add("ugc_sortorder_TitleAsc",ugc_sortorder_TitleAsc);
	gml_const_add("ugc_sortorder_LastUpdatedDesc",ugc_sortorder_LastUpdatedDesc);
	gml_const_add("ugc_sortorder_SubscriptionDateDesc",ugc_sortorder_SubscriptionDateDesc);
	gml_const_add("ugc_sortorder_VoteScoreDesc",ugc_sortorder_VoteScoreDesc);
	gml_const_add("ugc_sortorder_ForModeration",ugc_sortorder_ForModeration);
	gml_const_add("ugc_list_Published",ugc_list_Published);
	gml_const_add("ugc_list_VotedOn",ugc_list_VotedOn);
	gml_const_add("ugc_list_VotedUp",ugc_list_VotedUp);
	gml_const_add("ugc_list_VotedDown",ugc_list_VotedDown);
	gml_const_add("ugc_list_WillVoteLater",ugc_list_WillVoteLater);
	gml_const_add("ugc_list_Favorited",ugc_list_Favorited);
	gml_const_add("ugc_list_Subscribed",ugc_list_Subscribed);
	gml_const_add("ugc_list_UsedOrPlayed",ugc_list_UsedOrPlayed);
	gml_const_add("ugc_list_Followed",ugc_list_Followed);
	gml_const_add("ugc_match_Items",ugc_match_Items);
	gml_const_add("ugc_match_Items_Mtx",ugc_match_Items_Mtx);
	gml_const_add("ugc_match_Items_ReadyToUse",ugc_match_Items_ReadyToUse);
	gml_const_add("ugc_match_Collections",ugc_match_Collections);
	gml_const_add("ugc_match_Artwork",ugc_match_Artwork);
	gml_const_add("ugc_match_Videos",ugc_match_Videos);
	gml_const_add("ugc_match_Screenshots",ugc_match_Screenshots);
	gml_const_add("ugc_match_AllGuides",ugc_match_AllGuides);
}

#define __lnc_const_decl_f15
/// __lnc_const_decl_f15()
if (live_enabled) {
	gml_const_add("ugc_match_WebGuides",ugc_match_WebGuides);
	gml_const_add("ugc_match_IntegratedGuides",ugc_match_IntegratedGuides);
	gml_const_add("ugc_match_UsableInGame",ugc_match_UsableInGame);
	gml_const_add("ugc_match_ControllerBindings",ugc_match_ControllerBindings);
	gml_const_add("vertex_usage_position",vertex_usage_position);
	gml_const_add("vertex_usage_colour",vertex_usage_colour);
	gml_const_add("vertex_usage_normal",vertex_usage_normal);
	gml_const_add("vertex_usage_textcoord",vertex_usage_textcoord);
	gml_const_add("vertex_usage_blendweight",vertex_usage_blendweight);
	gml_const_add("vertex_usage_blendindices",vertex_usage_blendindices);
	gml_const_add("vertex_usage_psize",vertex_usage_psize);
	gml_const_add("vertex_usage_tangent",vertex_usage_tangent);
	gml_const_add("vertex_usage_binormal",vertex_usage_binormal);
	gml_const_add("vertex_usage_fog",vertex_usage_fog);
	gml_const_add("vertex_usage_depth",vertex_usage_depth);
	gml_const_add("vertex_usage_sample",vertex_usage_sample);
	gml_const_add("vertex_type_float1",vertex_type_float1);
	gml_const_add("vertex_type_float2",vertex_type_float2);
	gml_const_add("vertex_type_float3",vertex_type_float3);
	gml_const_add("vertex_type_float4",vertex_type_float4);
	gml_const_add("vertex_type_colour",vertex_type_colour);
	gml_const_add("vertex_type_ubyte4",vertex_type_ubyte4);
}

#define __lnc_const_decl
/// __lnc_const_decl()
if (live_enabled) {
	__lnc_const_decl_f0();
	__lnc_const_decl_f1();
	__lnc_const_decl_f2();
	__lnc_const_decl_f3();
	__lnc_const_decl_f4();
	__lnc_const_decl_f5();
	__lnc_const_decl_f6();
	__lnc_const_decl_f7();
	__lnc_const_decl_f8();
	__lnc_const_decl_f9();
	__lnc_const_decl_f10();
	__lnc_const_decl_f11();
	__lnc_const_decl_f12();
	__lnc_const_decl_f13();
	__lnc_const_decl_f14();
	__lnc_const_decl_f15();
}
