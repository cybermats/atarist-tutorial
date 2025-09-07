	text
	move.l #message,-(sp)	; Address of the string on the stack
	move #$09,-(sp)		; PTR LINE
	trap #1			; Call GEMDOS
	addq.l #6,sp		; Correct stack
	

	move.w #1,-(sp)		; CONIN
	trap #1			; Call GEMDOS
	addq.l #2,sp		; Correct stack
	
	clr.w -(sp)		; TERM
	trap #1			; Call GEMDOS

	data
message:	
	dc.b 'Hello world',$0d,$0a,0
	
