/mob/living/silicon/robot/Process_Spacemove(var/movement_dir = 0)
	if(ionpulse())
		return 1
	if(..())
		return 1
	return 0

 //No longer needed, but I'll leave it here incase we plan to re-use it.
/mob/living/silicon/robot/movement_delay()
	var/tally = 0 //Incase I need to add stuff other than "speed" later

	tally = speed
	if(pulling)
		tally += pulling.calculate_movedelay()
	if(module_active && istype(module_active,/obj/item/borg/combat/mobility))
		tally-=3

	return tally+config.robot_delay

/mob/living/silicon/robot/Moved()
	. = ..()
	if(riding_datum)
		riding_datum.on_vehicle_move()

/mob/living/silicon/robot/mob_negates_gravity()
	return magpulse

/mob/living/silicon/robot/mob_has_gravity()
	return ..() || mob_negates_gravity()

/mob/living/silicon/robot/experience_pressure_difference(pressure_difference, direction)
	if(!magpulse)
		return ..()