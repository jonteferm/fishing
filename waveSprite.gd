extends Sprite2D

func _process(_delta):
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(self.position.x, self.position.y+10), 1)
