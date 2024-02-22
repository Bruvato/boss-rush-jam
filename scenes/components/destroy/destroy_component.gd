class_name DestroyComponent
extends Node

@export var node: Node2D

@export var health_component: HealthComponent

@export var spawner_component: SpawnerComponent

@onready var particles: Node = get_node("/root/Game/Particles") 


func _ready() -> void:
	if !health_component: return
	
	health_component.no_health.connect(func(): 
		destroy()
		)

func destroy():
	spawner_component.spawn(node.global_position, node.global_rotation, particles)
	node.queue_free()
