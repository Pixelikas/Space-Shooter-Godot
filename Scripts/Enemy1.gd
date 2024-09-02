extends Sprite

var speed = 50

func _process(delta):
	global_position.x -= speed * delta


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		area.get_parent().queue_free()
		queue_free()
