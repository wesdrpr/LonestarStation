/obj/mecha/combat/gygax
	desc = "A lightweight, security exosuit. Popular among private and corporate security."
	name = "Gygax"
	icon_state = "gygax"
	initial_icon = "gygax"
	step_in = 3
	dir_in = 1 //Facing North.
	health = 250
	maxhealth = 250			//Don't forget to update the /old variant if  you change this number.
	deflect_chance = 15
	max_temperature = 25000
	infra_luminosity = 6
	wreckage = /obj/effect/decal/mecha_wreckage/gygax
	internal_damage_threshold = 35
	max_equip = 3

	max_hull_equip = 1
	max_weapon_equip = 2
	max_utility_equip = 2
	max_universal_equip = 1
	max_special_equip = 1

	starting_components = list(
		/obj/item/mecha_parts/component/hull/lightweight,
		/obj/item/mecha_parts/component/actuator,
		/obj/item/mecha_parts/component/armor/marshal,
		/obj/item/mecha_parts/component/gas,
		/obj/item/mecha_parts/component/electrical
		)

	overload_possible = 1

	icon_scale_x = 1.35
	icon_scale_y = 1.35

//Not quite sure how to move those yet.
/obj/mecha/combat/gygax/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='?src=\ref[src];toggle_leg_overload=1'>Toggle leg actuators overload</a>
						</div>
						</div>
						"}
	output += ..()
	return output


/obj/mecha/combat/gygax/dark
	desc = "A lightweight exosuit used by Heavy Asset Protection. A significantly upgraded Gygax security mech."
	name = "Dark Gygax"
	icon_state = "darkgygax"
	initial_icon = "darkgygax"
	health = 400
	maxhealth = 400
	deflect_chance = 25
	max_temperature = 45000
	overload_coeff = 1
	wreckage = /obj/effect/decal/mecha_wreckage/gygax/dark
	max_equip = 4
	step_energy_drain = 5
	mech_faction = MECH_FACTION_SYNDI

	max_hull_equip = 1
	max_weapon_equip = 2
	max_utility_equip = 2
	max_universal_equip = 1
	max_special_equip = 2

	starting_equipment = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/grenade/clusterbang,
		/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay,
		/obj/item/mecha_parts/mecha_equipment/teleporter
		)

/obj/mecha/combat/gygax/dark/add_cell(var/obj/item/cell/C=null)
	if(C)
		C.forceMove(src)
		cell = C
		return
	cell = new /obj/item/cell/hyper(src)

//Meant for random spawns.
/obj/mecha/combat/gygax/old
	desc = "A lightweight, security exosuit. Popular among private and corporate security. This one is particularly worn looking and likely isn't as sturdy."

/obj/mecha/combat/gygax/old/Initialize()
	. = ..()
	health = 25
	maxhealth = 250	//Just slightly worse.
	cell.charge = rand(0, (cell.charge/2))