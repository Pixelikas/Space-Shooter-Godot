extends Sprite

var speed = 50

var particles = preload("res://Particles/Enemy_destroy_particles.tscn") 

signal instance_node(particles, location)

func _ready():
	if Global.world != null:
		connect("instance_node", Global.world, "instance_node")

func _process(delta):
	global_position.x -= speed * delta

	if global_position.x < -20:
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		emit_signal("instance_node", particles, global_position)
		area.get_parent().queue_free()
		queue_free()
