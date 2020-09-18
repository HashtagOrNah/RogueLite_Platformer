extends Node2D

onready var lvl_path = "res://Level1.tscn"


func _on_Area2D_body_entered(body):
	
	SceneChanger.change_scene(lvl_path)
