class_name Enemy
extends CharacterBody2D

@export var speed = 200
@export var damage_per_tick = 1
@export var hp = 1

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	if position.distance_to(player.position) > 1:
		velocity = global_position.direction_to(player.position) * speed
		move_and_slide()

func take_damage(amount: float):
	hp -= amount
	
	if hp <= 0:
		die()
		
func die():
	queue_free()
