// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemyTurn(){
	oGameController.state = "enemyTurn";
	instance_destroy(oMetaphorObject);
	oDarkness.image_index = 1;
	layer_set_visible("BulletHell", true);
}