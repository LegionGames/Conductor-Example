extends Node2D

func _on_Start_Button_button_down():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 
								linear2db($HSlider.value))
	if get_tree().change_scene("res://Scenes/Game.tscn") != OK:
		print ("Error changing scene to Game")


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),
								linear2db(value))


func _on_TextureButton_pressed():
	$TextureButton/AudioStreamPlayer.play()
