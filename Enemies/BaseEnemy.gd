class_name Enemy
extends CharacterBody2D

@export var speed = 200
@export var damage_per_tick = 1
@export var hp = 10

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	if position.distance_to(player.position) > 1:
		velocity = position.direction_to(player.position) * speed

		move_and_slide()
	
		print("enemy: ", hp)

func take_damage(amount: float):
	hp -= amount
