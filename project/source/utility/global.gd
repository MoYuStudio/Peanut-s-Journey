
extends Node

var fullscreen = true

var night_node = false

var window_mode_list = [DisplayServer.WINDOW_MODE_WINDOWED,
						DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN,
						DisplayServer.WINDOW_MODE_FULLSCREEN,
						DisplayServer.WINDOW_MODE_MINIMIZED,
						DisplayServer.WINDOW_MODE_MAXIMIZED
						]
var window_size_list = [[1920,1080],[1280,720],[360,180]]

var window_vsync_mode_list = []

var setting_dict = {
	
		'window_mode':0,
		'window_size':1,
		'window_vsync_mode':0,
		
	}
	
var player_dict = {
	# 玩家信息
	'money':10000.0,
	'hp':100000,
	# 基础升级
	'hp_max':100,
	'hp_auto_add':0,
	'grab_area_size':256,
	'hit_damage':10,
	'money_drop':50,
	'money_multiple':1.0,
	# 统计信息
	'total_money':0,
	'kill':0,
	'wall':0,
}

func _ready():

	DisplayServer.window_set_title("花生迷途 Peanut's Journey")
	
	Engine.set_max_fps(60)
	
	# print(DisplayServer.window_get_vsync_mode(0))
	# DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	# print(DisplayServer.window_get_vsync_mode(0))
	if load_data('setting') != null:
		setting_dict = load_data('setting')
		setting_set()
		DisplayServer.window_set_position(Vector2(100,100))
	
	# save_data('game_save',save_dict)
	# print(load_data('game_save'))
	
	pass

func _physics_process(delta):
	# print(Engine.get_frames_per_second())
	pass
	
func save_data(slot_name,data):
	var file = FileAccess.open('data/'+str(slot_name)+'.moyudata', FileAccess.WRITE)
	var json_str = JSON.stringify(data)
	file.store_line(json_str)
	
func load_data(slot_name):
	var path = 'data/'+str(slot_name)+'.moyudata'
	var data = {}
	if not FileAccess.file_exists(path):
		return
	var file = FileAccess.open(path, FileAccess.READ)
	while file.get_position() < file.get_length():
		var json_str = file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_str)
		data = json.get_data()
	return data

func setting_set():
	DisplayServer.window_set_mode(window_mode_list[setting_dict['window_mode']])
	DisplayServer.window_set_size(Vector2(window_size_list[setting_dict['window_size']][0],window_size_list[setting_dict['window_size']][1]))
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	save_data('setting',setting_dict)
