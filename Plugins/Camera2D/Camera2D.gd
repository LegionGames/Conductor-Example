extends Camera2D

const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT

var amplitude = 0
var priority = 0	


func shake(duration = 0.2, frequency = 15, amplitude = 2, priority = 0):
	if priority >= self.priority:
		self.priority = priority 
		self.amplitude = amplitude
		
		$Duration.wait_time = duration
		$Frequency.wait_time = 1 / float(frequency)
		$Duration.start()
		$Frequency.start()
		
		_shake()


func _shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	
	$Tween.interpolate_property(self, "offset", offset, rand, 
				$Frequency.wait_time, TRANS, EASE)
	$Tween.start()


func _on_Frequency_timeout():
	_shake()


func _reset():
	$Tween.interpolate_property(self, "offset", offset, Vector2(), 
				$Frequency.wait_time, TRANS, EASE)
	$Tween.start()
	priority = 0


func _on_Duration_timeout():
	_reset()
	$Frequency.stop()
