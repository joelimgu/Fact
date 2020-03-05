extends Sprite

func _ready():
	pass

func _physics_process(delta):
	get_parent().set_offset(get_parent().get_offset() + (50*delta))
