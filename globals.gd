extends Node

enum States {
	Dialouging,
	Arcading,
	Moving,
	Standing,
	Idle
}


var assests = {}

func getDependency(location):
	if not location in assests:
		print("--- ERROR!!! DPCY " + location + " NOT FOUND!!!!" )
		print(assests)
	print("acesssing " + str(assests[location]) + "for location " + location)
	return assests[location]
	


func setDependency(location:String,value):
	if location in assests:
		print("--- WARNING: DEPEDENCY" + str(location) + "ALREADY DEFINED!!! overwriting...")
	assests[location] = value
