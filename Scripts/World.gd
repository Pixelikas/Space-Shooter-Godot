extends Node2D

func _on_Player_create_bullet(bullet, location):
	var bullet_instance = bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = location

func _on_Enemy_generator_create_enemy(enemy, location):
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.global_position = location
