/datum/galmap_poi
	var/name = "Unnamed POI"
	var/width = 5
	var/height = 5

	/// Override this to spawn POI content
	proc/generate(loc)
		// loc is the top-left corner turf
		return

// Example: Spawn turfs or decorations
/datum/galmap_poi/proc/spawn_box(loc, icon_state = "asteroid")
	for (var/x in 0 to width - 1)
		for (var/y in 0 to height - 1)
			var/turf/T = locate(loc.x + x, loc.y + y, loc.z)
			if (T)
				new /turf/open/space/transition(T)
