extends Node2D

func _ready():
	Global.world = self
	
func _exit_tree():
	Global.world = null

func _on_Create_enemy_destroy_particles(particles, location):
	var particles_instance = particles.instance()
	add_child(particles_instance)
	particles_instance.global_position = location

func _on_Player_create_bullet(bullet, location):
	var bullet_instance = bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = location

func _on_Enemy_generator_create_enemy(enemy, location):
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.global_position = location
