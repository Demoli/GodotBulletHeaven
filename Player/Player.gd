extends CharacterBody2D

@onready var move_speed = $PlayerStats.move_speed
@onready var hp = $PlayerStats.hp

var touching_enemies : Array[Enemy] = []

func _physics_process(delta):
	velocity = Input.get_vector("p_move_left","p_move_right", "p_move_up","p_move_down") * move_speed

	move_and_slide()

func _on_enemy_collider_area_entered(area: Area2D):
	var body = area.get_parent()
	
	touching_enemies.append(body)

func _on_enemy_collider_area_exited(area: Area2D):
	var body = area.get_parent()
	
	touching_enemies.erase(body)

func take_damage():
	for e in touching_enemies:
		hp -= e.damage_per_tick
		if hp <= 0:
			die()

func die():
	queue_free()

func _on_damage_timer_timeout():
	take_damage()
