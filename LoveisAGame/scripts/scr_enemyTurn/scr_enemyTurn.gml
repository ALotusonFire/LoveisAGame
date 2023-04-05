// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemyTurn(){
	oDarkness.image_index = 1;
	layer_set_visible("BulletHell", true);
	oPlayer_Battle.state = stateFree
	
	execute after 1.5 seconds
	switch (oGameController.currentEnemy) {
		
		case "Bob":
			scr_BobAttacks()
		break;
		
		case "Enemy2":
		
		break;
	}
	
	done
}