#include "mbed.h"

DigitalOut myled1(PA_1); // A
DigitalOut myled2(PA_2); // B
DigitalOut myled3(PA_3); // F
DigitalOut myled4(PA_4); // G
DigitalOut myled5(PA_5); // E
DigitalOut myled6(PA_6); // D
DigitalOut myled7(PA_7); // C

DigitalOut myled8(PB_1); // DP

//DigitalIn myin10(PA_10); // for out 10 (in3)
DigitalIn myin9(PA_9);     // for out 11 (in4)

char seg[32][8] = {
 { 1,1,1,1,1,1,1,1 }, //0 @ -> ' '
 { 0,0,0,0,0,1,0,1 }, //1 A  o
 { 1,1,0,0,0,0,0,1 }, //2 B     　combined use "6"
 { 0,1,0,1,0,0,1,1 }, //3 C
 { 1,0,1,0,0,0,0,1 }, //4 D
 { 0,1,0,0,0,0,1,1 }, //5 E  o
 { 0,1,0,0,0,1,1,1 }, //6 F
 { 0,1,0,1,0,0,0,1 }, //7 G

 { 1,0,0,0,0,1,0,1 }, //8 H  o
 { 1,0,1,1,1,1,0,1 }, //9 I    　combined use "1"
 { 1,0,1,1,0,0,0,1 }, //10 J
 { 0,1,0,0,0,1,0,1 }, //11 K 
 { 1,1,0,1,0,0,1,1 }, //12 L  o
 { 0,1,1,1,0,1,0,1 }, //13 M
 { 0,0,0,1,0,1,0,1 }, //14 N  o
 { 0,0,0,1,0,0,0,1 }, //15 O  o　combined use "0"

 { 0,0,0,0,0,1,1,1 }, //16 P
 { 0,0,0,0,1,1,0,1 }, //17 Q　combined use "9"
 { 1,1,1,0,0,1,1,1 }, //18 R
 { 0,1,0,0,1,0,0,1 }, //19 S　combined use "5"
 { 1,1,0,0,0,0,1,1 }, //20 T
 { 1,0,0,1,0,0,0,1 }, //21 U
 { 1,1,1,1,0,0,0,1 }, //22 V
 { 1,0,0,1,1,0,1,1 }, //23 W  o
 { 1,1,0,0,1,1,0,1 }, //24 X
 
 { 1,0,0,0,1,0,0,1 }, //25 Y
 { 0,0,1,0,0,0,1,1 }, //26 Z　combined use "2"
 { 0,0,1,0,1,0,0,1 }, //27 [  --> "3"
 { 1,0,0,0,1,1,0,1 }, //28 \  --> "4"
 { 0,0,0,1,1,1,0,1 }, //29 ]  --> "7"
 { 0,0,0,0,0,0,0,1 }, //26 ^  --> "8"
 { 1,1,1,1,1,0,1,1 }  //31 _
};

int main() {
    int a;
    int b;
    int c;
    int d;
    
    //int e; //5bit
    int f; //6bit
    
    int s;

s=8;
//while(1) {
   myled1 = seg[s][0];myled2 = seg[s][1];myled3 = seg[s][2];myled4 = seg[s][3];
   myled5 = seg[s][4];myled6 = seg[s][5];myled7 = seg[s][6];myled8 = seg[s][7];

//   wait(1);
//   s=s+1;
//   if (s >=10) { s=0;}  
//}


    while(1) {
        
        while( myin9 == 1 ) {}
        wait(0.035);
        a=!(myin9);
        wait(0.035);
        b=!(myin9);
        wait(0.035);
        c=!(myin9);
        wait(0.035);
        d=!(myin9);
        wait(0.035);
        
        //e=!(myin9);  // 5bit
        wait(0.035);
        f=!(myin9);  // 6bit
        wait(0.035);
       
        
        s=f*16+d*8+c*4+b*2+a;
    
        myled1 = seg[s][0];myled2 = seg[s][1];myled3 = seg[s][2];myled4 = seg[s][3];
        myled5 = seg[s][4];myled6 = seg[s][5];myled7 = seg[s][6];myled8 = seg[s][7];
      
        
    }
}

// ichigojam
//
//10 'START 0.5 DATA 6BIT SOTP 1
//20 OUT 12,1:WAIT 15
//30 [0]=ASC("H")
//40 [1]=ASC("A")
//50 [2]=ASC("L")
//60 [3]=ASC("L")
//70 [4]=ASC("O")
//80 [5]=ASC("W")
//90 [6]=ASC("E")
//100 [7]=ASC("E")
//110 [8]=ASC("N")
//160 FOR I=0 TO 8
//170 R=[I]:GOSUB 200:WAIT 60
//180 NEXT
//190 GOTO 160
//200 '
//210 R=R-64:OUT 11,0:WAIT 1
//220 FOR S=0 TO 3+1
//230 OUT 11,!( (R >> S)&1 )
//240 WAIT 2
//250 NEXT:WAIT 2:'6BIT
//260 OUT 11,1
//270 WAIT 2
//280 RETURN
