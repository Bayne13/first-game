extends Node

export (PackedScene) var mob_scene
#c
func _ready():
	randomize()

func _on_MobTimer_timeout():
	var mob_spawn_location = $"MobPath/MobSpawnLocation"
	mob_spawn_location.offset = randi()

	var mob = mob_scene.instance()
	add_child(mob)

	var direction = mob_spawn_location.rotation + PI / 2

	mob.position = mob_spawn_location.position

	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction

	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)
