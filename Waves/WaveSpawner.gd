extends Node2D

@onready var spawnable: Array[PackedScene] = [
	preload("res://Waves/BaseEnemyWave.tscn")
]
@onready var camera = get_viewport().get_camera_2d()
@onready var viewport_size = camera.get_viewport_rect().size

func _ready():
	spawn()
	$WaveTimer.start()

func _process(delta):
	pass

func _on_wave_timer_timeout():
	spawn()
	
func spawn():
	for s in spawnable:
		var new = s.instantiate()
		new.position = _get_spawn_position(new)
		get_node("../").add_child(new)
		
func _get_spawn_position(wave):
	var rand_x = randi_range(0, viewport_size.x)
	var rand_y = randi_range(0, viewport_size.y)
	match randi_range(0, 3):
		0:
			# top
			return Vector2(rand_x, 0)
		1:
			# right
			return Vector2(viewport_size.x, rand_y)
		2:
			# botton
			return Vector2(rand_x, viewport_size.y)
		3:
			# left
			return Vector2(0, rand_y)
		
