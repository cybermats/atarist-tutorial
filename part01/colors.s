	;; A very simple example Atari ST program

	;; Put the CPU in the "Supervisor" mode by calling the GEMDOS
	;; routine "Super", which you do by calling trap with argument $20.
	
	move.l #0,-(a7)		; Argument to "Super", which
				; tells it to switch to "Supervisor"
				; mode.
	move.w #$20,-(a7)	; $20 is the routine number for "Super".
	trap #1 		; Call GEMDOS

	;; Now we're in supervisor mode, which gives us full control
	;; of the machine.
				
	move.l #$ff8240,a0	; Store the address of the background
				; color register in a0

	move.w #$000,(a0) 	; Set the background to black

loop:
	add.w #$1111,(a0) 	; Circle the colors
	nop 			; Wait a short while
	bra.s loop 		; Loop forever
	
