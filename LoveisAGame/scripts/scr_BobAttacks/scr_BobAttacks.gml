// Enemy "Bob" (Placeholder) attacks! What will it use?

function scr_BobAttacks(){
	var atk = 1 //irandom_range(1,3);
		switch (atk) {
			case 1:
				BAttack1();
			break;
			case 2:
				BAttack2();
			break;
			case 3:
				BAttack3();
			break;
		}
}

function BAttack1(){
	
	instance_create_layer(1200, 100, "Attacks", oFireSpawner)
	instance_create_layer(1330, 500, "Attacks", oFireSpawner)
	
	execute after 10 seconds
	instance_destroy(oFireSpawner)
	instance_destroy(oFireAttack)
		scr_playerTurn();
	done	
}

function BAttack2(){
	execute after 3 seconds
		scr_playerTurn();
	done
}

function BAttack3(){
	execute after 3 seconds
		scr_playerTurn();
	done
}