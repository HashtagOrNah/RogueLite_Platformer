extends Position2D

func _on_SceneToScene_body_entered(body):
	get_parent().get_node("SceneCamera").position = self.position
