pragma circom 2.0.0;
include "circomlib/circuits/comparators.circom";


template igualdadRepetida(val){
	signal input in;
	signal output out;

	component cmp = IsEqual();
	cmp.in[0] <== in;
	cmp.in[1] <== val;
	out <== cmp.out;
}

template piedra_papel_tijera (){

	//Rock -> 0, paper-> 1, scissors->2
	signal input jugador1;//Player 1
	signal input jugador2;//Player2
	signal output ganador;//Winner, 0-> player1 ; 1->player2, 2 -> dead heat

	signal eq;
	signal inv;
	signal out;
	signal j1 ;
	signal j2;	
	 
	
	//Player1 with rock
	component J1_0 = igualdadRepetida(0);
	J1_0.in <== jugador1; 
	
	//Player1 with paper
	component J1_1 = igualdadRepetida(1);
	J1_1.in <== jugador1;

	//Player1 with scissors
	component J1_2 = igualdadRepetida(2);
	J1_2.in <== jugador1;

	//Player2 with rock
	component J2_0 = igualdadRepetida(0);
	J2_0.in <== jugador2;

	//Player2 with paper
	component J2_1 = igualdadRepetida(1);
	J2_1.in <== jugador2;

	//Player2 with scissors
	component J2_2 = igualdadRepetida(2);
	J2_2.in <== jugador2;


	//Dead heat
	signal eq0;
	signal eq1;
	signal eq2;

	eq0 <== (J1_0.out) * (J2_0.out);
	eq1 <== (J1_1.out) * (J2_1.out);
	eq2 <== (J1_2.out) * (J2_2.out);  
	eq <== eq0 + eq1 + eq2;       
	
	//If dead heat, then inv -> 0, if not inv-> 1        
        inv <== (1 - eq);


	//P1 only wins if any of these conditions are true:
	signal j1_0;
	signal j1_1;
	signal j1_2;

	j1_0 <== (J1_0.out) * (J2_2.out) ;
	j1_1 <== (J1_1.out) * (J2_0.out) ;
	j1_2 <== (J1_2.out) * (J2_1.out);

	j1 <== j1_0 + j1_1 + j1_2;
	

	//P2 only wins if any of these conditions are true:
	signal j2_0;
	signal j2_1;
	signal j2_2;

	j2_0 <== (J1_0.out) * (J2_1.out);
	j2_1 <== (J1_1.out) * (J2_2.out);
	j2_2 <== (J1_2.out) * (J2_0.out);

	j2 <== j2_0 + j2_1 + j2_2;
	
	//Final constraint to know the result
	out <== (j2 * 1) + (j1 * 0); //Se puede simplificar
	
	ganador <== ((1-inv) * 2) + (out * inv);
}	


component main = piedra_papel_tijera();
	



	
