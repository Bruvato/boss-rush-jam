class_name KnockbackComponent
extends Node

@export var knockback_force: float = 100

@export var enemy: CharacterBody2D
@export var hurtbox_component: HurtBoxComponent

func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		#print_debug(character_move_component.velocity)
		enemy.velocity = hitbox.global_position.direction_to(hurtbox_component.global_position) * knockback_force
		#print_debug(character_move_component.velocity)
		)
