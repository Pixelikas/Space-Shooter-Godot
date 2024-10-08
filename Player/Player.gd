extends Sprite

var bullet = preload("res://Player_bullet/Player_Bullet.tscn")
var particles = preload("res://Player/Player_destroy_particles.tscn")

var can_shoot = true
var health = 3

signal instance_node(node, location)

func _ready():
	global_position.y = get_viewport().get_mouse_position().y
	Global.player = self
	
func _exit_tree():
	 Global.player = null

func _process(_delta):
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.25)

	if Input.is_action_just_pressed("shoot") and can_shoot:
		emit_signal("instance_node", bullet, global_position)
		$Reload_timer.start()
		can_shoot = false

	if health <= 0:
		emit_signal("instance_node", particles, global_position)
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy"):
		area.get_parent().emit_signal("instance_node", area.get_parent().particles, area.get_parent().global_position)
		area.get_parent().queue_free()
		health -= 1

func _on_Reload_timer_timeout():
	can_shoot = true
	$Reload_timer.stop()
	
