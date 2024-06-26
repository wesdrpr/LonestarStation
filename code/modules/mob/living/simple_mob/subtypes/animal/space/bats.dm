/mob/living/simple_mob/animal/space/bats
	name = "razor bats"
	desc = "A swarm of cute little blood sucking bats that look pretty upset."
	tt_desc = "N Bestia gregaria" //Nispean swarm bats, because of course Nisp has swarm bats
	icon = 'icons/mob/bats.dmi'
	icon_state = "bat"
	icon_living = "bat"
	icon_dead = "bat_dead"
	icon_gib = "bat_dead"

	faction = "scarybat"

	maxHealth = 20
	health = 20

	attacktext = list("bitten")
	attack_sound = 'sound/weapons/bite.ogg'

	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	organ_names = /decl/mob_organ_names/smallflying

	harm_intent_damage = 10

	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_sharp = TRUE

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

	has_langs = list("Mouse")

	meat_type = /obj/item/reagent_containers/food/snacks/meat

	say_list_type = /datum/say_list/mouse	// Close enough

	var/scare_chance = 15

/mob/living/simple_mob/animal/space/bats/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(prob(scare_chance))
			L.Stun(1)
			L.visible_message("<span class='danger'>\the [src] scares \the [L]!</span>")

// Spookiest of bats
/mob/living/simple_mob/animal/space/bats/cult
	faction = "cult"
	supernatural = TRUE

/mob/living/simple_mob/animal/space/bats/cult/cultify()
	return

/mob/living/simple_mob/animal/space/bats/cult/strong
	maxHealth = 60
	health = 60
	melee_damage_upper = 10

/datum/category_item/catalogue/fauna/razor_bat
	name = "Nispean Fauna - Razor Bat"
	desc = "These sharp-toothed flying mammalian animals are adapted to the nitrous-oxide rich \
	and hostile jungles of Nisp, and as a result are frighteningly capable of surviving in harsh, \
	even near-airless environments. In high oxygen environments, these bats can reach the size \
	of a human head, though they struggle to thrive in low temperatures without proper shelter.\
	<br><br>\
	The Razor Bat is exclusively carnivorous, feeding on the blood of prey of all sizes by inflicting\
	cuts with its eponymous razor-sharp fangs, an act which often proves fatal to smaller targets.\
	Remarkably, the bat can survive up to a week without feeding, though underfed specimens are \
	notoriously aggressive.\
	<br><br>\
	With the human colonisation of Kess-Gendar, the Razor Bat gained a bad habit of stowing \
	away undetected in the maintenance spaces of ships departing Nisp, and have become a minor\
	invasive pest on several human worlds."
	value = CATALOGUER_REWARD_EASY
