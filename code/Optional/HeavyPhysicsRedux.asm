; Change a variety of physics-related variables to make Samus' have heavier physics for jumping and landing
lorom

;----------------------------------------------------------;
;		Samus Movements
;----------------------------------------------------------;

; Samus Y movement - with speed calculations
org $90910F	; 0x08110F
; Increment gravity from $05 to $07
	CMP #$0007	; If [Samus Y speed] != 7, Originally != 5

;----------------------------------------------------------;
; Samus physics constants

org $909E93	; 0x081E93
; Samus animation delay in water
	dw $0002	; Originally $0003

org $909EA1	; 0x081EA1
; Samus Y subacceleration in air
	dw $3400	; Originally $1C00

org $909EB9	; 0x081EB9
; Initial Y speed in air when jumping
	dw $0006	; Originally $0004

org $909EC5	; 0x081EC5
; Initial Y speed in air when jumping when jumping with Hi-Jump
	dw $0009	; Originally $0006

org $909ED1	; 0x081ED1
; Initial Y speed in air when wall jumping
	dw $0007	; Originally $0004

org $909EDD	; 0x081EDD
; Initial Y speed in air when wall jumping with Hi-Jump
	dw $0008	; Originally $0005

org $909EF5	; 0x081EF5
; Initial Y speed in air during Bomb Jump
	dw $0003	; Originally $0002

;----------------------------------------------------------;
; Samus X speed table - normal

org $909F71	; 0x081F71
; Max X speed during Normal jumping
	dw $0002	; Originally $0001

org $909F7D	; 0x081F7D
; Max X speed during Spin jumping
	dw $0002	; Originally $0001

org $909FA1	; 0x081FA1
; Max X speed during Falling
	dw $0002	; Originally $0001

org $909FB9	; 0x081FB9
; Max X speed during Morph Ball falling
	dw $0002	; Originally $0001

org $90A031	; 0x082031
; Max X speed during Spring Ball in air
	dw $0003	; Originally $0001

org $90A03D	; 0x08203D
; Max X speed during Spring Ball falling
	dw $0002	; Originally $0001

org $90A049	; 0x082049
; Max X speed during Wall jumping
	dw $0003	; Originally $0001

;----------------------------------------------------------;
;		Bombs timer
;----------------------------------------------------------;

; Bomb timer reset value to account for the new falling speeds and still allow IBJ with the new physics
org $90BF9B	; 0x083F9B
	dw $0032	; Originally $003C


;----------------------------------------------------------;
;		Demo Data
;----------------------------------------------------------;
; Modify Demo data for Heavy Physics
; First set

org $828776	; 0x010776
; Demo room data for Landing site
	;    |-------------------------------------------Room pointer
	;	   |-------------------------------------Door pointer
	;		|--------------------------------Door slot
	; 			|------------------------Screen X position
	;			     |-------------------Screen Y position
	;				   |-------------Samus Y offset
	;					|--------Samus X offset
	;					      |--Length of demo and Pointer to code
	dw $8FD6,$0000,$02C0,$0380,$009B,$0028,$012B,$8924

; Missile Door Length of demo change
org $828794	; 0x010794
	dw $00C9	; Originally $0151
	
; Pre Spore Spawn Hall Samus X offset and Length changes
org $8287A4	; 0x0107A4
	dw $FFD4,$0106	; Originally $FFE0,$017A

; Grapple Beam Samus X offset and Length changes
org $8287C8	; 0x0107C8
	dw $0053,$0150	; Originally $FFC2,$01BC

; Pseudo Screw Attack Samus X, Length and Pointer code changes
org $8287DA	; 0x0107DA
	dw $FFC8,$0234,$8924	; Originally $0027,$0265,$891A

; Lower Norfair Length of demo change
org $828826	; 0x010826
	dw $0154	; Originally $03CA

; Screw Attack Samus X and Length changes
org $828836	; 0x010836
	dw $004F,$005D	; Originally $FFF1,$00D5

; Pre Phantoon Length changes
org $82885E	; 0x01085E
	dw $0279	; Originally $02EF

; Eye door Screen Y, Samus Y, Samus X and Length changes
org $82887C	; 0x01087C
	dw $01D0,$007B,$FFE4,$023C
; Originally $0100,$008B,$FFD2,$02D3

; Red Brinstar Samus X and Length changes
org $828892	; 0x010892
	dw $FFBE,$01F9	; Originally $FFAA,$0164

; Advanced Grapple Beam Samus X, Length and Pointer changes
org $8288DC	; 0x0108DC
	dw $FFC8,$04D4,$8924
; IBJ entire demo changes
	dw $91F8,$896A,$0000,$0650,$0200,$007B,$0019,$01DC,$8924
; Originally $91F8,$890A,$0000,$0600,$0200,$007B,$0020,$0185,$8925


; SBA Samus X and Length changes
org $828900	; 0x010900
	dw $0056,$0125	; Originally $FFB7,$018A

;----------------------------------------------------------;
; Demo input instruction lists, First set
;----------------------------------------------------------;
org $9186D0	; 0x0886D0
	dw $0003	; Originally $0007

;----------------------------------------------------------;
; More Demo data, Second set
;----------------------------------------------------------;
; Landing site Equipment change(?)
org $91888D	; 0x08888D
	dw $0000	; Originally $0000

; Landing Site Health, Collected & Equipped Beams, and Demo input object pointer changes
org $918895	; 0x088895
	dw $00C7,$100F,$1000,$9E52
; Originally $0063,$0000,$0000,$9E52

; Missile door demo entire changes
	dw $1007,$000A,$0004,$0000,$00C7,$100F,$100B,$9E88
; Originally $0004,$0005,$0000,$0000,$0063,$0000,$0000,$9E88

; Pre Spore Spawn Hall demo entire changes
	dw $0004,$000F,$0000,$0000,$00C7,$100F,$1000,$9EAC
; Originally $0004,$000F,$0000,$0000,$00C7,$1000,$1000,$9EAC

; Grapple Beam equipment change
org $9188CD	; 0x0888CD
	dw $0005	; Originally $6105

; Grapple Beam equipment change
org $9188D5	; 0x0888D5
	dw $00C7,$100F,$1000,$9EB2
; Originally $018F,$1006,$1006,$9EB2

; Pseudo Screw attack demo entire changes
	dw $1006,$000A,$0005,$000A,$012B,$100F,$100B,$9E58
; Originally $0004,$0014,$0000,$0000,$00C7,$1000,$1000,$9E58

; Screw Attack demo entire changes
org $91892D	; 0x08892D
	dw $3027,$002D,$0005,$000A,$018F,$100F,$000B,$9E9A
; Originally $E32D,$0055,$000F,$000A,$03E7,$0000,$0000,$9E9A

; Eye door demo entire changes
org $91896D	; 0x08896D
	dw $0106,$0019,$0005,$0000,$012B,$100F,$1000,$9E7C
; Originally $0104,$0019,$0005,$0000,$012B,$1004,$1004,$9E7C

; Red Brinstar -> Crateria Elevator demo entire changes			
	dw $2006,$002D,$0004,$0009,$018F,$100F,$0001,$9E6A
; Originally $2105,$001E,$0005,$0000,$012B,$0000,$0000,$9E6A

; Advanced Grapple Beam demo entire changes
org $9189BD	; 0x0889BD
	dw $3106,$0055,$000F,$000A,$012B,$000F,$000,$9EC4
; Originally $F32D,$0055,$000F,$000A,$03E7,$0000,$000,$9EC4

; IBJ demo entire changes
	dw $F32D,$00E6,$0032,$000A,$03E7,$100F,$100B,$9ECA
; Originally $F32D,$0055,$000F,$000A,$03E7,$0000,$0000,$9ECA

; SBA demo entire changes
	dw $F327,$00E5,$002E,$0032,$03DA,$1008,$1008,$9ED0
; Originally $F32D,$0055,$000F,$000A,$03E7,$1008,$1008,$9ED0


;----------------------------------------------------------;
; Demo Samus Setup function pointers
;----------------------------------------------------------;
org $918A05	; 0x088A05
	dw $8A49,$8A49,$8A53,$8A49,$8A49,$8A53
org $918A19	; 0x088A19
	dw $8A49
org $918A2B
	dw $8A53,$8A53,$8A49

;----------------------------------------------------------;
; Demo input instruction lists, Second set
;----------------------------------------------------------;
; Format:
; nnnn iii IIII
; 
; where
;     n: Number of frames
;     i: Current input
;     I: New input

; Buttons are defined with bitflags
;     8000: Run
;     4000: Cancel
;     2000: Select
;     1000: Start
;     0800: Up
;     0400: Down
;     0200: Left
;     0100: Right
;     0080: Jump
;     0040: Shoot
;     0020: Aim diagonally up
;     0010: Aim diagonally down

;----------------------------------------------------------;
; Landing Site demo inputs
org $918ACE	; 0x088ACE
	dw $0114	; Originally $0121
org $918AD4	; 0x088AD4
; Proper formatting, but the rest of the data after this won't follow this format
	dw $0001,$0000,$0000
	dw $000C,$0000,$0020
	dw $0001,$0040,$0060
	dw $0006,$0040,$0020
	dw $0009,$0000,$0020
	dw $000D
org $918AFA	; 0x088AFA
	dw $0280,$0220,$0002,$0220,$0020,$0001,$8220,$8020
	dw $001D,$8220,$0020,$0001,$82A0,$00A0,$001A,$82A0
	dw $0020,$0002,$02A0,$0020,$0002,$0220,$0020,$0001
	dw $0120,$0120,$0004,$0120,$0020,$0001,$01A0,$00A0
	dw $0008,$00A0
org $918B42	; 0x088B42
	dw $0000,$0020,$0001,$02A0,$0220,$000F,$02A0,$0020
	dw $000B,$0220,$0020,$0001,$0120,$0120,$0003,$0120
	dw $0020,$0001,$01A0,$00A0,$0001,$00A0,$0020,$0001
	dw $02A0,$0220,$0018,$02A0,$0020,$0020,$0220,$0020
	dw $0044,$0020,$0020,$8427

;----------------------------------------------------------;
; Pseudo Screw Attack demo inputs
org $918C3E	; 0x088C3E
	dw $0022
org $918C46	; 0x088C46
	dw $2000,$2020,$0005,$2020,$0020,$000D
org $918C58	; 0x088C58
	dw $0000,$0000,$000B,$0000,$0020,$0001,$0400,$0420
	dw $0004,$0400,$0020,$000B,$0000,$0020,$0001,$0040
	dw $0060,$0005,$0040,$0020,$001A,$0000,$0020,$000D
org $918C8E	; 0x088C8E
	dw $0440,$0420,$0007,$0420,$0020,$0001
org $918CA0	; 0x088CA0
	dw $0140,$0120,$0048,$0120,$0020,$001B,$0020,$0020
	dw $0001,$0120,$0120,$0003,$0120,$0020,$004E
org $918CC4	; 0x088CC4
	dw $0820,$0820,$0006,$0820,$0020,$0005
org $918CD6	; 0x088CD6
	dw $0840,$0820,$0006,$0820,$0020,$0027
org $918CE8	; 0x088CE8
	dw $8040,$8020,$0016,$8020,$0020,$0001,$8120,$0120
	dw $0008,$8120,$0020,$0001,$81A0,$00A0,$0046,$81A0
	dw $0020,$0001,$80A0,$0020,$0001,$8020,$0020,$0001
	dw $8220,$0220,$0001,$8220,$0020,$0001,$82A0,$00A0
	dw $0005,$82A0
org $918D32	; 0x088D32
	dw $0120,$000B,$81A0,$0020,$000F,$8120,$0020,$0009
	dw $0120,$0020,$0028,$0020,$0020,$8427

;----------------------------------------------------------;
; Pre Phantoon Hall demo inputs
org $918F3A	; 0x088F3A
	dw $0029	; Originally $003D
org $918F46	; 0x088F46
	dw $004B,$0220,$0020,$0001
org $918F5E	; 0x088F5E
	dw $0016
org $918F6A	; 0x088F6A
	dw $0004
org $918F82	; 0x088F82
	dw $0033,$81A0,$0020,$0009
org $918F9A	; 0x088F9A
	dw $0003
org $918FA6	; 0x088FA6
	dw $0010
org $918FB2	; 0x088FB2
	dw $0030,$81A0,$0020,$0002,$8120,$0020,$0002,$0120
	dw $0020,$0031

;----------------------------------------------------------;
; Lower Norfair Entrance demo inputs
org $918FE4	; 0x088FE4
	dw $000C	; Originally $0013
org $918FF0	; 0x088FF0
	dw $0011,$0120,$0020,$0016
org $918FFE	; 0x088FFE
	dw $8000,$8020,$000B,$8020,$0020,$0001,$8120,$0120
	dw $0008,$8120,$0020,$0001,$81A0,$00A0,$0034,$81A0
	dw $0020,$0011,$8120,$0020,$0001,$8020,$0020,$0001
	dw $8220,$0220,$0002,$8220,$0020,$0001,$82A0,$00A0
	dw $0007,$82A0,$0020,$0001,$81A0,$0120,$0009,$81A0
	dw $0020,$0008
org $919058	; 0x089058
	dw $8020,$0020,$0001,$8220,$0220,$0005,$8220,$0020
	dw $0001,$82A0,$00A0,$0001,$82A0,$0020,$0001,$80A0
	dw $0020,$0001,$81A0,$0120,$0006,$81A0,$0020,$001F
	dw $8120,$0020,$0038,$0120,$0020,$003F,$0020,$0020
	dw $8427

;----------------------------------------------------------;
; Eye Door demo inputs
org $919154	; 0x089154
	dw $0013	; Originally $000B
org $91915C	; 0x08915C
	dw $0200,$0220,$0001,$0220,$0020,$0001,$02A0,$00A0
	dw $0029,$02A0,$0020,$0001
org $91917A	; 0x08917A
	dw $0020,$0020,$0001,$0120,$0120,$0002,$0120,$0020
	dw $0001,$01A0,$00A0,$0028,$01A0,$0020,$0008
org $91919E	; 0x08919E
	dw $0020,$0020,$0001,$0220,$0220,$0004,$0220
org $9191B2	; 0x0891B2
	dw $00A0,$000F
org $9191BC	; 0x0891BC
	dw $0A00,$0820,$0001,$08A0,$0020,$0005,$0820,$0020
	dw $0001,$0860,$0060,$0005,$0860,$0020,$0001,$0820
	dw $0020,$0001,$0A20,$0220,$0003,$0220,$0020,$0001
	dw $02A0,$00A0,$0008,$02A0,$0020,$0004,$0220,$0020
	dw $0001,$0020,$0020,$0001,$0120,$0120,$0003,$0120
	dw $0020,$0001,$01A0,$00A0,$001B,$01A0,$0020,$0010
	dw $0120,$0020,$0001,$0220,$0220,$0003,$0220,$0020
	dw $0001,$02A0,$00A0,$0023,$02A0,$0020,$0009,$0220
	dw $0020,$0001,$0020
org $919248	; 0x089248
	dw $0100,$0005,$0120,$0020,$0029,$0020,$0020,$8427

;----------------------------------------------------------;
; Missile Door demo inputs
org $9193CC	; 0x0893CC
	dw $000F	; Originally $0029
org $9193D4	; 0x0893D4
	dw $0100,$0120,$0001,$8120,$8020,$0015,$8120,$0020
	dw $0003,$8020,$0020,$0001,$8220,$0220,$0015,$8220
	dw $0020,$0001,$82A0,$00A0,$0019,$82A0,$0020,$0002
	dw $80A0,$0020,$0001,$81A0,$0120,$0001,$8120,$0020
	dw $0001,$8220,$0220,$0002,$8220,$0020,$0001,$82A0
	dw $00A0,$0028,$82A0,$0020,$0002,$80A0,$0020,$0001
	dw $81A0,$0120,$000A,$81A0,$0020,$0001,$80A0,$0020
	dw $0001,$00A0,$0020,$0031,$0020,$0020,$8427

;----------------------------------------------------------;
; Pre Spore Spawn Hall demo inputs
org $91965A	; 0x08965A
	dw $0011	; Originally $001B
org $919662	; 0x089662
	dw $0100,$0120,$0001,$0120,$0020,$0001,$8120,$8020
	dw $000A,$8120,$0020,$0001,$81A0,$00A0,$0002,$81A0
	dw $0020,$0004,$01A0,$0020,$0001,$05A0,$0420,$0005
	dw $04A0,$0020,$0007,$00A0,$0020,$0001,$04A0,$0420
	dw $0001,$04A0,$0020,$0001,$05A0,$0120,$0089,$01A0
	dw $0020,$0001,$00A0,$0020,$0001,$0020,$0020,$0001
	dw $0820,$0820,$0005,$0820,$0020,$0016,$0020
org $9196D8	; 0x0896D8
	dw $0001,$0820,$0020,$0028,$0020,$0020,$8427

;----------------------------------------------------------;
; Grapple Beam demo inputs
org $91973A	; 0x08973A
	dw $001A	; Originally $0010
org $919752	; 0x089752
	dw $0E
org $91975E	; 0x08975E
	dw $01
org $91976A	; 0x08976A
	dw $0001,$06A0,$0420,$0003,$06A0,$0020,$0002,$04A0
	dw $0020,$0010,$00A0
org $919786	; 0x089786
	dw $0420,$0001,$04A0,$0020,$0001,$06A0,$0220,$00AF
	dw $02A0,$0020,$0010,$0220,$0020,$0001,$0020,$0020
	dw $0001,$0820,$0820,$001A,$0020,$0020,$0001,$0820
	dw $0820,$0002,$0820,$0020,$0028,$0020,$0020,$8427

;----------------------------------------------------------;
; IBJ demo inputs
org $919AF0	; 0x089AF0
	dw $0013	; Originally $0019
org $919AF8	; 0x089AF8
	dw $00A0,$00A0,$0006,$00A0,$0020,$0001,$04A0,$0420
	dw $0007,$04A0,$0020,$0002
org $919B1A	; 0x089B1A
	dw $0008,$04A0,$0020,$0001
org $919B28	; 0x089B28
	dw $00E0,$0060,$0019,$00E0,$0020,$000E,$00A0,$0020
	dw $0001,$00E0,$0060,$0015,$00E0,$0020,$0012,$00A0
	dw $0020,$0001,$00E0,$0060,$0011,$00E0,$0020,$0017
	dw $00A0,$0020,$0001,$00E0,$0060,$001A,$00E0,$0020
	dw $000B,$00A0,$0020,$0001,$00E0,$0060,$001A,$00E0
	dw $0020,$000B,$00A0,$0020,$0001,$00E0,$0060,$001D
	dw $00E0,$0020,$000B,$00A0,$0020,$0001,$00E0,$0060
	dw $0016,$00E0,$0020,$000E,$00A0,$0020,$0001,$00E0
	dw $0060,$001D,$00E0,$0020,$000A,$00A0,$0020,$0001
	dw $00E0,$0060,$0018,$00E0,$0020,$000E,$00A0,$0020
	dw $0001,$00E0,$0060,$0018,$00E0,$0020,$000F,$00A0
	dw $0020,$0001,$00E0,$0060,$0014,$00E0,$0020,$000F
	dw $00A0,$0020,$8427


;----------------------------------------------------------;
;		Transition tables
;----------------------------------------------------------;
; Transition table entries have the format:
;     nnnn cccc pppp
;     nnnn cccc pppp
;     FFFF
; where:
;     c is the currently held input, c = FFFF terminates the table entry
;     n is the newly pressed input
;     p is the pose to transition to (if not currently already in that pose)

org $919FE0	; 0x089FE0
	dw $A906,$A97C,$A55E,$A5AE,$02EC,$0220,$0036,$0220
	dw $0020,$0001,$0230,$0030,$0001,$0030,$0020,$0001
	dw $0070,$0060,$0001,$0070,$0020,$0004,$0030,$0020
	dw $0007,$0020,$0020,$0001,$00A0,$00A0,$0004,$00A0
	dw $0020,$0001,$02A0,$0220,$0004,$02A0,$0020,$0011
	dw $0220,$0020,$001A,$0020,$0020,$0001,$0220,$0220
	dw $0011,$0220,$0020,$0004,$0020,$0020,$0001,$0220
	dw $0220,$0002,$0220,$0020,$0001,$02A0,$00A0,$0002
	dw $02A0,$0020,$0003,$0220,$0020,$0001,$02A0,$00A0
	dw $0002,$02A0,$0020,$0014,$0220,$0020,$0001,$02A0
	dw $00A0,$0006,$02A0,$0020,$0015,$0220,$0020,$000E
	dw $0020,$0020,$0001,$00A0,$00A0,$0003,$00A0,$0020
	dw $0001,$02A0,$0220,$0004,$02A0,$0020,$000D,$0220
	dw $0020,$002E,$0020,$0020,$8427

; Transition table - entry 01/03/05/07/A4/A6/E0/E2/E4/E6
org $91A100	; 0x08A100
	dw $0294

org $91A10C	; 0x08A10C
	dw $0002,$2020,$0020,$00E6

org $91A11A	; 0x08A11A
	dw $00A0,$00A0,$0007,$00A0,$0020,$0201

org $91A12C	; 0x08A12C
	dw $0060,$0060,$0004,$0060,$0020,$014F

org $91A13E	; 0x08A13E
	dw $00A0,$00A0,$0004,$00A0,$0020,$0001,$0080,$0000
	dw $0001,$0080,$0020,$0006,$0000,$0020,$0001,$0040
	dw $0060,$0002,$0040,$0020,$0003,$0000,$0020,$0001
	dw $0040,$0060
; Transition table - entry 02/04/06/08/A5/A7/E1/E3/E5/E7
; $91A172 - 0x08A172
	dw $0001,$0040,$0020,$0002,$0000,$0020,$0001,$0040
	dw $0060,$0002,$0040,$0020,$0002,$0000,$0020,$0001
	dw $0040,$0060,$0001,$0040,$0020,$0009,$0000,$0020
	dw $0001,$0080,$00A0,$0006,$0080,$0020,$0002,$0000
	dw $0020,$0001,$0040,$0060,$0002,$0040,$0020,$0002
	dw $0000,$0020,$0001,$0040,$0060,$0001,$0040,$0020
	dw $0002,$0000,$0020,$0001,$0040,$0060,$0001,$0040
	dw $0020,$0004,$0000,$0020,$0001,$0040,$0060,$0005
	dw $0000,$0020,$00B5
; Transition table - entry 09/0D/0F/11
; $91A1F8 - 0x08A1F8
	dw $0020,$0020,$8427

; Transition table - entry 0A/0E/10/12
org $91A280	; 0x08A280
	dw $0021	; Originally $0010
org $91A288	; 0x08A288
	dw $0408,$0420
; Transition table - entry 4B/55/57/59
; $91A28C - 0x08A28C
	dw $0002,$0420,$0020,$0013
org $91A29E	; 0x08A29E
	dw $0002,$0420,$0020,$0006
org $91A2AC	; 0x08A2AC
	dw $0000,$0000,$000B,$0000,$0020,$0001,$0040,$0060
	dw $0003
; Transition table - entry 4B/55/57/59
; $91A2BE - 0x08A2BE
	dw $0040,$0020,$0001,$0000,$0020,$0011,$0020,$0020
	dw $0001,$0820,$0820,$0003,$0820,$0020,$0005
org $91A2E6	; 0x08A2E6
	dw $0001,$0820,$0020,$0052

org $91A2F4	; 0x08A2F4
	dw $80FF
; Transition table - entry 15/4D/51/69/6B
; $91A2F6 - 0x08A2F6
	dw $8020,$0006,$8020,$0020,$0001,$8220,$0220,$009B
	dw $8220,$0020,$0001,$8020,$0020,$0001,$8120,$0120
	dw $0058,$8120,$0020,$0001,$8520,$0420,$000E,$8420
	dw $0020,$0001,$8520,$0120,$0001,$8120,$0020,$001C
	dw $0120,$0020,$0001,$01A0,$00A0,$0011,$01A0,$0020
	dw $001E,$0120,$0020,$0001,$01A0,$00A0,$0006,$01A0
	dw $0020,$000D,$0120,$0020,$0001,$0020,$0020,$0001
	dw $0220,$0220,$0004,$0220,$0020,$0003,$0020,$0020
; Transition table - entry 16/4E/52/6A/6C
; $91A376 - 0x08A376
	dw $0001,$0120,$0120,$0003,$0120,$0020,$001C,$0020
	dw $0020,$0001,$00A0,$00A0,$0002,$00A0,$0020,$0001
	dw $0020,$0020,$0001,$0120,$0120,$0001,$0120,$0020
	dw $0001,$0020,$0020,$8427

; Transition table - entry 81
org $91A570	; 0x08A570
	dw $0013	; Originally $0000

org $91A578	; 0x08A578
	dw $0150,$0120,$0001,$0120,$0020,$0001,$8120,$8020
	dw $005E,$8120,$0020,$000C,$0120,$0020,$001F,$0020
	dw $0020,$0001,$0420,$0420,$0005,$0420,$0020,$0010
	dw $0020,$0020,$0001
; Transition table - entry 82
	dw $0420,$0420,$0004,$0420,$0020,$0008,$0020,$0020
	dw $0001,$0220,$0220,$000C,$0220,$0020,$004A,$0020
	dw $0020,$0001,$0220,$0220,$000D,$0220,$0020,$0004
	dw $0020,$0020,$0001,$0120,$0120,$0004,$0120,$0020
	dw $0038,$0020,$0020,$0001,$0120,$0120,$000A,$0120
; Transition table - entry 1D
	dw $0020,$0008,$0020,$0020,$0001,$0220,$0220,$0003
	dw $0220,$0020,$001A,$0020,$0020
; Transition table - entry 1E
	dw $0001,$0000,$0000,$0008,$0000,$0020,$0004,$0020
	dw $0020,$0001,$0220,$0220,$0005
; Transition table - entry 1F
	dw $0220,$0020,$0004,$0020,$0020,$0001,$0120,$0120
	dw $000D,$0120,$0020,$0003,$0020
; Transition table - entry 41
	dw $0020,$0001,$0220,$0220,$0007,$0220,$0020,$001F
	dw $0020,$0020,$0001,$0120,$0120
; Transition table - entry 20/21/22/24
	dw $0018 
; Transition table - entry 23
	dw $0120 
; Transition table - entry 42
	dw $0020
; Transition table - entry 27/71/73/85
; $91A66C - 0x08A66C
	dw $0001,$0100,$0000,$0003,$0100,$0020,$0003,$0000
	dw $0020,$0001,$0040,$0060,$0002,$0040,$0020,$0008
	dw $0000,$0020,$006A,$0020,$004B,$0000,$0230
; $91A699 - 0x08A699
	dw $0220,$001D,$0220,$0020,$0001,$0020,$0020,$0001
	dw $0820,$0820,$0002,$0820,$0020,$0005,$0020,$0020
	dw $0001
; Transition table - entry 28/72/74/86
; $91A6BC - 0x08A6BC
	dw $0120,$0120,$0006,$0120,$0020,$0009,$0020,$0020
	dw $0001,$0120,$0120,$0004,$0120,$0020,$0006,$0020
	dw $0020,$0001,$0820,$0820,$0004,$0820,$0020,$0009
	dw $0020,$0020,$0001,$0120,$0120,$0002,$0120,$0020
	dw $0006,$0020,$0020,$0001,$2020,$2020,$0002,$2020
; Transition table - entry 29/2B/6D/6F
; $91A70C - 0x08A70C
	dw $0020,$0016,$0020,$0020,$0001,$00A0,$00A0,$0009
	dw $00A0,$0020,$0001,$0080,$0000,$0001,$0080,$0020
	dw $0003,$0000,$0020,$0001,$0040,$0060,$0005,$0040
	dw $0020,$000B,$0000,$0020,$0020,$0067,$0000,$0100
; Transition table - entry 2A/2C/6E/70
; $91A750 - 0x08A750
	dw $0429,$0420,$0005,$0420,$0020,$0008,$0020,$0020
	dw $0001,$0420,$0420,$0005,$0420,$0020,$0002,$0020
	dw $0020,$0001,$0120,$0120,$0011,$0120,$0020,$0001
	dw $01A0,$00A0,$001F,$01A0,$0020,$0048,$0120,$0020
	dw $0001,$0020,$0020,$0001,$0820,$0820,$0003,$0820
	dw $0020,$0014,$0000,$0100,$0031
; Transition table - entry 31
; $91A794	; 0x08A794
	dw $0820,$0820,$0003,$0820,$0020,$0014
org $91A7A6	; 0x08A7A6
	dw $0800,$0820,$0020,$0020,$0020,$8427


;----------------------------------------------------------;