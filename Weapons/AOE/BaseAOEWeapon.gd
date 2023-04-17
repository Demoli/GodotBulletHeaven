class_name AOEWeapon
extends Area2D

@export var fire_cooldown := 1.0
@export var damage_per_tick := 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_fire_cooldown(fire_cooldown)
	$FireTimer.start()

func set_fire_cooldown(fire_cooldown: float):
	self.fire_cooldown = fire_cooldown
	$FireTimer.wait_time = fire_cooldown
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_fire_timer_timeout():
	apply_damage()
	
func apply_damage():
	for e in get_overlapping_areas().filter(func(a: Area2D): return a.get_parent() is Enemy):
		e.get_parent().take_damage(damage_per_tick)
