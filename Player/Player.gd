extends CharacterBody2D

@export var base_speed = 300
@export var hp = 100

var touching_enemies : Array[Enemy] = []

func _physics_process(delta):
	velocity = Input.get_vector("p_move_left","p_move_right", "p_move_up","p_move_down") * base_speed

	move_and_slide()
	
	print("player: ", hp)

func _on_enemy_collider_area_entered(area: Area2D):
	var body = area.get_parent()
	
	touching_enemies.append(body)


func _on_enemy_collider_area_exited(area: Area2D):
	var body = area.get_parent()
	
	touching_enemies.erase(body)

func take_damage():
	for e in touching_enemies:
		hp -= e.damage_per_tick


func _on_damage_timer_timeout():
	take_damage()
