// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_EnemyFlicker(){
	
oEnemyBattle.image_alpha = 0
execute after 0.2 seconds
	oEnemyBattle.image_alpha = 1
	execute after 0.2 seconds
	oEnemyBattle.image_alpha = 0
		execute after 0.2 seconds
		oEnemyBattle.image_alpha = 1
			execute after 0.2 seconds
			oEnemyBattle.image_alpha = 0
				execute after 0.2 seconds
				oEnemyBattle.image_alpha = 1
				done
			done
		done
	done
done

}