extends Sprite

var speed = 50

var particles = preload("res://Scenes/Enemy_destroy_particles.tscn") 

signal create_enemy_destroy_particles(particles, location)

func _ready():
	if Global.world != null:
		connect("create_enemy_destroy_particles", Global.world, "_on_Create_enemy_destroy_particles")

func _process(delta):
	global_position.x -= speed * delta

	if global_position.x < -20:
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		emit_signal("create_enemy_destroy_particles", particles, global_position)
		area.get_parent().queue_free()
		queue_free()
