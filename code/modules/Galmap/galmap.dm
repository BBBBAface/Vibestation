
// Registers a new Z-level for galmap

#ifdef MAP_GALMAP
#include "maps/z2_galmap.dmm"
#include "poi/poi.dm"
#endif

/datum/controller/subsystem/galmap
	name = "Galactic Map"
	init_order = SS_INIT_MAP_GENERATION
	flags = SS_NO_TICK

	var/list/poi_types = list(
		/datum/galmap_poi/asteroid_field,
		/datum/galmap_poi/derelict_satellite
	)

	var/z_level = 2
	var/spacing = 10 // min distance between POIs

/datum/controller/subsystem/galmap/Initialize()
	var/list/placed = list()
	var/max_attempts = 500
	var/tries = 0

	while (placed.len < 15 && tries++ < max_attempts)
		var/datum/galmap_poi/type = pick(poi_types)
		var/datum/galmap_poi/poi = new type()
		var/x = rand(1, world.maxx - poi.width)
		var/y = rand(1, world.maxy - poi.height)

		var/ok = TRUE
		for (var/area in placed)
			var/rect = area
			if (rect["x1"] <= x + poi.width && rect["x2"] >= x &&
				rect["y1"] <= y + poi.height && rect["y2"] >= y)
				ok = FALSE
				break

		if (!ok)
			continue

		var/turf/T = locate(x, y, z_level)
		if (T)
			poi.generate(T)
			placed += list(list("x1"=x, "x2"=x+poi.width, "y1"=y, "y2"=y+poi.height))

	log_world("Placed [placed.len] POIs on galmap")
	return ..()


