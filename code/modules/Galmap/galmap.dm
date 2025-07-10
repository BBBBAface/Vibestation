
// Registers a new Z-level for galmap

#ifdef MAP_GALMAP
#include "maps/z2_galmap.dmm"
#endif

/datum/controller/subsystem/galmap
	name = "Galactic Map"
	init_order = SS_INIT_MAP_GENERATION
	flags = SS_NO_TICK

/datum/controller/subsystem/galmap/Initialize()
	var/z_index = 2
	var/x_max = world.maxx
	var/y_max = world.maxy

	for (var/x in 1 to x_max)
		for (var/y in 1 to y_max)
			new /turf/open/space/basic(locate(x, y, z_index))
	
	log_world("Generated galmap at z-level [z_index]")
	return ..()
