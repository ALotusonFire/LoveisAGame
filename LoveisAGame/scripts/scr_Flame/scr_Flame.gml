// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Flame(){
	show_debug_message("Flame!")
	
	execute after 2 seconds
		scr_enemyTurn()
	done
}