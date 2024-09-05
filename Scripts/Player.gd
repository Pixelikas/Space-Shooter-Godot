extends Sprite

var bullet = preload("res://Scenes/Player_Bullet.tscn")
var particles = preload("res://Scenes/Player_destroy_particles.tscn")

var can_shoot = true

signal create_bullet(bullet, location)

func _ready():
	global_position.y = get_viewport().get_mouse_position().y


func _process(_delta):
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.25)

	if Input.is_action_just_pressed("shoot") and can_shoot:
		emit_signal("create_bullet", bullet, global_position)
		$Reload_timer.start()
		can_shoot = false


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy"):
		area.get_parent().queue_free()
		emit_signal("create_bullet", particles, global_position)
		queue_free()


func _on_Reload_timer_timeout():
	can_shoot = true
	$Reload_timer.stop()
	
