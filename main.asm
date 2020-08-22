;Dev: Joao Vitor de Oliveira Camara
;21/08/2020
    
    
; PIC18F4550 Configuration Bit Settings

; Assembly source line config statements

#include "p18f4550.inc"

; CONFIG1L
  CONFIG  PLLDIV = 1            ; PLL Prescaler Selection bits (No prescale (4 MHz oscillator input drives PLL directly))
  CONFIG  CPUDIV = OSC1_PLL2    ; System Clock Postscaler Selection bits ([Primary Oscillator Src: /1][96 MHz PLL Src: /2])
  CONFIG  USBDIV = 1            ; USB Clock Selection bit (used in Full-Speed USB mode only; UCFG:FSEN = 1) (USB clock source comes directly from the primary oscillator block with no postscale)

; CONFIG1H
  CONFIG  FOSC = INTOSC_HS      ; Oscillator Selection bits (Internal oscillator, HS oscillator used by USB (INTHS))
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG  IESO = OFF            ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

; CONFIG2L
  CONFIG  PWRT = OFF            ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  BOR = ON              ; Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
  CONFIG  BORV = 3              ; Brown-out Reset Voltage bits (Minimum setting 2.05V)
  CONFIG  VREGEN = OFF          ; USB Voltage Regulator Enable bit (USB voltage regulator disabled)

; CONFIG2H
  CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
  CONFIG  WDTPS = 32768         ; Watchdog Timer Postscale Select bits (1:32768)

; CONFIG3H
  CONFIG  CCP2MX = ON           ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  CONFIG  PBADEN = OFF          ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)
  CONFIG  LPT1OSC = OFF         ; Low-Power Timer 1 Oscillator Enable bit (Timer1 configured for higher power operation)
  CONFIG  MCLRE = ON            ; MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)

; CONFIG4L
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
  CONFIG  ICPRT = OFF           ; Dedicated In-Circuit Debug/Programming Port (ICPORT) Enable bit (ICPORT disabled)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection bit (Block 0 (000800-001FFFh) is not code-protected)
  CONFIG  CP1 = OFF             ; Code Protection bit (Block 1 (002000-003FFFh) is not code-protected)
  CONFIG  CP2 = OFF             ; Code Protection bit (Block 2 (004000-005FFFh) is not code-protected)
  CONFIG  CP3 = OFF             ; Code Protection bit (Block 3 (006000-007FFFh) is not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) is not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM is not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection bit (Block 3 (006000-007FFFh) is not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000800-001FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection bit (Block 3 (006000-007FFFh) is not protected from table reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) is not protected from table reads executed in other blocks)



  
  
  
org 00
  
UDATA
    Delay1 res 1	;RESERVANDO 1 BYTE PARA A VARI�VEL DELAY1
    Delay2 res 1	;RESERVANDO 1 BYTE PARA A VARI�VEL DELAY2
 
 
CODE		;INDICA O INICIO DE UMA SE��O DE C�DIGO

Start:
    CLRF TRISB	;COLOCAR ZEROS NO TRISB � DEFINIR AS PORTAS DELE COMO SAIDAS
    CLRF TRISD	;COLOCAR ZEROS NO TRISD � DEFINIR AS PORTAS DELE COMO SAIDAS
   
    
    CLRF Delay1	;LIMPANDO A VARI�VEL DELAY1 FAZENDO ELA INCIAR EM 0
    CLRF Delay2	;LIMPANDO A VARI�VEL DELAY2 FAZENDO ELA INCIAR EM 0
    CLRF RB7	;LIMPANDO O REGISTRADOR RB7 FAZENDO ELE INCIAR EM 0
    


    
    
    
MainLoop:
    BSF PORTB,RB7   ; DA INICIO AO RB7 COM VALOR 1

   
    NUMUM:
	BSF PORTD,RD1   ;L3 - liga o L3 
	BSF PORTD,RD2   ;L6 - liga o L6
	CALL Delay
	BCF PORTD,RD1   ;L3 - desliga o L3 
	BCF PORTD,RD2   ;L6 - desliga o L6
	GOTO NUMDOIS
	
    NUMDOIS:
	BSF PORTD,RD0   ;L1 - liga o L1
	BSF PORTD,RD1	;L3 - liga o L3 
	BSF PORTD,RD6   ;L4 - liga o L4
	BSF PORTD,RD4   ;L5 - liga o L5
	BSF PORTD,RD3   ;L7 - liga o L7
	CALL Delay
	BCF PORTD,RD0   ;L1 - desliga o L1
	BCF PORTD,RD1	;L3 - desliga o L3
	BCF PORTD,RD6   ;L4 - desliga o L4
	BCF PORTD,RD4   ;L5 - desliga o L5
	BCF PORTD,RD3   ;L7 - desliga o L7
	GOTO NUMTRES

    NUMTRES:
	BSF PORTD,RD0   ;L1 - liga o L1
	BSF PORTD,RD1	;L3 - liga o L3 
	BSF PORTD,RD6   ;L4 - liga o L4
	BSF PORTD,RD2   ;L6 - liga o L6
	BSF PORTD,RD3   ;L7 - liga o L7
	CALL Delay
	BCF PORTD,RD0   ;L1 - desliga o L1
	BCF PORTD,RD1	;L3 - desliga o L3 
	BCF PORTD,RD6   ;L4 - desliga o L4
	BCF PORTD,RD2   ;L6 - desliga o L6
	BCF PORTD,RD3   ;L7 - desliga o L7
	GOTO NUMQUATRO

    NUMQUATRO:
	BSF PORTD,RD5   ;L2 - liga o L2
	BSF PORTD,RD6   ;L4 - liga o L4
	BSF PORTD,RD2   ;L6 - liga o L6
	BSF PORTD,RD1   ;L3 - liga o L3
	CALL Delay
	BCF PORTD,RD5   ;L2 - desliga o L2
	BCF PORTD,RD6   ;L4 - desliga o L4
	BCF PORTD,RD2   ;L6 - desliga o L6
	BCF PORTD,RD1   ;L3 - desliga o L2
	GOTO NUMCINCO
	
    
    NUMCINCO:
	BSF PORTD,RD0   ;L1 - liga o L1
	BSF PORTD,RD5   ;L2 - liga o L2
	BSF PORTD,RD6   ;L4 - liga o L4
	BSF PORTD,RD2   ;L6 - liga o L6
	BSF PORTD,RD3   ;L7 - liga o L7
	CALL Delay
	BCF PORTD,RD0   ;L1 - desliga o L1 
	BCF PORTD,RD5   ;L2 - desliga o L1
	BCF PORTD,RD6   ;L4 - desliga o L1
	BCF PORTD,RD2   ;L6 - desliga o L1
	BCF PORTD,RD3   ;L7 - desliga o L1
	GOTO NUMSEIS
	

    NUMSEIS:
	BSF PORTD,RD5   ;L2 - liga o L2
	BSF PORTD,RD6   ;L4 - liga o L4
	BSF PORTD,RD2   ;L6 - liga o L6
	BSF PORTD,RD3   ;L7 - liga o L7
	BSF PORTD,RD4   ;L5 - liga o L5
	CALL Delay
	BCF PORTD,RD5   ;L2 - desliga o L2
	BCF PORTD,RD6   ;L4 - desliga o L4
	BCF PORTD,RD2   ;L6 - desliga o L6
	BCF PORTD,RD3   ;L7 - desliga o L7
	BCF PORTD,RD4   ;L5 - desliga o L5
	GOTO NUMSETE
	
    NUMSETE:
	BSF PORTD,RD0   ;L1 - liga o L1 
	BSF PORTD,RD1	;L3 - liga o L3 
	BSF PORTD,RD2   ;L6 - liga o L6
	CALL Delay
	BSF PORTD,RD0   ;L1 - desliga o L1
	BSF PORTD,RD1	;L3 - desliga o L3 
	BSF PORTD,RD2   ;L6 - desliga o L6
	GOTO NUMOITO
	
    NUMOITO:
	BSF PORTD,RD0   ;L1 - liga o L1
	BSF PORTD,RD5   ;L2 - liga o L2
	BSF PORTD,RD1	;L3 - liga o L3
	BSF PORTD,RD6   ;L4 - liga o L4
	BSF PORTD,RD4   ;L5 - liga o L5
	BSF PORTD,RD2   ;L6 - liga o L6
	BSF PORTD,RD3   ;L7 - liga o L7
	CALL Delay
	BCF PORTD,RD0   ;L1 - desliga o L1
	BCF PORTD,RD5   ;L2 - desliga o L2
	BCF PORTD,RD1	;L3 - desliga o L3
	BCF PORTD,RD6   ;L4 - desliga o L4
	BCF PORTD,RD4   ;L5 - desliga o L5
	BCF PORTD,RD2   ;L6 - desliga o L6
	BCF PORTD,RD3   ;L7 - desliga o L7
	GOTO NUMNOVE
	
    NUMNOVE:
	BSF PORTD,RD0   ;L1 - liga o L1
	BSF PORTD,RD5   ;L2 - liga o L2
	BSF PORTD,RD1	;L3 - liga o L3
	BSF PORTD,RD6   ;L4 - liga o L4
	BSF PORTD,RD2   ;L6 - liga o L6
	CALL Delay
	BCF PORTD,RD0   ;L1 - desliga o L1
	BCF PORTD,RD5   ;L2 - desliga o L2
	BCF PORTD,RD1	;L3 - desliga o L3
	BCF PORTD,RD6   ;L4 - desliga o L4
	BCF PORTD,RD2   ;L6 - desliga o L6
	
	
	
	GOTO MainLoop ;PARA CRIAR UM LOOP INFINITO FAZENDO A CONTAGEM RESETAR SEMPRE
	
    
	


Delay:
    DECFSZ Delay1,01	 ;Decrementa 1 Bit da vari�vel Delay1
    GOTO Delay
    DECFSZ Delay2,01	 ;Decrementa 1 Bit da vari�vel Delay1
    GOTO Delay	;FICA NESSE LOOP 255 POSI��ES
    RETURN      ;VOLTA NA PR�XIMA INSTRU��O P�S Delay
    


    
    end






