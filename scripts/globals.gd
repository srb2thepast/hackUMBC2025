extends Node

enum States {
	Dialouging,
	Arcading,
	Moving,
	Standing,
	Idle
}


var assests = {}

var late_assests = {}

func getDependency(location):
	if not location in assests:
		print("[color=yellow]--- ERROR!!! DPCY " + location + " NOT FOUND!!!!" )
		print(assests)
	print("acesssing " + str(assests[location]) + "for location " + location)
	return assests[location]
	
func setDependency(location:String,value):
	if location in assests:
		print("[color=yellow]--- WARNING: DEPEDENCY" + str(location) + "ALREADY DEFINED!!! overwriting...")
	assests[location] = value

	
func getLateDependency(location):	
	if not location in late_assests:
		print("[color=yellow]--- ERROR!!! DPCY LATE " + location + " NOT FOUND!!!!" )
		print(late_assests)
	print("acesssing late " + str(late_assests[location]) + "for location " + location)
	return late_assests[location]


func setLateDependency(location:String,value):
	if location in late_assests:
		print("[color=yellow]--- WARNING: LATE DEPEDENCY" + str(location) + "ALREADY DEFINED!!! overwriting...")
	late_assests[location] = value
	
