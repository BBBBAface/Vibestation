/datum/galmap_poi/asteroid_field
	name = "Asteroid Field"
	width = 6
	height = 6

/generate(loc)
	spawn_box(loc, "asteroid")
	return

/datum/galmap_poi/derelict_satellite
	name = "Derelict Satellite"
	width = 1
	height = 1

/generate(loc)
	var/turf/T = locate(loc.x + 1, loc.y + 1, loc.z)
	if (T)
		new /obj/galmap/sat(T)