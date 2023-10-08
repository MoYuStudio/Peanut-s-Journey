
extends Node

var fullscreen = true

var night_node = true

func _ready():
	DisplayServer.window_set_title("花生迷途 Peanut's Journey")
	
	# print(DisplayServer.window_get_vsync_mode(0))
	# DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	# print(DisplayServer.window_get_vsync_mode(0))
	
	DisplayServer.window_set_size(Vector2(1280,720))
	DisplayServer.window_set_position(Vector2(100,100))
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	# DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
	
	pass

func _physics_process(delta):
	# print(Engine.get_frames_per_second())
	pass
	
