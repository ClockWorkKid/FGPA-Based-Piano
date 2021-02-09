module piano(switches, clk, speaker);

input [35:0] switches; // Piano keys for 36 notes
input clk;
output [35:0] speaker; // Speakers for 36 different notes
reg [35:0] flipper; // 36 1-bit flip-flops for each note  

parameter m=1; // base clock frequency of system
parameter n=20;

// 36 individual toggle frequencies of each note for 1MHz clock 
parameter C3=3822,C3_s=3608,D3=3405,D3_s=3214,E3=3034,F3=2864,F3_s=2703,G3=2551,G3_s=2408,A3=2273,A3_s=2145,B3=2025;
parameter C4=1911,C4_s=1804,D4=1703,D4_s=1607,E4=1517,F4=1432,F4_s=1351,G4=1276,G4_s=1204,A4=1136,A4_s=1073,B4=1012;
parameter C5= 956,C5_s= 902,D5= 851,D5_s= 804,E5= 758,F5= 716,F5_s= 676,G5= 638,G5_s= 602,A5= 568,A5_s= 536,B5= 506;

// Pulse counters for 36 different notes
reg [n:0] counterC3,counterC3_s,counterD3,counterD3_s,counterE3,counterF3,counterF3_s,counterG3,counterG3_s,counterA3,counterA3_s,counterB3;
reg [n:0] counterC4,counterC4_s,counterD4,counterD4_s,counterE4,counterF4,counterF4_s,counterG4,counterG4_s,counterA4,counterA4_s,counterB4;
reg [n:0] counterC5,counterC5_s,counterD5,counterD5_s,counterE5,counterF5,counterF5_s,counterG5,counterG5_s,counterA5,counterA5_s,counterB5;

// Flip-floop passes note frequency through speaker only when key is pressed

assign speaker[29:6] = switches[29:6]&flipper[29:6];
// Overloading some pins due to output pin shortage
assign speaker[35:30] = switches[35:30]&flipper[35:30] | switches[5:0]&flipper[5:0];


always @(posedge clk) begin
 
// Each if-else block is a note frequency generator one
	// Note C3
	if(counterC3==m*C3) begin
		counterC3 <= 0; // Counter reset
		flipper[0] <= ~flipper[0]; // Toggle flip-flop
	end else counterC3 <= counterC3+1; // Counter on until reaching half of tone frequency
 
// Same pattern of code for all the other notes
	
	// Note C3#	
	if(counterC3_s==m*C3_s) begin
		counterC3_s <= 0;
		flipper[1] <= ~flipper[1];
	end else counterC3_s <= counterC3_s+1;
	
	// Note D3
	if(counterD3==m*D3) begin
		counterD3 <= 0;
		flipper[2] <= ~flipper[2];
	end else counterD3 <= counterD3+1;

	// Note D3#
	if(counterD3_s==m*D3_s) begin
		counterD3_s <= 0;
		flipper[3] <= ~flipper[3];
	end else counterD3_s <= counterD3_s+1;

	// Note E3
	if(counterE3==m*E3) begin
		counterE3 <= 0;
		flipper[4] <= ~flipper[4];
	end else counterE3 <= counterE3+1;

	// Note F3
	if(counterF3==m*F3) begin
		counterF3 <= 0;
		flipper[5] <= ~flipper[5];
	end else counterF3 <= counterF3+1;

	// Note F3#
	if(counterF3_s==m*F3_s) begin
		counterF3_s <= 0;
		flipper[6] <= ~flipper[6];
	end else counterF3_s <= counterF3_s+1;

	// Note G3	
	if(counterG3==m*G3) begin
		counterG3 <= 0;
		flipper[7] <= ~flipper[7];
	end else counterG3 <= counterG3+1;

	// Note G3#	
	if(counterG3_s==m*G3_s) begin
		counterG3_s <= 0;
		flipper[8] <= ~flipper[8];
	end else counterG3_s <= counterG3_s+1;

	// Note A3	
	if(counterA3==m*A3) begin
		counterA3 <= 0;
		flipper[9] <= ~flipper[9];
	end else counterA3 <= counterA3+1;

	// Note A3#		
	if(counterA3_s==m*A3_s) begin
		counterA3_s <= 0;
		flipper[10] <= ~flipper[10];
	end else counterA3_s <= counterA3_s+1;

	// Note B3	
	if(counterB3==m*B3) begin
		counterB3 <= 0;
		flipper[11] <= ~flipper[11];
	end else counterB3 <= counterB3+1;

	// Note C4	
	if(counterC4==m*C4) begin
		counterC4 <= 0;
		flipper[12] <= ~flipper[12];
	end else counterC4 <= counterC4+1;

	// Note C4#
	if(counterC4_s==m*C4_s) begin
		counterC4_s <= 0;
		flipper[13] <= ~flipper[13];
	end else counterC4_s <= counterC4_s+1;

	// Note D4		
	if(counterD4==m*D4) begin
		counterD4 <= 0;
		flipper[14] <= ~flipper[14];
	end else counterD4 <= counterD4+1;

	// Note D4#		
	if(counterD4_s==m*D4_s) begin
		counterD4_s <= 0;
		flipper[15] <= ~flipper[15];
	end else counterD4_s <= counterD4_s+1;

	// Note E4	
	if(counterE4==m*E4) begin
		counterE4 <= 0;
		flipper[16] <= ~flipper[16];
	end else counterE4 <= counterE4+1;

	// Note F4
	if(counterF4==m*F4) begin
		counterF4 <= 0;
		flipper[17] <= ~flipper[17];
	end else counterF4 <= counterF4+1;

	// Note F4#
	if(counterF4_s==m*F4_s) begin
		counterF4_s <= 0;
		flipper[18] <= ~flipper[18];
	end else counterF4_s <= counterF4_s+1;

	// Note G4
	if(counterG4==m*G4) begin
		counterG4 <= 0;
		flipper[19] <= ~flipper[19];
	end else counterG4 <= counterG4+1;

	// Note G4#
	if(counterG4_s==m*G4_s) begin
		counterG4_s <= 0;
		flipper[20] <= ~flipper[20];
	end else counterG4_s <= counterG4_s+1;

	// Note A4
	if(counterA4==m*A4) begin
		counterA4 <= 0;
		flipper[21] <= ~flipper[21];
	end else counterA4 <= counterA4+1;

	// Note A4#	
	if(counterA4_s==m*A4_s) begin
		counterA4_s <= 0;
		flipper[22] <= ~flipper[22];
	end else counterA4_s <= counterA4_s+1;

	// Note B4
	if(counterB4==m*B4) begin
		counterB4 <= 0;
		flipper[23] <= ~flipper[23];
	end else counterB4 <= counterB4+1;

	// Note C5
	if(counterC5==m*C5) begin
		counterC5 <= 0;
		flipper[24] <= ~flipper[24];
	end else counterC5 <= counterC5+1;

	// Note C5#
	if(counterC5_s==m*C5_s) begin
		counterC5_s <= 0;
		flipper[25] <= ~flipper[25];
	end else counterC5_s <= counterC5_s+1;

	// Note D5
	if(counterD5==m*D5) begin
		counterD5 <= 0;
		flipper[26] <= ~flipper[26];
	end else counterD5 <= counterD5+1;

	// Note D5#
	if(counterD5_s==m*D5_s) begin
		counterD5_s <= 0;
		flipper[27] <= ~flipper[27];
	end else counterD5_s <= counterD5_s+1;
	
	// Note E5
	if(counterE5==m*E5) begin
		counterE5 <= 0;
		flipper[28] <= ~flipper[28];
	end else counterE5 <= counterE5+1;

	// Note F5
	if(counterF5==m*F5) begin
		counterF5 <= 0;
		flipper[29] <= ~flipper[29];
	end else counterF5 <= counterF5+1;

	// Note F5#
	if(counterF5_s==m*F5_s) begin
		counterF5_s <= 0;
		flipper[30] <= ~flipper[30];
	end else counterF5_s <= counterF5_s+1;

	// Note G5
	if(counterG5==m*G5) begin
		counterG5 <= 0;
		flipper[31] <= ~flipper[31];
	end else counterG5 <= counterG5+1;

	// Note G5#
	if(counterG5_s==m*G5_s) begin
		counterG5_s <= 0;
		flipper[32] <= ~flipper[32];
	end else counterG5_s <= counterG5_s+1;

	// Note A5
	if(counterA5==m*A5) begin
		counterA5 <= 0;
		flipper[33] <= ~flipper[33];
	end else counterA5 <= counterA5+1;

	// Note A5#	
	if(counterA5_s==m*A5_s) begin
		counterA5_s <= 0;
		flipper[34] <= ~flipper[34];
	end else counterA5_s <= counterA5_s+1;

	// Note B5
	if(counterB5==m*B5) begin
		counterB5 <= 0;
		flipper[35] <= ~flipper[35];
	end else counterB5 <= counterB5+1;
					
end

endmodule
