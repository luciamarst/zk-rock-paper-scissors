pragma circom 2.0.0;

template piedra_papel_tijera () autocomplete{

	//Rock -> 0, Paper-> 1, Scissors->2
	signal input jugador1;//Player1
	signal input jugador2;//Player2
	signal output ganador;//Winner, 0-> Player1 ; 1->Player2, 2 -> Dead heat

	if(jugador1 == jugador2){ //Dead heat
		ganador <-- 2;
	}
	else if(jugador2 == 0 && jugador1 == 2){ //P2 wins with rock
		ganador <--1;
	}
	else if(jugador1 == 0 && jugador2 == 2){ //P1 wins with rock
		ganador <--0;
	}
	else if(jugador2 == 2 && jugador1 == 1){ //P2 wins with scissors 
		ganador <--1;
	}
	else if(jugador1 == 2 && jugador2 == 1){ //P1 wins with scissors 
		ganador <-- 0;
	}
	else if(jugador2 == 1 && jugador1 == 0){ //P2 wins with paper 
		ganador <--1;
	}
	else if(jugador1 == 1 && jugador2 == 0){ //P1 wins with paper 
		ganador <-- 0;
	}
	else{
		ganador <-- 3; //NO valid result (no previous combination happens)
	}
}	


component main = piedra_papel_tijera();
	



	
