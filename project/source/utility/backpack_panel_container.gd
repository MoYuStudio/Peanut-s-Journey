
extends PanelContainer

func _get_drag_data(at_position):

	if has_node('Sprite2D'):
		var preview_texture = TextureRect.new()
		preview_texture.texture = $Sprite2D.texture
		preview_texture.scale = $Sprite2D.scale
		preview_texture.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		set_drag_preview(preview_texture)
		return $Sprite2D

func _can_drop_data(at_position, data):
	return true
	pass
	
func _drop_data(at_position, data):
	if data and !has_node('Sprite2D'):
		self.add_child(data.duplicate())
		# data.queue_free()
