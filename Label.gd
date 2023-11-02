extends Label

var time = 0
var timer_on = false

func _process(delta):
	if timer_on:
		time += delta
	
	var mil = fmod(time, 1)*1000
	var sec = fmod(time,60)
	var mins = fmod(time, 60*60)/60
	
	var _passed_time = "%02d  : %02d"  % [mins, sec]
	text = _passed_time

func timer(x):
	timer_on = x
