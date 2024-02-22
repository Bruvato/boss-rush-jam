class_name Enemy
extends CharacterBody2D

@export var speed: float = 50
@export var accel: float = 5

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

@onready var health_component: HealthComponent = $"Health Component"

@onready var hurtbox_component: HurtBoxComponent = $"HurtboxComponent"
@onready var hitbox_component: HitboxComponent = $"HitboxComponent"

@onready var flash_component: FlashComponent = $FlashComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var shake_component: ShakeComponent = $ShakeComponent

@onready var destroy_component: DestroyComponent = $DestroyComponent


func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
		flash_component.flash()
		scale_component.tween_scale()
		shake_component.tween_shake()
		)
	
	hitbox_component.hit_hurtbox.connect(destroy_component.destroy.unbind(1))

func _physics_process(delta: float) -> void:
	var direction: Vector2 = position.direction_to(player.global_position)

	velocity.x = move_toward(velocity.x, direction.x * speed, accel)
	velocity.y = move_toward(velocity.y, direction.y * speed, accel)

	move_and_slide()
	look_at(player.global_position)

