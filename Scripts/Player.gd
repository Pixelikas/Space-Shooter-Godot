extends KinematicBody2D

var bullet = preload("res://Player_Bullet.tscn")

signal create_bullet(bullet, location)

func _process(delta):
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.25)

	if Input.is_action_just_pressed("shoot"):
		emit_signal("create_bullet", bullet, global_position)
