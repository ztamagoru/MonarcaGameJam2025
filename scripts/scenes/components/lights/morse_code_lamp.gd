extends Node3D

@export var message : String
@onready var lamp : SpotLight3D = $Lamp
@onready var timer : Timer = $MorseTimer

var sequence = []
var step : int = 0

func _ready():
	start_morse()

var morse_map = {
	"A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".",
	"F": "..-.", "G": "--.", "H": "....", "I": "..", "J": ".---",
	"K": "-.-", "L": ".-..", "M": "--", "N": "-.", "O": "---",
	"P": ".--.", "Q": "--.-", "R": ".-.", "S": "...", "T": "-",
	"U": "..-", "V": "...-", "W": ".--", "X": "-..-", "Y": "-.--",
	"Z": "--..", "0": "-----", "1": ".----", "2": "..---", "3": "...--",
	"4": "....-", "5": ".....", "6": "-....", "7": "--...", "8": "---..",
	"9": "----.", ".": ".-.-.-", ",": "--..--", "?": "..--..", "!": "-.-.--",
	":": "---...", ";": "-.-.-.", "=": "-...-", "+": ".-.-.", "-": "-....-",
	"/": "-..-.", "@": ".--.-.", "(": "-.--.", ")": "-.--.-", "&": ".-...",
	"\"": ".-..-.", "'": ".----.", "$": "...-..-", "_": "..--.-"
}

func start_morse():
	build_sequence(message)
	step = 0
	_next_step()

func _next_step():
	if step >= sequence.size():
		step = 0
	
	var part = sequence[step]
	
	lamp.visible = part.on
	timer.start(part.duration * 0.2)
	
	step += 1

func build_sequence(text : String):
	sequence.clear()
	
	var upper_text = text.to_upper()
	
	for i in upper_text:
		if i == " ":
			sequence.append({"duration": 7, "on": false})
			continue
		
		var code = morse_map.get(i, "")
		
		for j in code:
			var dur : float = 1.0 if j == "." else 3.0
			
			sequence.append({"duration": dur, "on": true})
			sequence.append({"duration": 1.0, "on": false})
		
		sequence.append({"duration": 2.0, "on": false})

func _on_morse_timer_timeout() -> void:
	_next_step()
