// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerTurn(){
	
	//Reset Positions
	oFrame.image_xscale = 0.1
	oFrame.image_yscale = 0.1
	oPlayer_Battle.x = 672
	oPlayer_Battle.y = 416
	oDarkness.image_index = 0;
	oFrame.growing = true
	
	
	layer_set_visible("BulletHell", false);
	oPlayer_Battle.state = statePaused
}