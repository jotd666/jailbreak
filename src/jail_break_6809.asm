;	map(0x0000, 0x07ff).ram().w(FUNC(jailbrek_state::colorram_w)).share(m_colorram);
;	map(0x0800, 0x0fff).ram().w(FUNC(jailbrek_state::videoram_w)).share(m_videoram);
;	map(0x1000, 0x10bf).ram().share(m_spriteram);
;	map(0x10c0, 0x14ff).ram();
;	map(0x1500, 0x1fff).ram(); // work RAM
;	map(0x2000, 0x203f).ram().share(m_scroll_x);
;	map(0x2040, 0x2040).nopw(); // ???
;	map(0x2041, 0x2041).nopw(); // ???
;	map(0x2042, 0x2042).ram().share(m_scroll_dir); // bit 2 = scroll direction
;	map(0x2043, 0x2043).nopw(); // ???
;	map(0x2044, 0x2044).w(FUNC(jailbrek_state::ctrl_w)); // irq, nmi enable, screen flip
;	map(0x3000, 0x3000).w(FUNC(jailbrek_state::coin_w));
;	map(0x3100, 0x3100).portr("DSW2").w("snsnd", FUNC(sn76489a_device::write));
;	map(0x3200, 0x3200).portr("DSW3").nopw(); // mirror of the previous?
;	map(0x3300, 0x3300).portr("SYSTEM").w("watchdog", FUNC(watchdog_timer_device::reset_w));
;	map(0x3301, 0x3301).portr("P1");
;	map(0x3302, 0x3302).portr("P2");
;	map(0x3303, 0x3303).portr("DSW1");
;	map(0x4000, 0x4000).w(FUNC(jailbrek_state::speech_w)); // speech pins
;	map(0x5000, 0x5000).w(m_vlm, FUNC(vlm5030_device::data_w)); // speech data
;	map(0x6000, 0x6000).r(FUNC(jailbrek_state::speech_r));
;	map(0x8000, 0xffff).rom();
;

;	PORT_START("SYSTEM")    // system_3300
;	KONAMI8_SYSTEM_10
;	PORT_BIT( 0xe0, IP_ACTIVE_LOW, IPT_UNUSED )
;
;	PORT_START("P1")        // in0_3301
;	KONAMI8_B12_UNK(1)  // button1 = shoot, button2 = select
;
;	PORT_START("P2")        // in1_3302
;	KONAMI8_B12_UNK(2)
;
;	PORT_START("DSW1")      // dsw1_3303
;	KONAMI_COINAGE_LOC(DEF_STR( Free_Play ), "Invalid", SW1)
;	// "Invalid" = both coin slots disabled
;
;	PORT_START("DSW2")      // dsw2_3100
;	PORT_DIPNAME( 0x03, 0x01, DEF_STR( Lives ) )       PORT_DIPLOCATION( "SW2:1,2" )
;	PORT_DIPSETTING(    0x03, "1" )
;	PORT_DIPSETTING(    0x02, "2" )
;	PORT_DIPSETTING(    0x01, "3" )
;	PORT_DIPSETTING(    0x00, "5" )
;	PORT_DIPNAME( 0x04, 0x00, DEF_STR( Cabinet ) )     PORT_DIPLOCATION( "SW2:3" )
;	PORT_DIPSETTING(    0x00, DEF_STR( Upright ) )
;	PORT_DIPSETTING(    0x04, DEF_STR( Cocktail ) )
;	PORT_DIPNAME( 0x08, 0x08, DEF_STR( Bonus_Life ) )  PORT_DIPLOCATION( "SW2:4" )
;	PORT_DIPSETTING(    0x08, "30K 70K+" )
;	PORT_DIPSETTING(    0x00, "40K 80K+" )
;	PORT_DIPNAME( 0x30, 0x10, DEF_STR( Difficulty ) )  PORT_DIPLOCATION( "SW2:5,6" )
;	PORT_DIPSETTING(    0x30, DEF_STR( Easy ) )
;	PORT_DIPSETTING(    0x20, DEF_STR( Normal ) )
;	PORT_DIPSETTING(    0x10, DEF_STR( Difficult ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Very_Difficult ) )
;	PORT_BIT( 0x40, IP_ACTIVE_LOW, IPT_UNUSED )        PORT_DIPLOCATION( "SW2:7" )
;	PORT_DIPNAME( 0x80, 0x00, DEF_STR( Demo_Sounds ) ) PORT_DIPLOCATION( "SW2:8" )
;	PORT_DIPSETTING(    0x80, DEF_STR( Off ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( On ) )
;
;	PORT_START("DSW3")      // dsw3_3200
;	PORT_DIPNAME( 0x01, 0x01, DEF_STR( Flip_Screen ) ) PORT_DIPLOCATION( "SW3:1" )
;	PORT_DIPSETTING(    0x01, DEF_STR( Off ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( On ) )
;	PORT_DIPNAME( 0x02, 0x02, "Upright Controls" )     PORT_DIPLOCATION( "SW3:2" )
;	PORT_DIPSETTING(    0x02, DEF_STR( Single ) )
;	PORT_DIPSETTING(    0x00, DEF_STR( Dual ) )
;	PORT_BIT( 0x04, IP_ACTIVE_LOW, IPT_UNUSED )        PORT_DIPLOCATION( "SW3:3" )
;	PORT_BIT( 0x08, IP_ACTIVE_LOW, IPT_UNUSED )        PORT_DIPLOCATION( "SW3:4" )

system_3300 = $3300		| also watchdog
watchdog_3300 = $3300
in0_3301 = $3301
in1_3302 = $3302
dsw1_3303 = $3303
dsw2_3100 = $3100
dsw3_3200 = $3200
scroll_dir_2042 = $2042
ctrl_2044 = $2044
scroll_x_2000 = $2000
coin_3000 = $3000
speech_4000 = $4000
speech_6000 = $6000
nop_2040 = $2040
nop_2043 = $2043
road_row_counter_0830 = $0830
queue_event_pointer_3a = $3a
queue_event_pointer_3c = $3C
weapons_flag_98 = $98
nb_lives_player_1_ce = $ce
nb_lives_player_2_fe = $fe
current_player_43 = $43
nb_lives_current_player_9e = $9e
game_state_25 = $25
game_sub_state_26 = $26
level_completed_flag_9f = $9f
current_player_variables_1590 = $1590
; stage number 97 is the real stage number (can go beyond 5 when game wraps)
stage_number_97 = $97
player_score_1572 = $1572
timer_fraction_of_second_5f = $5f

start_8000:
8000: 8E 32 82    LDX    #$1000
8003: 4F          CLRA
8004: 5F          CLRB
8005: B7 B1 82    STA    watchdog_3300
8008: ED A9       STD    ,X++
800A: 8C 9F 28    CMPX   #$1700
800D: 25 7E       BCS    $8005
800F: 8E 33 E2    LDX    #$11C0
8012: B7 B1 22    STA    watchdog_3300
8015: ED 03       STD    ,X++
8017: 8C 3F 88    CMPX   #$17A0
801A: 25 7E       BCS    $8012
801C: BD AA 22    JSR    $82AA
; init event queue: no events pending, all events acked
801F: 8E 36 E2    LDX    #$14C0
8022: 9F B8       STX    queue_event_pointer_3a
8024: 9F 1E       STX    queue_event_pointer_3c
8026: CC 7D D7    LDD    #$FFFF
8029: ED 09       STD    ,X++
802B: 8C 3D 28    CMPX   #$1500
802E: 25 71       BCS    $8029
8030: 9F 1C       STX    $3E
8032: 9F C2       STX    $40
8034: 7F 34 48    CLR    $16CA
8037: 7F 3E E3    CLR    $16CB
803A: BD 08 EA    JSR    $80C2
803D: BD 08 3D    JSR    $80B5
8040: 0D 07       TST    game_state_25
8042: 27 8E       BEQ    $8050
8044: 8E 36 42    LDX    #$14C0
8047: 9F 12       STX    queue_event_pointer_3a
8049: CC 77 77    LDD    #$FFFF
804C: ED AC       STD    ,X
804E: ED 8A       STD    $2,X
8050: B6 34 42    LDA    $16C0
8053: BD AB 20    JSR    install_default_highscores_8902
8056: B7 B1 28    STA    watchdog_3300
8059: BD 39 C0    JSR    $B148
805C: B7 1B 88    STA    watchdog_3300
805F: 86 60       LDA    #$42
8061: 88 02       EORA   #$80
8063: 97 00       STA    $22
8065: B7 A2 C1    STA    nop_2043
8068: C6 2B       LDB    #$03
806A: D8 A9       EORB   $21
806C: D7 09       STB    $21
; enable interrupts, let the game run
806E: F7 A8 66    STB    ctrl_2044
8071: 1C 6D       ANDCC  #$EF
; poll event queue
event_loop_poll_8073:
8073: 9E 1E       LDX    queue_event_pointer_3c
8075: EC 06       LDD    ,X
8077: 48          ASLA
8078: 25 D1       BCS    event_loop_poll_8073
; ack event
807A: 84 F7       ANDA   #$7F
807C: 10 8E 77 77 LDY    #$FFFF
8080: 10 AF 03    STY    ,X++
8083: 8C 36 DD    CMPX   #$14FF
8086: 23 81       BLS    $808B
8088: 8E 3C 48    LDX    #$14C0
808B: 9F 14       STX    queue_event_pointer_3c
808D: 8E 35 9C    LDX    #event_table_bd14
8090: 10 8E 02 F1 LDY    #$8073		; return to event_loop_poll_8073
8094: 34 02       PSHS   Y
8096: 6E 14       JMP    [A,X]        ; [jump_table]

8098: 86 29       LDA    #$01
809A: 20 8E       BRA    $80A2
809C: 5F          CLRB
809D: 86 8B       LDA    #$03
809F: 20 23       BRA    $80A2
80A1: 4F          CLRA
80A2: 34 92       PSHS   X
80A4: 9E 18       LDX    queue_event_pointer_3a
80A6: ED 03       STD    ,X++		; [video_address_word]
80A8: 8C 3D 88    CMPX   #$1500
80AB: 25 2B       BCS    $80B0
80AD: 8E 9C 48    LDX    #$14C0
80B0: 9F 18       STX    queue_event_pointer_3a
80B2: 35 92       PULS   X
80B4: 39          RTS
80B5: 5F          CLRB
80B6: 96 D0       LDA    $52
80B8: 84 29       ANDA   #$01
80BA: 27 89       BEQ    $80BD
80BC: 5C          INCB
80BD: D7 A2       STB    $2A
80BF: 7E A4 AC    JMP    $868E
80C2: B6 B1 21    LDA    dsw1_3303
80C5: 43          COMA
80C6: 97 D2       STA    $50
80C8: B6 19 88    LDA    dsw2_3100
80CB: 43          COMA
80CC: 97 79       STA    $51
80CE: B6 BA 22    LDA    dsw3_3200
80D1: 43          COMA
80D2: 97 D0       STA    $52
80D4: 96 72       LDA    $50
80D6: 84 8D       ANDA   #$0F
80D8: 48          ASLA
80D9: 8E 34 78    LDX    #$BCF0
80DC: EC AE       LDD    A,X
80DE: DD C1       STD    $49
80E0: 26 20       BNE    $80E4
80E2: 0C F3       INC    $71
80E4: 96 72       LDA    $50
80E6: 84 72       ANDA   #$F0
80E8: 44          LSRA
80E9: 44          LSRA
80EA: 44          LSRA
80EB: 8E 94 D8    LDX    #$BCF0
80EE: EC 0E       LDD    A,X
80F0: DD 6C       STD    $4E
80F2: 26 80       BNE    $80F6
80F4: 0C 53       INC    $71
80F6: 96 D3       LDA    $51
80F8: 84 2B       ANDA   #$03
80FA: 8E 35 38    LDX    #$BD10
80FD: A6 0E       LDA    A,X
80FF: 97 09       STA    $2B
8101: D6 D3       LDB    $51
8103: C4 2A       ANDB   #$08
8105: 4F          CLRA
8106: 58          ASLB
8107: CB 18       ADDB   #$30
8109: DD A5       STD    $2D
810B: CB 68       ADDB   #$40
810D: DD A7       STD    $2F
810F: 39          RTS
8110: CE D0 70    LDU    #$F2F2
8113: 20 27       BRA    $811A
clear_screen_8115:
8115: 8D C8       BSR    $8161
8117: CE 38 38    LDU    #$1010
811A: 4F          CLRA
811B: 5F          CLRB
811C: 8E 08 88    LDX    #scroll_x_2000
811F: ED A3       STD    ,X++
8121: ED 03       STD    ,X++
8123: ED A3       STD    ,X++
8125: ED 03       STD    ,X++
8127: 8C 08 68    CMPX   #nop_2040
812A: 25 7B       BCS    $811F
812C: 8E 28 88    LDX    #$0000
812F: 4F          CLRA
8130: 5F          CLRB
8131: ED 03       STD    ,X++       ; [video_address_word]
8133: ED A3       STD    ,X++       ; [video_address_word]
8135: ED 03       STD    ,X++       ; [video_address_word]
8137: ED A9       STD    ,X++       ; [video_address_word]
8139: ED 09       STD    ,X++       ; [video_address_word]
813B: ED A9       STD    ,X++       ; [video_address_word]
813D: ED 09       STD    ,X++       ; [video_address_word]
813F: ED A3       STD    ,X++       ; [video_address_word]
8141: 30 0B 85 D2 LEAX   $07F0,X
8145: 1F B2       TFR    U,D
8147: ED A9       STD    ,X++       ; [video_address_word]
8149: ED 09       STD    ,X++       ; [video_address_word]
814B: ED A9       STD    ,X++       ; [video_address_word]
814D: ED 09       STD    ,X++       ; [video_address_word]
814F: ED A3       STD    ,X++       ; [video_address_word]
8151: ED 03       STD    ,X++       ; [video_address_word]
8153: ED A3       STD    ,X++       ; [video_address_word]
8155: ED 03       STD    ,X++       ; [video_address_word]
8157: 30 A1 D0 88 LEAX   -$0800,X
815B: 8C 20 28    CMPX   #$0800
815E: 25 47       BCS    $812F
8160: 39          RTS
8161: CC 82 82    LDD    #$0000
8164: 8E 33 42    LDX    #$11C0
8167: ED A9       STD    ,X++
8169: ED 09       STD    ,X++
816B: ED A9       STD    ,X++
816D: ED 09       STD    ,X++
816F: ED A3       STD    ,X++
8171: ED 03       STD    ,X++
8173: ED A3       STD    ,X++
8175: ED 03       STD    ,X++
8177: 8C 3C E8    CMPX   #$14C0
817A: 25 63       BCS    $8167
817C: 39          RTS

817D: 10 CE 9F D2 LDS    #$17F0                                       
8181: BD 00 3D    JSR    $82BF                                                                           
8184: C6 32       LDB    #$10
8186: BD 00 84    JSR    $82AC
8189: C6 9D       LDB    #$15
818B: BD AA F2    JSR    $82DA
818E: C6 9C       LDB    #$14
8190: 20 2C       BRA    $81A0
8192: 10 CE 35 D2 LDS    #$17F0
8196: BD 00 97    JSR    $82BF
8199: C6 98       LDB    #$10
819B: BD AA 84    JSR    $82AC
819E: C6 9B       LDB    #$13
81A0: BD A0 58    JSR    $82DA
81A3: BD A0 BC    JSR    $829E

reset_81a6:
81A6: 10 CE 3F D8 LDS    #$17F0		; set stack
81AA: 7E 27 8A    JMP    continue_boot_afa2

resume_boot_81ad:
81AD: 86 8A       LDA    #$02
81AF: B7 02 61    STA    nop_2043		; does nothing?
81B2: 5F          CLRB
81B3: 4F          CLRA
81B4: FD 02 C2    STD    nop_2040
81B7: 86 2A       LDA    #$02
81B9: B7 A8 CA    STA    scroll_dir_2042	; horizontal scroll
; reset row scroll registers
81BC: 8E 08 88    LDX    #scroll_x_2000
81BF: C6 62       LDB    #$40
81C1: 4F          CLRA
81C2: A7 02       STA    ,X+
81C4: 5A          DECB
81C5: 26 79       BNE    $81C2
81C7: F6 1A 28    LDB    dsw3_3200
81CA: 54          LSRB
81CB: 25 2A       BCS    $81CF
81CD: 86 80       LDA    #$08
81CF: 8E 22 22    LDX    #$0000
81D2: B7 B1 22    STA    watchdog_3300
81D5: B7 A2 C6    STA    ctrl_2044
81D8: 30 29       LEAX   $1,X
81DA: 26 7E       BNE    $81D2				; do it 65536 times...
81DC: 86 3D       LDA    #$15
81DE: 1F 03       TFR    A,DP				; set page $15 as direct page
81E0: 4F          CLRA
; now that DP has been set we can skip all this
; checksum/memtest crap and directly jump
; to $8000 to avoid slowdowns at boot

; write memory from 0 to $2000 and check it
81E1: 8E 82 82    LDX    #$0000
81E4: B7 11 82    STA    watchdog_3300
81E7: A7 AC       STA    ,X			; [video_address]
81E9: A1 08       CMPA   ,X+		; [video_address]
81EB: 26 8D       BNE    $8192		; if happens (non-zero) just reset, mem test?
81ED: 8C A8 88    CMPX   #scroll_x_2000
81F0: 25 D0       BCS    $81E4
81F2: 8B D7       ADDA   #$55
81F4: 81 76       CMPA   #$54
81F6: 26 6B       BNE    $81E1		; do it with different memory values
81F8: 4C          INCA
81F9: 81 77       CMPA   #$FF
81FB: 26 29       BNE    $81FE
; now in the other direction...
81FD: 4F          CLRA
81FE: B7 BB 22    STA    watchdog_3300
8201: A7 00       STA    ,-X
8203: A1 A6       CMPA   ,X
8205: 26 09       BNE    $8192
8207: 8C 28 28    CMPX   #$0000
820A: 22 64       BHI    $81F8
820C: 4F          CLRA
; now the scroll registers
820D: 8E A8 88    LDX    #scroll_x_2000
8210: B7 11 82    STA    watchdog_3300
8213: A7 A6       STA    ,X
8215: A1 02       CMPA   ,X+
8217: 10 26 D7 EA LBNE   $817D
821B: 8C 08 08    CMPX   #$2020
821E: 25 78       BCS    $8210
8220: 8B 77       ADDA   #$55
8222: 81 D6       CMPA   #$54
8224: 26 C5       BNE    $820D
8226: 4C          INCA
8227: 81 D7       CMPA   #$FF
8229: 26 89       BNE    $822C
822B: 4F          CLRA
822C: B7 1B 88    STA    watchdog_3300
822F: A7 A0       STA    ,-X
8231: A1 06       CMPA   ,X
8233: 10 26 DD C4 LBNE   $817D
8237: 8C 08 28    CMPX   #scroll_x_2000
823A: 22 62       BHI    $8226
823C: C6 38       LDB    #$10
823E: 8D E4       BSR    $82AC
8240: CE E6 DE    LDU    #$C45C
8243: 10 8E 22 82 LDY    #$0000
; ROM checksum
8247: 8E 68 28    LDX    #speech_4000
824A: 4F          CLRA
824B: 5F          CLRB
824C: B7 1B 88    STA    watchdog_3300
824F: EB 80       ADDB   ,-Y
8251: 89 82       ADCA   #$00
8253: 30 3D       LEAX   -$1,X
8255: 26 77       BNE    $824C
8257: 10 A3 EB    CMPD   ,--U		; test checksum here: 3FC7 in C458
825A: 34 89       PSHS   CC			; save comparison result for later, pushing on stack never popping!
825C: 11 83 4C D0 CMPU   #$C458
8260: 26 C7       BNE    $8247	
; ROM checksum address correct, proceed	
8262: BD 00 9D    JSR    $82BF
8265: C6 90       LDB    #$12
8267: BD AA F2    JSR    $82DA
826A: 8E 82 BA    LDX    #$0A92
826D: 35 89       PULS   CC
; if checksum correct, continue
826F: 27 29       BEQ    $827C
8271: CC 90 93    LDD    #$1211
8274: A7 A6       STA    ,X
8276: E7 83       STB    $1,X
8278: 86 3C       LDA    #$14
827A: A7 8A       STA    $2,X
; continue do shit
827C: 30 A1 88 08 LEAX   $0080,X
8280: 8C 29 10    CMPX   #$0B92
8283: 26 CA       BNE    $826D
8285: A6 FD       LDA    -$1,S
8287: 84 2C       ANDA   #$04
8289: 10 27 77 31 LBEQ   $81A6
828D: A6 F6       LDA    -$2,S
828F: 84 26       ANDA   #$04
8291: 10 27 7D 33 LBEQ   $81A6
8295: 8D 85       BSR    $829E
8297: 8D 39       BSR    $82AA
8299: 8D 8B       BSR    $829E
829B: 7E A8 28    JMP    start_8000		; really start game now

829E: 8E 88 22    LDX    #$0000
82A1: B7 B1 82    STA    watchdog_3300
82A4: 3D          MUL
82A5: 30 9D       LEAX   -$1,X
82A7: 26 D0       BNE    $82A1
82A9: 39          RTS
82AA: C6 77       LDB    #$FF
82AC: 8E 20 88    LDX    #$0800
82AF: 4F          CLRA
; clear video ram... again
82B0: B7 11 82    STA    watchdog_3300
82B3: A7 AB DA 82 STA    -$0800,X	; [video_address]
82B7: E7 A8       STB    ,X+		; [video_address]
82B9: 8C 98 88    CMPX   #$1000
82BC: 25 DA       BCS    $82B0
82BE: 39          RTS
82BF: 86 20       LDA    #$02
82C1: B7 A2 C1    STA    nop_2043
82C4: 5F          CLRB
82C5: 4F          CLRA
82C6: FD A2 68    STD    nop_2040
82C9: 86 8A       LDA    #$02
82CB: B7 08 6A    STA    scroll_dir_2042
82CE: 8E A8 22    LDX    #scroll_x_2000
82D1: C6 C2       LDB    #$40
82D3: 4F          CLRA
82D4: A7 A2       STA    ,X+
82D6: 5A          DECB
82D7: 26 D3       BNE    $82D4
82D9: 39          RTS

82DA: 86 9D       LDA    #$15
82DC: 1F A3       TFR    A,DP			; set DP to $15xx
82DE: 8E 35 02    LDX    #$BD20
82E1: 58          ASLB
82E2: 25 A3       BCS    $8305
82E4: EE A7       LDU    B,X
82E6: 5F          CLRB
82E7: A6 EC       LDA    ,U
82E9: 81 8F       CMPA   #$07
82EB: 22 2A       BHI    $82EF
82ED: E6 48       LDB    ,U+
82EF: AE E3       LDX    ,U++
82F1: A6 42       LDA    ,U+
82F3: 81 1D       CMPA   #$3F
82F5: 27 AD       BEQ    $8326
82F7: 81 07       CMPA   #$2F
82F9: 27 63       BEQ    $82E6
82FB: 80 18       SUBA   #$30
82FD: E7 01 70 22 STB    -$0800,X	; [video_address]
8301: A7 02       STA    ,X+	; [video_address]
8303: 20 CE       BRA    $82F1
8305: EE 07       LDU    B,X
8307: 5F          CLRB
8308: A6 EC       LDA    ,U
830A: 81 8F       CMPA   #$07
830C: 22 2A       BHI    $8310
830E: E6 48       LDB    ,U+
8310: AE E3       LDX    ,U++
8312: A6 42       LDA    ,U+
8314: 81 1D       CMPA   #$3F
8316: 27 8C       BEQ    $8326
8318: 81 07       CMPA   #$2F
831A: 27 63       BEQ    $8307
831C: 86 38       LDA    #$10
831E: E7 01 DA 22 STB    -$0800,X	; [video_address]
8322: A7 02       STA    ,X+		; [video_address]
8324: 20 CE       BRA    $8312
8326: 39          RTS

8327: 96 0D       LDA    game_state_25
8329: 81 8A       CMPA   #$02
832B: 27 3E       BEQ    $8343
832D: 4F          CLRA
832E: D6 AC       LDB    $24
8330: 54          LSRB
8331: 54          LSRB
8332: 54          LSRB
8333: 54          LSRB
8334: 8E 2D DE    LDX    #$0F5C
8337: 8D 2C       BSR    $833D
8339: D6 AC       LDB    $24
833B: C4 27       ANDB   #$0F
833D: A7 01 70 22 STA    -$0800,X		; [video_address]
8341: E7 02       STB    ,X+			; [video_address]
8343: 39          RTS
8344: 0D 66       TST    $44
8346: 27 79       BEQ    $8343
8348: 58          ASLB
8349: 8E 49 F8    LDX    #$C170
834C: 10 AE 0D    LDY    B,X
834F: 8E 37 57    LDX    #$1575
8352: 96 C1       LDA    current_player_43
8354: 27 20       BEQ    $8358
8356: 30 81       LEAX   $3,X
8358: A6 AA       LDA    ,-X
835A: AB 2A       ADDA   ,-Y
835C: 19          DAA
835D: A7 0C       STA    ,X
835F: A6 A0       LDA    ,-X
8361: A9 20       ADCA   ,-Y
8363: 19          DAA
8364: A7 A6       STA    ,X
8366: A6 00       LDA    ,-X
8368: A9 8A       ADCA   ,-Y
836A: 19          DAA
836B: A7 AC       STA    ,X
836D: 24 81       BCC    $8378
836F: CC BB B2    LDD    #$9990
8372: A7 06       STA    ,X
8374: ED 23       STD    $1,X
8376: 20 AF       BRA    $83A5
8378: EC AC       LDD    ,X
837A: 10 93 B4    CMPD   $9C
837D: 25 AE       BCS    $83A5
837F: 96 BF       LDA    $9D
8381: 9B B2       ADDA   $30
8383: 19          DAA
8384: 1F AB       TFR    A,B
8386: 96 1E       LDA    $9C
8388: 99 07       ADCA   $2F
838A: 19          DAA
838B: DD B4       STD    $9C
838D: BD 1B CF    JSR    $9347
8390: 96 BC       LDA    nb_lives_current_player_9e
8392: 81 7D       CMPA   #$FF
8394: 27 2D       BEQ    $83A5
8396: 0C 1C       INC    nb_lives_current_player_9e
8398: 96 B6       LDA    nb_lives_current_player_9e
839A: 81 8F       CMPA   #$07
839C: 22 2F       BHI    $83A5
839E: 34 B8       PSHS   Y,X
83A0: BD A6 BD    JSR    $843F
83A3: 35 12       PULS   X,Y
83A5: EC 06       LDD    ,X
83A7: 10 93 56    CMPD   $7E
83AA: 22 80       BHI    $83B4
83AC: 25 31       BCS    $83C7
83AE: E6 8A       LDB    $2,X
83B0: D1 A2       CMPB   $80
83B2: 23 91       BLS    $83C7
83B4: CE 37 FC    LDU    #$157E
83B7: EC AC       LDD    ,X
83B9: ED 4C       STD    ,U
83BB: E6 2A       LDB    $2,X
83BD: E7 CA       STB    $2,U
83BF: CE 37 5C    LDU    #$157E
83C2: 8E 8A B2    LDX    #$0890
83C5: 8D 92       BSR    $83D7
83C7: 8E 20 AC    LDX    #$0884
83CA: CE 9D 5A    LDU    #player_score_1572
83CD: 96 CB       LDA    current_player_43
83CF: 27 24       BEQ    $83D7
83D1: 8E 8A 46    LDX    #$08C4
83D4: CE 37 F7    LDU    #$1575
83D7: A6 EC       LDA    ,U
83D9: 26 80       BNE    $83E3
83DB: 86 38       LDA    #$10
83DD: 8D DA       BSR    write_and_advance_8431
83DF: 8D 72       BSR    write_and_advance_8431
83E1: 20 8C       BRA    $83F1
83E3: 44          LSRA
83E4: 44          LSRA
83E5: 44          LSRA
83E6: 44          LSRA
83E7: 26 2A       BNE    $83EB
83E9: 86 98       LDA    #$10
83EB: 8D 6C       BSR    write_and_advance_8431
83ED: A6 4C       LDA    ,U
83EF: 8D 1C       BSR    write_digit_842f
83F1: A6 46       LDA    ,U
83F3: AA 63       ORA    $1,U
83F5: 26 8A       BNE    $83FF
83F7: 86 38       LDA    #$10
83F9: 8D BE       BSR    write_and_advance_8431
83FB: 8D 1C       BSR    write_and_advance_8431
83FD: 20 9C       BRA    $8413
83FF: A6 63       LDA    $1,U
8401: 44          LSRA
8402: 44          LSRA
8403: 44          LSRA
8404: 44          LSRA
8405: 26 84       BNE    $840D
8407: 6D EC       TST    ,U
8409: 26 8A       BNE    $840D
840B: 86 38       LDA    #$10
840D: 8D AA       BSR    write_and_advance_8431
840F: A6 63       LDA    $1,U
8411: 8D 9E       BSR    write_digit_842f
8413: A6 E6       LDA    ,U
8415: AA C3       ORA    $1,U
8417: 27 20       BEQ    write_2_digits_8421
8419: A6 CA       LDA    $2,U
841B: 44          LSRA
841C: 44          LSRA
841D: 44          LSRA
841E: 44          LSRA
841F: 20 28       BRA    write_2_digits_842b

write_2_digits_8421:
8421: A6 C0       LDA    $2,U
8423: 44          LSRA
8424: 44          LSRA
8425: 44          LSRA
8426: 44          LSRA
8427: 26 2A       BNE    write_2_digits_842b
8429: 86 98       LDA    #$10
write_2_digits_842b:
842B: 8D 2C       BSR    write_and_advance_8431
842D: A6 CA       LDA    $2,U
write_digit_842f:
842F: 84 2D       ANDA   #$0F
write_and_advance_8431:
8431: A7 02       STA    ,X+		; [video_address]
8433: 39          RTS

8434: A6 3C       LDA    -$2,X		; [video_address]
8436: 81 92       CMPA   #$10
8438: 26 2A       BNE    $843C
843A: A7 97       STA    -$1,X		; [video_address]
843C: 6F AC       CLR    ,X			; [video_address]
843E: 39          RTS
843F: CC 22 25    LDD    #$0007
8442: 1F 80       TFR    D,Y
8444: CC 32 92    LDD    #$1010
8447: 8D 3C       BSR    $845D
8449: D6 16       LDB    nb_lives_current_player_9e
844B: 5D          TSTB
844C: 27 D8       BEQ    $843E
844E: 5A          DECB
844F: 27 CF       BEQ    $843E
8451: C1 85       CMPB   #$07
8453: 25 20       BCS    $8457
8455: C6 85       LDB    #$07
8457: 4F          CLRA
8458: 1F 2A       TFR    D,Y
845A: CC 58 F9    LDD    #$D0D1
845D: 34 A8       PSHS   Y
845F: 8E 2A BC    LDX    #$089E
8462: A7 06       STA    ,X			; [video_address]
8464: E7 AA C2    STB    $40,X		; [video_address]
8467: 30 37       LEAX   -$1,X
8469: 31 B7       LEAY   -$1,Y
846B: 26 DD       BNE    $8462
846D: 35 A8       PULS   Y
846F: 8E 22 BC    LDX    #$009E
8472: 6F 06       CLR    ,X			; [video_address]
8474: 6F AA C2    CLR    $40,X      ; [video_address]
8477: 30 37       LEAX   -$1,X
8479: 31 B7       LEAY   -$1,Y
847B: 26 DD       BNE    $8472
847D: 39          RTS
847E: DC 2F       LDD    $A7
8480: 10 83 89 C2 CMPD   #$0B40
8484: 10 27 83 D8 LBEQ   $85E2
8488: 10 83 81 E8 CMPD   #$0960
848C: 26 2B       BNE    $8491
848E: BD 1B C8    JSR    $93EA
8491: 7A 90 86    DEC    $1204
8494: 7A 30 96    DEC    $1214
8497: 7A 3A 0C    DEC    $1224
849A: 7A 9A 1C    DEC    $1234
849D: 7A 9A CC    DEC    $1244
84A0: 7A 30 D6    DEC    $1254
84A3: 7A 30 46    DEC    $1264
84A6: 7A 90 5C    DEC    $1274
84A9: 7A 9A 0C    DEC    $1284
84AC: 7A 3A 1C    DEC    $1294
84AF: 7A 30 86    DEC    $12A4
84B2: 7A 90 96    DEC    $12B4
84B5: 7A 90 46    DEC    $12C4
84B8: 7A 3A 5C    DEC    $12D4
84BB: 7A 3A CC    DEC    $12E4
84BE: 7A 9A D6    DEC    $12F4
84C1: 7A 91 86    DEC    $1304
84C4: 7A 31 96    DEC    $1314
84C7: 7A 3B 0C    DEC    $1324
84CA: 7A 9B 1C    DEC    $1334
84CD: 7A 9B CC    DEC    $1344
84D0: 7A 31 D6    DEC    $1354
84D3: 7A 31 46    DEC    $1364
84D6: 7A 91 5C    DEC    $1374
84D9: 7A 9B 0C    DEC    $1384
84DC: 7A 3B 1C    DEC    $1394
84DF: 7A 31 86    DEC    $13A4
84E2: 7A 91 96    DEC    $13B4
84E5: 7A 91 46    DEC    $13C4
84E8: 7A 3B 5C    DEC    $13D4
84EB: 7A 3B CC    DEC    $13E4
84EE: 7A 9B D6    DEC    $13F4
84F1: 7A 96 86    DEC    $1404
84F4: 7A 36 96    DEC    $1414
84F7: 7A 3C 0C    DEC    $1424
84FA: 7A 9C 1C    DEC    $1434
84FD: 7A 9C CC    DEC    $1444
8500: 7A 36 D6    DEC    $1454
8503: 7A 36 46    DEC    $1464
8506: 7A 96 5C    DEC    $1474
8509: 7A 9C 0C    DEC    $1484
850C: 7A 3C 1C    DEC    $1494
850F: 7A 36 86    DEC    $14A4
8512: 7A 96 96    DEC    $14B4
8515: 20 89       BRA    $8522
8517: 86 22       LDA    #$0A
8519: 97 1D       STA    $95
851B: 8D 3B       BSR    $8530
851D: 0A 1D       DEC    $95
851F: 26 D8       BNE    $851B
8521: 39          RTS
8522: 0C 07       INC    $85
8524: 0C B0       INC    $92
8526: 96 10       LDA    $92
8528: 81 21       CMPA   #$09
852A: 26 D6       BNE    $858A
852C: 86 29       LDA    #$01
852E: 97 1A       STA    $92
8530: 9E B1       LDX    $93
8532: 30 83       LEAX   $1,X
8534: 8C 2B C2    CMPX   #$0940
8537: 25 2B       BCS    $853C
8539: 8E 81 88    LDX    #$0900
853C: 9F BB       STX    $93
853E: 96 13       LDA    $9B
8540: D6 66       LDB    $44
8542: 27 84       BEQ    $854A
8544: D6 83       LDB    $A1
8546: 26 80       BNE    $854A
8548: 86 2E       LDA    #$06
854A: CE 4C 75    LDU    #$C45D
854D: 48          ASLA
854E: EE 4E       LDU    A,U
8550: DC 85       LDD    $A7
8552: 10 83 29 62 CMPD   #$0B40
8556: 27 BB       BEQ    $8591
8558: DC B8       LDD    $90
855A: E6 43       LDB    D,U
855C: CE E3 47    LDU    #$CBCF
855F: 96 B9       LDA    $9B
8561: 48          ASLA
8562: EE 44       LDU    A,U
8564: 4F          CLRA
8565: 58          ASLB
8566: EE 49       LDU    D,U
8568: 10 8E 88 90 LDY    #$0018
856C: A6 E8       LDA    ,U+
856E: 84 B7       ANDA   #$3F
8570: 26 02       BNE    $8592
8572: A6 DD       LDA    -$1,U
8574: E6 E2       LDB    ,U+
8576: E7 06       STB    ,X			; [video_address]
8578: A7 A1 70 88 STA    -$0800,X	; [video_address]
857C: 30 A0 C8    LEAX   $40,X
857F: 31 1D       LEAY   -$1,Y
8581: 26 73       BNE    $8574
8583: DC B2       LDD    $90
8585: C3 82 83    ADDD   #$0001
8588: DD B8       STD    $90
858A: DC 2F       LDD    $A7
858C: C3 28 89    ADDD   #$0001
858F: DD 85       STD    $A7
8591: 39          RTS
8592: A6 DD       LDA    -$1,U
8594: 34 20       PSHS   A
8596: A6 DD       LDA    -$1,U
8598: 84 17       ANDA   #$3F
859A: 34 8A       PSHS   A
859C: 34 68       PSHS   U
859E: 4A          DECA
859F: CE E6 49    LDU    #$C46B
85A2: 48          ASLA
85A3: C6 3A       LDB    #$18
85A5: E0 44       SUBB   A,U
85A7: 4F          CLRA
85A8: 1F 2A       TFR    D,Y
85AA: 35 C8       PULS   U
85AC: A6 77       LDA    -$1,U
85AE: 84 48       ANDA   #$C0
85B0: E6 E2       LDB    ,U+
85B2: E7 06       STB    ,X			; [video_address]
85B4: A7 AB 7A 82 STA    -$0800,X	; [video_address]
85B8: 30 A0 C8    LEAX   $40,X
85BB: 31 17       LEAY   -$1,Y
85BD: 26 79       BNE    $85B0
85BF: 35 20       PULS   A
85C1: 4A          DECA
85C2: CE 46 49    LDU    #$C46B
85C5: 48          ASLA
85C6: 33 44       LEAU   A,U
85C8: E6 EC       LDB    ,U
85CA: 4F          CLRA
85CB: 1F 2A       TFR    D,Y
85CD: E6 C9       LDB    $1,U
85CF: 35 20       PULS   A
85D1: 84 42       ANDA   #$C0
85D3: E7 A6       STB    ,X				; [video_address]
85D5: A7 0B 7A 28 STA    -$0800,X		; [video_address]
85D9: 30 00 C8    LEAX   $40,X
85DC: 31 17       LEAY   -$1,Y
85DE: 26 7B       BNE    $85D3
85E0: 20 83       BRA    $8583
85E2: 96 07       LDA    $85
85E4: 27 39       BEQ    $8601
85E6: C6 9A       LDB    #$18
85E8: 8E 08 8C    LDX    #$2004
85EB: 6C A8       INC    ,X+
85ED: 5A          DECB
85EE: 26 73       BNE    $85EB
85F0: B6 02 86    LDA    $2004
85F3: 26 28       BNE    $85FF
85F5: C6 9A       LDB    #$18
85F7: 8E 08 0C    LDX    #$2024
85FA: 63 08       COM    ,X+
85FC: 5A          DECB
85FD: 26 73       BNE    $85FA
85FF: 0F A7       CLR    $85
8601: 39          RTS
8602: 8D CB       BSR    $864D
8604: D6 BA       LDB    weapons_flag_98
8606: 4F          CLRA
8607: 1F 2A       TFR    D,Y
8609: CE 49 12    LDU    #$C19A
860C: 8E 27 89    LDX    #$0F01
860F: 8D 0C       BSR    $863F
8611: 30 0A 40    LEAX   -$3E,X
8614: 31 1D       LEAY   -$1,Y
8616: 26 75       BNE    $860F
8618: C6 2C       LDB    #$04
861A: D0 10       SUBB   weapons_flag_98
861C: 26 2C       BNE    $8622
861E: 20 96       BRA    $863E
8620: C6 21       LDB    #$03
8622: 4F          CLRA
8623: 1F 20       TFR    D,Y
8625: 34 A2       PSHS   Y
8627: 8E 27 31    LDX    #$0F19
862A: 86 18       LDA    #$90
862C: 8D 2F       BSR    $8635
862E: 35 A8       PULS   Y
8630: 8E 25 9B    LDX    #$0719
8633: 86 62       LDA    #$40
8635: 8D B9       BSR    $8672
8637: 30 A0 9A    LEAX   -$4E,X
863A: 31 B7       LEAY   -$1,Y
863C: 26 DF       BNE    $8635
863E: 39          RTS
863F: 8D 21       BSR    $8644
8641: 30 0A B8    LEAX   queue_event_pointer_3a,X
8644: 8D 20       BSR    $8648
8646: 8D 82       BSR    $8648
8648: EC E9       LDD    ,U++
864A: ED 09       STD    ,X++		; [video_address_word]
864C: 39          RTS
864D: D6 10       LDB    weapons_flag_98
864F: 4F          CLRA
8650: 1F 20       TFR    D,Y
8652: 8E 85 23    LDX    #$0701
8655: 8D 9B       BSR    $8670
8657: 30 A0 EA    LEAX   -$3E,X
865A: 31 B7       LEAY   -$1,Y
865C: 26 DF       BNE    $8655
865E: B6 98 E4    LDA    $10C6
8661: 27 83       BEQ    $8664
8663: 4A          DECA
8664: 8E 25 83    LDX    #$0701
8667: C6 20       LDB    #$08
8669: 3D          MUL
866A: 30 03       LEAX   D,X
866C: 86 2B       LDA    #$03
866E: 20 8A       BRA    $8672
8670: 86 26       LDA    #$04
8672: 1F 0B       TFR    A,B
8674: 8D 21       BSR    $8679
8676: 30 0A 12    LEAX   queue_event_pointer_3a,X
8679: ED 09       STD    ,X++		; [video_address_word
867B: ED A9       STD    ,X++		; [video_address_word
867D: ED 09       STD    ,X++		; [video_address_word
867F: 39          RTS
8680: 96 73       LDA    $51
8682: 84 86       ANDA   #$04
8684: 26 2A       BNE    $868E
8686: 96 C1       LDA    current_player_43
8688: 27 2C       BEQ    $868E
868A: 96 CA       LDA    $42
868C: 26 22       BNE    $8698
868E: 96 A2       LDA    $2A
8690: 26 28       BNE    $869C
8692: 96 A3       LDA    $21
8694: 84 D5       ANDA   #$F7
8696: 20 92       BRA    $86A8
8698: 96 02       LDA    $2A
869A: 26 7E       BNE    $8692
869C: 96 09       LDA    $21
869E: 47          ASRA
869F: 47          ASRA
86A0: 47          ASRA
86A1: 47          ASRA
86A2: 25 84       BCS    $86AA
86A4: 96 03       LDA    $21
86A6: 88 8A       EORA   #$08
86A8: 97 09       STA    $21
86AA: 39          RTS
86AB: 96 01       LDA    $29
86AD: 48          ASLA
86AE: 8E 49 9C    LDX    #table_c1be
86B1: 6E 14       JMP    [A,X]        ; [jump_table]
86B3: BD A3 43    JSR    $8161
86B6: 0C AB       INC    $29
86B8: CC 28 88    LDD    #$0000
86BB: DD 40       STD    $68
86BD: BD 07 E9    JSR    $8F61
86C0: C6 2B       LDB    #$09
86C2: BD 02 83    JSR    $80A1
86C5: BD 11 08    JSR    $938A
86C8: 0F 42       CLR    $6A
86CA: 86 8E       LDA    #$06
86CC: 97 4C       STA    $64
86CE: CC 88 D8    LDD    #$00FA
86D1: DD DD       STD    timer_fraction_of_second_5f
86D3: 39          RTS
86D4: DC 7D       LDD    timer_fraction_of_second_5f
86D6: 83 82 29    SUBD   #$0001
86D9: DD D7       STD    timer_fraction_of_second_5f
86DB: 26 2D       BNE    $86E2
86DD: 0C A1       INC    $29
86DF: 7F 32 E2    CLR    $10C0
86E2: 39          RTS
86E3: BD A3 35    JSR    $8117
86E6: 0C AB       INC    $29
86E8: 39          RTS
86E9: 8E 9D FD    LDX    #$1575
86EC: 96 79       LDA    $51
86EE: 84 8C       ANDA   #$04
86F0: 26 20       BNE    $86F4
86F2: 8D 26       BSR    $8698
86F4: 96 48       LDA    $6A
86F6: 26 87       BNE    $86FD
86F8: 8E 3D FA    LDX    #player_score_1572
86FB: 8D B9       BSR    $868E
86FD: CE 9E A8    LDU    #high_scores_1620
8700: 86 28       LDA    #$0A
8702: 97 E3       STA    $61
8704: EC A6       LDD    ,X
8706: 10 A3 EC    CMPD   ,U
8709: 22 BB       BHI    $873E
870B: 25 20       BCS    $8715
870D: E6 8A       LDB    $2,X
870F: E1 60       CMPB   $2,U
8711: 25 80       BCS    $8715
8713: 20 0B       BRA    $873E
8715: 33 CA       LEAU   $8,U
8717: 0A 49       DEC    $61
8719: 26 61       BNE    $8704
871B: 7E AF F5    JMP    $87DD
871E: CE 9E 42    LDU    #$1660
8721: 96 E3       LDA    $61
8723: 4A          DECA
8724: 97 7D       STA    timer_fraction_of_second_5f
8726: 27 94       BEQ    $873E
8728: EC EC       LDD    ,U
872A: ED C0       STD    $8,U
872C: EC 6A       LDD    $2,U
872E: ED C2       STD    $A,U
8730: EC 66       LDD    $4,U
8732: ED CE       STD    $C,U
8734: EC 64       LDD    $6,U
8736: ED CC       STD    $E,U
8738: 33 70       LEAU   -$8,U
873A: 0A D7       DEC    timer_fraction_of_second_5f
873C: 26 C2       BNE    $8728
873E: 0C A1       INC    $29
8740: 39          RTS
8741: 96 E3       LDA    $61
8743: CE 34 4A    LDU    #$1668
8746: 4A          DECA
8747: 27 2D       BEQ    $874E
8749: 33 D0       LEAU   -$8,U
874B: 4A          DECA
874C: 26 D3       BNE    $8749
874E: 8E 9D 57    LDX    #$1575
8751: 96 E8       LDA    $6A
8753: 26 21       BNE    $8758
8755: 8E 97 F0    LDX    #player_score_1572
8758: EC AC       LDD    ,X
875A: ED 4C       STD    ,U
875C: E6 2A       LDB    $2,X
875E: E7 CA       STB    $2,U
8760: 8E 37 75    LDX    #$15F7
8763: 96 48       LDA    $6A
8765: 26 81       BNE    $876A
8767: 8E 3D EF    LDX    #$15C7
876A: A6 0C       LDA    ,X
876C: A7 6B       STA    $3,U
876E: 8E 86 62    LDX    #$0E40
8771: 96 E3       LDA    $61
8773: 4A          DECA
8774: 27 24       BEQ    $877C
8776: 30 0A A8    LEAX   -$80,X
8779: 4A          DECA
877A: 26 72       BNE    $8776
877C: 30 A0 9D    LEAX   $15,X
877F: 9F 4A       STX    $68
8781: 33 C7       LEAU   $5,U
8783: DF 44       STU    $66
8785: CC 92 92    LDD    #$1010
8788: ED EC       STD    ,U
878A: A7 CA       STA    $2,U
878C: 20 3B       BRA    $87A1
878E: BD 00 BD    JSR    $889F
8791: CC BE A3    LDD    #$3C21
8794: DD 7D       STD    timer_fraction_of_second_5f
8796: 86 81       LDA    #$03
8798: 97 49       STA    $61
879A: 9E E0       LDX    $68
879C: 30 A0 63    LEAX   -$15,X
879F: 9F 40       STX    $62
87A1: 0C AB       INC    $29
87A3: 39          RTS

highscore_name_entry_87a4:
87A4: 96 7D       LDA    timer_fraction_of_second_5f
87A6: 47          ASRA
87A7: 24 3B       BCC    $87BC
87A9: 47          ASRA
87AA: 24 83       BCC    $87B7
87AC: 9E 4A       LDX    $62
; blank
87AE: CC 98 32    LDD    #$1010
87B1: ED 80       STD    $2,X	; [video_address_word]
87B3: ED 26       STD    $4,X	; [video_address_word]
87B5: 20 87       BRA    $87BC

87B7: C6 37       LDB    #$1F
87B9: BD 0A 52    JSR    $82DA
87BC: 0A 77       DEC    timer_fraction_of_second_5f
87BE: 26 CB       BNE    $8803
87C0: 86 1E       LDA    #$3C		; aka 60
87C2: 97 DD       STA    timer_fraction_of_second_5f
87C4: 96 42       LDA    $60
87C6: 8B 1B       ADDA   #$99
87C8: 19          DAA
87C9: 97 E8       STA    $60
; write highscore timer
87CB: 8E 26 F5    LDX    #$0EDD		; location of the time
87CE: CE 9D 7C    LDU    #$155E
87D1: BD 06 A3    JSR    write_2_digits_8421
87D4: 96 42       LDA    $60
87D6: 26 A9       BNE    $8803
87D8: BD BB EA    JSR    stop_music_9362
87DB: 20 EC       BRA    $87A1
87DD: D6 0B       LDB    $83
87DF: 27 32       BEQ    $87F1
87E1: 0A 01       DEC    $83
87E3: 7C 32 E2    INC    $10C0
87E6: 0C E8       INC    $6A
87E8: 86 2A       LDA    #$02
87EA: 97 A1       STA    $29
87EC: 86 2E       LDA    #$06
87EE: 97 EC       STA    $64
87F0: 39          RTS
87F1: BD 11 84    JSR    $9306
87F4: 4F          CLRA
87F5: 5F          CLRB
87F6: DD A7       STD    game_state_25
87F8: DD 0F       STD    $27
87FA: 97 A1       STA    $29
87FC: 96 0C       LDA    $24
87FE: 26 8A       BNE    $8802
8800: 97 66       STA    $44
8802: 39          RTS
8803: CE 37 76    LDU    #$1554
8806: 8E 97 4C    LDX    #$1564
8809: B6 98 48    LDA    $10C0
880C: 27 27       BEQ    $881D
880E: 96 DA       LDA    $52
8810: 84 20       ANDA   #$02
8812: 26 84       BNE    $881A
8814: 96 73       LDA    $51
8816: 84 86       ANDA   #$04
8818: 26 2B       BNE    $881D
881A: CE 9D 7D    LDU    #$1555
881D: 96 D7       LDA    timer_fraction_of_second_5f
881F: 47          ASRA
8820: 24 0E       BCC    $884E
8822: 47          ASRA
8823: 24 0B       BCC    $884E
8825: 47          ASRA
8826: 24 A4       BCC    $884E
8828: A6 EC       LDA    ,U
882A: 44          LSRA
882B: 25 21       BCS    $8836
882D: 44          LSRA
882E: 25 9C       BCS    $8844
8830: 44          LSRA
8831: 25 93       BCS    $8844
8833: 44          LSRA
8834: 24 3A       BCC    $884E
8836: 6A 06       DEC    ,X
8838: A6 AC       LDA    ,X
883A: 81 77       CMPA   #$FF
883C: 26 38       BNE    $884E
883E: 86 A8       LDA    #$20
8840: A7 A6       STA    ,X
8842: 20 88       BRA    $884E
8844: 6C A6       INC    ,X
8846: A6 06       LDA    ,X
8848: 81 09       CMPA   #$21
884A: 26 8A       BNE    $884E
884C: 6F AC       CLR    ,X
884E: A6 0C       LDA    ,X
8850: 8B 29       ADDA   #$0B
8852: 9E EA       LDX    $68
8854: A7 21       STA    $3,X	; [video_address]
8856: E6 46       LDB    ,U
8858: 96 4D       LDA    $65
885A: 26 BA       BNE    $888E
885C: 58          ASLB
885D: 58          ASLB
885E: 25 8F       BCS    $8867
8860: 58          ASLB
8861: 25 87       BCS    $8868
8863: 58          ASLB
8864: 25 21       BCS    $8869
8866: 39          RTS
8867: 4C          INCA
8868: 4C          INCA
8869: 4C          INCA
886A: 97 ED       STA    $65
886C: BD BB 6E    JSR    $93E6
886F: 96 46       LDA    $64
8871: 9E E4       LDX    $66
8873: 8B 29       ADDA   #$0B
8875: A7 02       STA    ,X+
8877: 9F 4E       STX    $66
8879: 9E E0       LDX    $68
887B: 30 29       LEAX   $1,X
887D: 9F E0       STX    $68
887F: CC 1E 03    LDD    #$3C21
8882: DD DD       STD    timer_fraction_of_second_5f
8884: 0A 43       DEC    $61
8886: 26 87       BNE    $888D
8888: BD BB EA    JSR    stop_music_9362
888B: 0C 01       INC    $29
888D: 39          RTS
888E: 47          ASRA
888F: 25 27       BCS    $8896
8891: 47          ASRA
8892: 25 81       BCS    $8897
8894: 20 20       BRA    $8898
8896: 58          ASLB
8897: 58          ASLB
8898: 58          ASLB
8899: 58          ASLB
889A: 25 8A       BCS    $889E
889C: 0F 4D       CLR    $65
889E: 39          RTS
889F: 96 60       LDA    $42
88A1: 27 89       BEQ    $88AE
88A3: C6 02       LDB    #$20
88A5: B6 92 42    LDA    $10C0
88A8: 27 29       BEQ    $88AB
88AA: 5C          INCB
88AB: BD A8 89    JSR    $80A1
88AE: C6 96       LDB    #$1E
88B0: BD A2 23    JSR    $80A1
88B3: BD B1 AC    JSR    $938E
88B6: C6 9D       LDB    #$1F
88B8: BD A8 29    JSR    $80A1
88BB: 8E 21 E0    LDX    #$09C8
88BE: 9F D7       STX    timer_fraction_of_second_5f
88C0: CE 34 A2    LDU    #high_scores_1620
88C3: DF 40       STU    $62
88C5: 86 88       LDA    #$0A
88C7: 97 49       STA    $61
88C9: 9E D7       LDX    timer_fraction_of_second_5f
88CB: DE 4A       LDU    $62
88CD: BD 0B 5F    JSR    $83D7
88D0: BD A6 B6    JSR    $8434
88D3: 9E 7D       LDX    timer_fraction_of_second_5f
88D5: DE E0       LDU    $62
88D7: 33 69       LEAU   $1,U
88D9: 30 81       LEAX   $9,X
88DB: BD AC 09    JSR    write_2_digits_8421
88DE: 9E D7       LDX    timer_fraction_of_second_5f
88E0: DE 40       LDU    $62
88E2: 30 0A 32    LEAX   $10,X
88E5: 33 C7       LEAU   $5,U
88E7: EC E9       LDD    ,U++
88E9: ED 09       STD    ,X++	; [video_address_word]
88EB: A6 EC       LDA    ,U
88ED: A7 0C       STA    ,X		; [video_address]
88EF: 9E 7D       LDX    timer_fraction_of_second_5f
88F1: 30 0B 82 A2 LEAX   $0080,X
88F5: 9F DD       STX    timer_fraction_of_second_5f
88F7: DE 4A       LDU    $62
88F9: 33 C0       LEAU   $8,U
88FB: DF 4A       STU    $62
88FD: 0A E9       DEC    $61
88FF: 26 EA       BNE    $88C9
8901: 39          RTS
install_default_highscores_8902:
8902: 10 8E 22 0A LDY    #$0028
8906: CE 94 08    LDU    #high_scores_1620
8909: 8E 49 58    LDX    #$C1D0		; highscores in ROM
890C: EC A9       LDD    ,X++
890E: ED 49       STD    ,U++
8910: 31 1D       LEAY   -$1,Y
8912: 26 7A       BNE    $890C
; copy highest score to 157E
8914: B6 34 A2    LDA    high_scores_1620
8917: 97 56       STA    $7E
8919: FC 9E A9    LDD    $1621
891C: DD 57       STD    $7F
; copy 5th middle score to 1572 wtf???
891E: B6 49 D2    LDA    $C1F0
8921: 97 F0       STA    $72
8923: FC E3 D3    LDD    $C1F1
8926: DD F1       STD    $73
8928: 39          RTS
8929: 96 E0       LDA    $68
892B: 10 26 28 02 LBNE   $89B9
892F: BD A2 BE    JSR    $809C
8932: C6 8E       LDB    #$0C
8934: BD A2 23    JSR    $80A1
8937: 8E 20 FD    LDX    #$08D5
893A: CE 9D BD    LDU    #$1595
893D: BD 0C A9    JSR    write_2_digits_8421
8940: 8E 2A 06    LDX    #$0884
8943: CE 37 50    LDU    #player_score_1572
8946: BD 01 FF    JSR    $83D7
8949: BD 0C BC    JSR    $8434
894C: CE 3D F6    LDU    #$157E
894F: 8E 2A B2    LDX    #$0890
8952: BD 01 F5    JSR    $83D7
8955: BD 06 B6    JSR    $8434
8958: BD B9 0F    JSR    $9187
895B: 96 6A       LDA    $42
895D: 27 8E       BEQ    $8965
895F: BD A1 F3    JSR    $83D1
8962: BD 06 16    JSR    $8434
8965: 4F          CLRA
8966: 9E 25       LDX    $A7
8968: 8C 2B 2A    CMPX   #$03A2
896B: 25 2F       BCS    $8974
896D: 8C 8F EA    CMPX   #$0762
8970: 25 23       BCS    $8973
8972: 4C          INCA
8973: 4C          INCA
8974: D6 83       LDB    $A1
8976: 26 87       BNE    $897D
8978: 8E EA B3    LDX    #$C23B
897B: 20 20       BRA    $8985
897D: 8E 4A A8    LDX    #$C220
8980: C6 2B       LDB    #$09
8982: 3D          MUL
8983: 30 A9       LEAX   D,X
8985: EC 03       LDD    ,X++
8987: DD B8       STD    $90
8989: A6 08       LDA    ,X+
898B: 97 BA       STA    $92
898D: EC 09       LDD    ,X++
898F: DD B1       STD    $93
8991: EC 03       LDD    ,X++
8993: DD 85       STD    $A7
8995: C6 9A       LDB    #$18
8997: CE 08 2C    LDU    #$2004
899A: A6 0C       LDA    ,X
899C: A7 E8       STA    ,U+
899E: 5A          DECB
899F: 26 DB       BNE    $899A
89A1: B6 A2 86    LDA    $2004
89A4: 26 2E       BNE    $89B2
89A6: C6 9A       LDB    #$18
89A8: CE 08 AC    LDU    #$2024
89AB: A6 29       LDA    $1,X
89AD: A7 48       STA    ,U+
89AF: 5A          DECB
89B0: 26 DB       BNE    $89AB
89B2: 86 73       LDA    #$F1
89B4: 97 7D       STA    timer_fraction_of_second_5f
89B6: 0C EA       INC    $68
89B8: 39          RTS
89B9: 96 E0       LDA    $68
89BB: 81 2C       CMPA   #$04
89BD: 27 8E       BEQ    $89C5
89BF: BD A7 35    JSR    $8517
89C2: 0C EA       INC    $68
89C4: 39          RTS
89C5: D6 23       LDB    $A1
89C7: 26 2E       BNE    $89CF
89C9: 0A D7       DEC    timer_fraction_of_second_5f
89CB: 26 50       BNE    $8A45
89CD: 20 91       BRA    $89E8
89CF: 96 80       LDA    $A2
89D1: 27 93       BEQ    $89E4
89D3: BD B6 00    JSR    $9422
89D6: 96 21       LDA    $A3
89D8: 26 2D       BNE    $89DF
89DA: BD 1B 42    JSR    $936A
89DD: 20 8D       BRA    $89E4
89DF: BD B1 B9    JSR    $939B
89E2: 0F 21       CLR    $A3
89E4: 86 DD       LDA    #$FF
89E6: 97 20       STA    $A2
89E8: 86 08       LDA    #$20
89EA: 97 D7       STA    timer_fraction_of_second_5f
89EC: 0C 00       INC    $28
89EE: 0F A1       CLR    $29
89F0: 0F A7       CLR    $85
89F2: 4F          CLRA
89F3: 5F          CLRB
89F4: DD 89       STD    $AB
89F6: D6 23       LDB    $A1
89F8: 10 27 88 C0 LBEQ   $8A44
89FC: BD AE 8A    JSR    $8602
89FF: CC B2 B2    LDD    #$9090
8A02: FD 8D 25    STD    $0F07
8A05: FD 8D 8D    STD    $0F0F
8A08: FD 27 9F    STD    $0F17
8A0B: FD 27 6F    STD    $0F47
8A0E: FD 87 6D    STD    $0F4F
8A11: FD 8D D5    STD    $0F57
8A14: CC 62 C2    LDD    #$4040
8A17: FD 2F 2F    STD    $0707
8A1A: FD 8F 27    STD    $070F
8A1D: FD 8F 9F    STD    $0717
8A20: FD 25 C5    STD    $0747
8A23: FD 25 6D    STD    $074F
8A26: FD 85 7F    STD    $0757
8A29: C6 90       LDB    #$18
8A2B: 8E 08 2C    LDX    #$2004
8A2E: A6 0C       LDA    ,X
8A30: 8B D2       ADDA   #$F0
8A32: A7 02       STA    ,X+
8A34: 5A          DECB
8A35: 26 75       BNE    $8A2E
8A37: B6 08 2C    LDA    $2004
8A3A: C6 90       LDB    #$18
8A3C: 8E 08 AC    LDX    #$2024
8A3F: 63 A2       COM    ,X+
8A41: 5A          DECB
8A42: 26 79       BNE    $8A3F
8A44: 39          RTS
8A45: 96 DD       LDA    timer_fraction_of_second_5f
8A47: 81 D8       CMPA   #$F0
8A49: 26 8B       BNE    $8A4E
8A4B: BD A1 D4    JSR    $89FC
8A4E: BD 19 7C    JSR    $915E
8A51: BD 1C 6C    JSR    $9EEE
8A54: 7E A7 60    JMP    $85E2

irq_8a57:
8A57: 86 3D       LDA    #$15
8A59: 1F 03       TFR    A,DP
8A5B: 96 09       LDA    $21
8A5D: 84 75       ANDA   #$FD
8A5F: 97 03       STA    $21
8A61: B7 A2 C6    STA    ctrl_2044
8A64: B7 11 82    STA    watchdog_3300
8A67: 96 0A       LDA    $22
8A69: B7 A8 CB    STA    nop_2043
8A6C: 0C 1E       INC    $36
8A6E: 8D 85       BSR    $8A7D
8A70: BD B0 8B    JSR    $9209
8A73: 96 03       LDA    $21
8A75: 88 80       EORA   #$02
8A77: 97 09       STA    $21
8A79: B7 A8 CC    STA    ctrl_2044
8A7C: 3B          RTI
8A7D: 96 D5       LDA    $5D
8A7F: 97 7C       STA    $5E
8A81: 96 DA       LDA    $58
8A83: 97 7F       STA    $5D
8A85: DC D1       LDD    $53
8A87: DD 70       STD    $58
8A89: DC DC       LDD    $54
8A8B: DD 71       STD    $59
8A8D: 96 DD       LDA    $55
8A8F: 97 78       STA    $5A
8A91: B6 B1 82    LDA    system_3300
8A94: 43          COMA
8A95: 97 D1       STA    $53
8A97: 96 0E       LDA    game_sub_state_26
8A99: 81 89       CMPA   #$01
8A9B: 27 2C       BEQ    $8AA1
8A9D: 0D CC       TST    $44
8A9F: 27 2E       BEQ    $8AAD
8AA1: B6 B1 83    LDA    in0_3301
8AA4: 43          COMA
8AA5: 97 D6       STA    $54
8AA7: B6 1B 2A    LDA    in1_3302
8AAA: 43          COMA
8AAB: 97 7D       STA    $55
8AAD: 96 D8       LDA    $50
8AAF: 81 D2       CMPA   #$F0
8AB1: 10 24 83 0B LBCC   $8BDE
8AB5: 96 A7       LDA    game_state_25
8AB7: 81 2B       CMPA   #$03
8AB9: 10 27 89 09 LBEQ   $8BDE
8ABD: 0D F9       TST    $71
8ABF: 27 3F       BEQ    $8ADE
8AC1: 0D C6       TST    $44
8AC3: 10 26 23 95 LBNE   $8BDE
8AC7: D6 7B       LDB    $53
8AC9: C5 90       BITB   #$18
8ACB: 10 27 29 87 LBEQ   $8BDE
8ACF: 0C 66       INC    $44
8AD1: 86 84       LDA    #$06
8AD3: C5 2A       BITB   #$08
8AD5: 26 80       BNE    $8AD9
8AD7: 86 20       LDA    #$08
8AD9: C6 89       LDB    #$01
8ADB: D7 0D       STB    game_state_25
8ADD: 39          RTS

8ADE: 0D C0       TST    $48
8AE0: 27 2C       BEQ    $8AF0
8AE2: 0A CA       DEC    $48
8AE4: 96 6A       LDA    $48
8AE6: 81 86       CMPA   #$04
8AE8: 26 31       BNE    $8B03
8AEA: 96 AB       LDA    $23
8AEC: 84 D6       ANDA   #$FE
8AEE: 20 86       BRA    $8AFE
8AF0: 0D 64       TST    $46
8AF2: 27 8D       BEQ    $8B03
8AF4: 0A 64       DEC    $46
8AF6: C6 8A       LDB    #$08
8AF8: D7 60       STB    $48
8AFA: 96 AB       LDA    $23
8AFC: 88 29       EORA   #$01
8AFE: 97 AB       STA    $23
8B00: B7 12 82    STA    coin_3000
8B03: 0D 6F       TST    $4D
8B05: 27 8C       BEQ    $8B15
8B07: 0A 65       DEC    $4D
8B09: 96 C5       LDA    $4D
8B0B: 81 2C       CMPA   #$04
8B0D: 26 91       BNE    $8B28
8B0F: 96 01       LDA    $23
8B11: 84 7F       ANDA   #$FD
8B13: 20 2C       BRA    $8B23
8B15: 0D C9       TST    $4B
8B17: 27 27       BEQ    $8B28
8B19: 0A C3       DEC    $4B
8B1B: C6 20       LDB    #$08
8B1D: D7 C5       STB    $4D
8B1F: 96 01       LDA    $23
8B21: 88 80       EORA   #$02
8B23: 97 01       STA    $23
8B25: B7 B2 82    STA    coin_3000
8B28: D6 7B       LDB    $53
8B2A: DA D0       ORB    $58
8B2C: 53          COMB
8B2D: D4 D5       ANDB   $5D
8B2F: D4 7C       ANDB   $5E
8B31: C4 85       ANDB   #$07
8B33: 10 27 22 25 LBEQ   $8BDE
8B37: 34 2E       PSHS   D
8B39: 96 AD       LDA    game_state_25
8B3B: 81 2A       CMPA   #$02
8B3D: 27 8D       BEQ    $8B44
8B3F: C6 2D       LDB    #$0F
8B41: BD 02 23    JSR    $80A1
8B44: 35 24       PULS   D
8B46: 96 A6       LDA    $24
8B48: 81 B8       CMPA   #$90
8B4A: 10 24 28 B8 LBCC   $8BDE
8B4E: C5 89       BITB   #$01
8B50: 27 02       BEQ    $8B72
8B52: 0C C4       INC    $46
8B54: 0C 65       INC    $47
8B56: 96 C5       LDA    $47
8B58: 91 61       CMPA   $49
8B5A: 26 9E       BNE    $8B72
8B5C: 96 62       LDA    $4A
8B5E: 9B AC       ADDA   $24
8B60: 19          DAA
8B61: 81 13       CMPA   #$91
8B63: 25 20       BCS    $8B67
8B65: 86 12       LDA    #$90
8B67: 97 0C       STA    $24
8B69: 34 8C       PSHS   B
8B6B: BD A8 B0    JSR    $8098
8B6E: 35 8C       PULS   B
8B70: 0F 65       CLR    $47
8B72: C5 80       BITB   #$02
8B74: 27 02       BEQ    $8B96
8B76: 0C C9       INC    $4B
8B78: 0C 64       INC    $4C
8B7A: 96 C4       LDA    $4C
8B7C: 91 66       CMPA   $4E
8B7E: 26 9E       BNE    $8B96
8B80: 96 6D       LDA    $4F
8B82: 9B A6       ADDA   $24
8B84: 19          DAA
8B85: 81 13       CMPA   #$91
8B87: 25 2A       BCS    $8B8B
8B89: 86 18       LDA    #$90
8B8B: 97 0C       STA    $24
8B8D: 34 8C       PSHS   B
8B8F: BD A2 BA    JSR    $8098
8B92: 35 86       PULS   B
8B94: 0F 6E       CLR    $4C
8B96: C5 86       BITB   #$04
8B98: 27 38       BEQ    $8BAA
8B9A: 96 AC       LDA    $24
8B9C: 8B 29       ADDA   #$01
8B9E: 19          DAA
8B9F: 81 B3       CMPA   #$91
8BA1: 25 80       BCS    $8BA5
8BA3: 86 B2       LDA    #$90
8BA5: 97 A6       STA    $24
8BA7: BD A8 B0    JSR    $8098
8BAA: 0D AC       TST    $24
8BAC: 27 18       BEQ    $8BDE
8BAE: 86 89       LDA    #$01
8BB0: 97 66       STA    $44
8BB2: 96 A7       LDA    game_state_25
8BB4: 81 20       CMPA   #$02
8BB6: 27 81       BEQ    $8BBB
8BB8: BD BB DE    JSR    $9356
8BBB: 0D 6C       TST    $44
8BBD: 27 8C       BEQ    $8BC3
8BBF: 96 07       LDA    game_state_25
8BC1: 26 8D       BNE    $8BD2
8BC3: 86 23       LDA    #$01
8BC5: 97 A7       STA    game_state_25
8BC7: 97 6C       STA    $44
8BC9: 0F AE       CLR    game_sub_state_26
8BCB: 0F 0F       CLR    $27
8BCD: BD 09 E9    JSR    $8161
8BD0: 20 2E       BRA    $8BDE
8BD2: 81 80       CMPA   #$02
8BD4: 27 2A       BEQ    $8BDE
8BD6: 96 A4       LDA    game_sub_state_26
8BD8: 81 2A       CMPA   #$02
8BDA: 26 8A       BNE    $8BDE
8BDC: 0A 0E       DEC    game_sub_state_26
8BDE: 9E C8       LDX    $40
8BE0: 9C 1C       CMPX   $3E
8BE2: 27 96       BEQ    $8BF8
8BE4: A6 A2       LDA    ,X+
8BE6: B7 94 E2    STA    $16CA
8BE9: 86 89       LDA    #$01
8BEB: B7 3E E3    STA    $16CB
8BEE: 8C 9D 3D    CMPX   #$151F
8BF1: 23 81       BLS    $8BF6
8BF3: 8E 37 22    LDX    #$1500
8BF6: 9F C2       STX    $40
8BF8: 96 0D       LDA    game_state_25
8BFA: 48          ASLA
8BFB: 8E EA 6C    LDX    #table_c244
8BFE: 6E 1E       JMP    [A,X]        ; [jump_table]

8C00: 96 04       LDA    game_sub_state_26
8C02: 48          ASLA
8C03: 8E E0 6E    LDX    #table_c24c
8C06: 6E 14       JMP    [A,X]        ; [jump_table]

8C08: BD A9 9D    JSR    clear_screen_8115
8C0B: C6 D7       LDB    #$FF
8C0D: D7 D7       STB    timer_fraction_of_second_5f
8C0F: 96 04       LDA    game_sub_state_26
8C11: 27 80       BEQ    $8C15
8C13: C6 82       LDB    #$A0
8C15: D7 AE       STB    $2C
8C17: 0C 0E       INC    game_sub_state_26
8C19: 7E 0E 06    JMP    $868E
8C1C: BD 87 92    JSR    $AF1A
8C1F: 0A 7D       DEC    timer_fraction_of_second_5f
8C21: 26 81       BNE    $8C26
8C23: 0C 04       INC    game_sub_state_26
8C25: 39          RTS
8C26: 96 DD       LDA    timer_fraction_of_second_5f
8C28: 81 D6       CMPA   #$FE
8C2A: 26 71       BNE    $8C25
8C2C: CE EA 14    LDU    #$C29C
8C2F: 8E 2A A5    LDX    #$0887
8C32: 8D D3       BSR    $8C85
8C34: 8D 6E       BSR    $8C82
8C36: 8D C8       BSR    $8C82
8C38: 8D 60       BSR    $8C82
8C3A: 30 00 06    LEAX   $2E,X
8C3D: 8D B5       BSR    $8C7C
8C3F: 8D 1A       BSR    $8C79
8C41: 8D B4       BSR    $8C79
8C43: 30 AA 0A    LEAX   $28,X
8C46: 8D A9       BSR    $8C73
8C48: 8D 0E       BSR    $8C70
8C4A: 8D AC       BSR    $8C70
8C4C: 8D 0A       BSR    $8C70
8C4E: 8D A8       BSR    $8C70
8C50: 30 AA A4    LEAX   game_sub_state_26,X
8C53: 8D 37       BSR    $8C6A
8C55: 30 0A A1    LEAX   $23,X
8C58: 8D 38       BSR    $8C6A
8C5A: 30 00 0C    LEAX   $24,X
8C5D: 8D 83       BSR    $8C6A
8C5F: BD B2 7D    JSR    draw_title_road_905f
8C62: C6 A6       LDB    #$24
8C64: BD AE 70    JSR    $8CF2
8C67: 7E B9 BD    JMP    $9195
8C6A: 10 8E 28 26 LDY    #$000E
8C6E: 20 91       BRA    $8C89
8C70: 30 AA A4    LEAX   game_sub_state_26,X
8C73: 10 8E 22 8F LDY    #$000D
8C77: 20 38       BRA    $8C89
8C79: 30 00 A4    LEAX   $2C,X
8C7C: 10 8E 88 82 LDY    #$000A
8C80: 20 25       BRA    $8C89
8C82: 30 0A 0C    LEAX   $2E,X
8C85: 10 8E 82 21 LDY    #$0009
8C89: EC 49       LDD    ,U++
8C8B: ED A9       STD    ,X++		; [video_address_word]
8C8D: 31 B7       LEAY   -$1,Y
8C8F: 26 DA       BNE    $8C89
8C91: 39          RTS
8C92: 0A AE       DEC    $2C
8C94: 26 27       BNE    $8C9B
8C96: 0C A4       INC    game_sub_state_26
8C98: 0F 19       CLR    $31
8C9A: 39          RTS
8C9B: 96 04       LDA    $2C
8C9D: 81 12       CMPA   #$9A
8C9F: 26 DB       BNE    $8C9A
8CA1: BD 0A 34    JSR    $88B6
8CA4: 7E AE 77    JMP    $8CF5
8CA7: 96 04       LDA    $2C
8CA9: 81 28       CMPA   #$A0
8CAB: 26 0A       BNE    $8CCF
8CAD: 96 CC       LDA    $44
8CAF: 26 3F       BNE    $8CCE
8CB1: 8E 40 DC    LDX    #$C25E
8CB4: 0C 13       INC    $31
8CB6: 96 B3       LDA    $31
8CB8: 81 2A       CMPA   #$02
8CBA: 26 8A       BNE    $8CBE
8CBC: 0F 19       CLR    $31
8CBE: D6 B9       LDB    $31
8CC0: 58          ASLB
8CC1: AE 07       LDX    B,X
8CC3: 9F 4E       STX    $6C
8CC5: 86 83       LDA    #$01
8CC7: 97 04       STA    $2C
8CC9: 97 F8       STA    $70
8CCB: BD A5 5F    JSR    $8D77
8CCE: 39          RTS
8CCF: 9E 4E       LDX    $6C
8CD1: A6 83       LDA    $1,X
8CD3: D6 52       LDB    $70
8CD5: C4 85       ANDB   #$07
8CD7: 26 2A       BNE    $8CDB
8CD9: 84 67       ANDA   #$EF
8CDB: 97 7C       STA    $54
8CDD: 97 D1       STA    $59
8CDF: 0A 52       DEC    $70
8CE1: 26 8E       BNE    $8CEF
8CE3: 30 20       LEAX   $2,X
8CE5: 9F EE       STX    $6C
8CE7: EC AC       LDD    ,X
8CE9: 97 F8       STA    $70
8CEB: D7 7C       STB    $54
8CED: D7 D1       STB    $59
8CEF: 7E AC 27    JMP    $8E05
8CF2: BD 02 83    JSR    $80A1
8CF5: C6 92       LDB    #$10
8CF7: 7E A8 89    JMP    $80A1

8CFA: 96 A6       LDA    $2E
8CFC: 44          LSRA
8CFD: 44          LSRA
8CFE: 44          LSRA
8CFF: 44          LSRA
8D00: A7 A6       STA    ,X		; [video_address]
8D02: 96 B2       LDA    $30
8D04: 44          LSRA
8D05: 44          LSRA
8D06: 44          LSRA
8D07: 44          LSRA
8D08: A7 A1 88 08 STA    $0080,X		; [video_address]
8D0C: 39          RTS
8D0D: D6 DB       LDB    $53
8D0F: 96 06       LDA    $24
8D11: 4A          DECA
8D12: 27 84       BEQ    $8D1A
8D14: 86 2A       LDA    #$08
8D16: C5 92       BITB   #$10
8D18: 26 21       BNE    $8D23
8D1A: 86 8E       LDA    #$06
8D1C: C5 20       BITB   #$08
8D1E: 26 8B       BNE    $8D23
8D20: 96 04       LDA    game_sub_state_26
8D22: 48          ASLA
8D23: 8E E1 D4    LDX    #table_c3f6
8D26: 6E 14       JMP    [A,X]        ; [jump_table]

8D28: 0C 0E       INC    game_sub_state_26
8D2A: 7E 09 3D    JMP    clear_screen_8115
8D2D: BD 0E 06    JSR    $868E
8D30: 0F 0A       CLR    $28
8D32: 5F          CLRB
8D33: BD A2 83    JSR    $80A1
8D36: D6 A6       LDB    $24
8D38: 5A          DECB
8D39: 27 8A       BEQ    $8D3D
8D3B: 5F          CLRB
8D3C: 5C          INCB
8D3D: 5C          INCB
8D3E: BD 08 83    JSR    $80A1
8D41: C6 87       LDB    #$05
8D43: BD A0 F8    JSR    $82DA
8D46: 8E 8E BA    LDX    #$0C92
8D49: 8D 27       BSR    $8CFA
8D4B: 5F          CLRB
8D4C: BD A8 10    JSR    $8098
8D4F: C6 2D       LDB    #$0F
8D51: BD 02 23    JSR    $80A1
8D54: 86 02       LDA    #$20
8D56: 97 DD       STA    timer_fraction_of_second_5f
8D58: 0C 0E       INC    game_sub_state_26
8D5A: 39          RTS
8D5B: 0A 77       DEC    timer_fraction_of_second_5f
8D5D: 26 8F       BNE    $8D66
8D5F: 86 02       LDA    #$20
8D61: 97 DD       STA    timer_fraction_of_second_5f
8D63: 5F          CLRB
8D64: 20 2A       BRA    $8D6E
8D66: 96 DD       LDA    timer_fraction_of_second_5f
8D68: 81 38       CMPA   #$10
8D6A: 26 8D       BNE    $8D71
8D6C: C6 A8       LDB    #$80
8D6E: BD 08 83    JSR    $80A1
8D71: 39          RTS
8D72: CC 1B 22    LDD    #$9900
8D75: 20 85       BRA    $8D7E
8D77: 0F 6A       CLR    $42
8D79: 20 9B       BRA    $8D8E
8D7B: CC B0 29    LDD    #$9801
8D7E: D7 CA       STB    $42
8D80: 0D 53       TST    $71
8D82: 26 8A       BNE    $8D8C
8D84: 9B 06       ADDA   $24
8D86: 19          DAA
8D87: 97 0C       STA    $24	; consume credit
8D89: BD 08 10    JSR    $8098
8D8C: 0C 0D       INC    game_state_25	; game is now running
8D8E: 96 CC       LDA    $44
8D90: 27 2B       BEQ    $8D9B
8D92: CC 82 22    LDD    #$0000
8D95: DD F0       STD    $72
8D97: DD 5C       STD    $74
8D99: DD FE       STD    $76
8D9B: 97 00       STA    $28
8D9D: 97 CB       STA    current_player_43
8D9F: 97 A1       STA    $83
8DA1: 97 06       STA    $84
8DA3: BD A3 43    JSR    $8161
8DA6: 8D C0       BSR    clear_player_data_8dea
8DA8: 96 03       LDA    $2B
8DAA: 97 16       STA    nb_lives_current_player_9e
8DAC: 97 E6       STA    nb_lives_player_1_ce
8DAE: 97 76       STA    nb_lives_player_2_fe
8DB0: DC 0F       LDD    $2D
8DB2: DD 1E       STD    $9C
8DB4: DD EE       STD    $CC
8DB6: DD 7E       STD    $FC
8DB8: 86 29       LDA    #$01
8DBA: 97 10       STA    weapons_flag_98
8DBC: 97 E0       STA    $C8
8DBE: 97 70       STA    $F8
8DC0: 86 02       LDA    #$20
8DC2: 97 30       STA    $B2
8DC4: 97 C0       STA    $E2
8DC6: B7 94 3A    STA    $1612
8DC9: 96 CC       LDA    $44
8DCB: 26 34       BNE    $8DE9
8DCD: D6 B9       LDB    $31
8DCF: 26 2B       BNE    $8DDA
8DD1: 4C          INCA
8DD2: 97 50       STA    $D2
8DD4: 86 DD       LDA    #$FF
8DD6: 97 53       STA    $D1
8DD8: 97 F8       STA    $D0
8DDA: D6 B9       LDB    $31
8DDC: 8E EA D2    LDX    #$C25A
8DDF: 58          ASLB
8DE0: EC A7       LDD    B,X
8DE2: 97 49       STA    $CB
8DE4: D7 E4       STB    $C6
8DE6: 5C          INCB
8DE7: D7 EF       STB    $C7
8DE9: 39          RTS

clear_player_data_8dea:
8DEA: 8E 9D B8    LDX    #current_player_variables_1590		; pointer on nb lives
8DED: CC 88 88    LDD    #$0000
8DF0: ED A3       STD    ,X++
8DF2: 8C 94 3F    CMPX   #$161D
8DF5: 25 7B       BCS    $8DF0
8DF7: 8E 38 E8    LDX    #$10C0
8DFA: CC 88 28    LDD    #$0000
8DFD: ED 09       STD    ,X++
8DFF: 8C 32 DD    CMPX   #$10FF
8E02: 25 7B       BCS    $8DFD
8E04: 39          RTS
8E05: 96 AA       LDA    $28
8E07: 48          ASLA
8E08: 8E EC 88    LDX    #table_c400
8E0B: 6E BE       JMP    [A,X]        ; [jump_table]

8E0D: BD 09 9F    JSR    $8117
8E10: 0C 0A       INC    $28
8E12: 39          RTS
8E13: CE 37 B2    LDU    #current_player_variables_1590
8E16: 8E 97 E8    LDX    #$15C0
8E19: 0D CA       TST    $42
8E1B: 27 2F       BEQ    $8E24
8E1D: 0D CB       TST    current_player_43
8E1F: 27 21       BEQ    $8E24
8E21: 8E 97 72    LDX    #$15F0
8E24: EC A3       LDD    ,X++
8E26: ED 43       STD    ,U++
8E28: 11 83 9D 48 CMPU   #$15C0
8E2C: 25 DE       BCS    $8E24
8E2E: 0C A0       INC    $28
8E30: 0F 4A       CLR    $68
8E32: 0F AB       CLR    $29
8E34: 96 B5       LDA    stage_number_97
8E36: 26 86       BNE    $8E3C
8E38: 0F AE       CLR    $86
8E3A: 0C 1F       INC    stage_number_97
8E3C: 39          RTS
8E3D: 96 A1       LDA    $29
8E3F: 48          ASLA
8E40: 8E E6 90    LDX    #table_c412
8E43: 6E B4       JMP    [A,X]        ; [jump_table]
8E45: BD 04 02    JSR    $8680
8E48: 96 6C       LDA    $44
8E4A: 27 8D       BEQ    $8E51
8E4C: 0F 40       CLR    $68
8E4E: 0C A1       INC    $29
8E50: 39          RTS
8E51: 86 80       LDA    #$02
8E53: 97 0B       STA    $29
8E55: 0F EA       CLR    $68
8E57: 20 09       BRA    $8E7A
8E59: 96 CA       LDA    $42
8E5B: 27 22       BEQ    $8E67
8E5D: C6 8C       LDB    #$04
8E5F: 96 61       LDA    current_player_43
8E61: 26 83       BNE    $8E64
8E63: 5A          DECB
8E64: BD A2 23    JSR    $80A1
8E67: C6 25       LDB    #$0D
8E69: BD 08 29    JSR    $80A1
8E6C: 86 10       LDA    #$38
8E6E: 97 D7       STA    timer_fraction_of_second_5f
8E70: 0C 0B       INC    $29
8E72: 39          RTS
8E73: 0A 7D       DEC    timer_fraction_of_second_5f
8E75: 26 90       BNE    $8E89
8E77: BD A9 3F    JSR    $8117
8E7A: 0C A1       INC    $29
8E7C: 96 88       LDA    $A0
8E7E: 26 CF       BNE    $8EC7
8E80: 86 DD       LDA    #$FF
8E82: 97 22       STA    $A0
8E84: 97 83       STA    $A1
8E86: BD 11 4E    JSR    $9366
8E89: 39          RTS
8E8A: 86 8D       LDA    #$05
8E8C: 97 B3       STA    $9B
8E8E: BD 01 0B    JSR    $8929
8E91: 96 AB       LDA    $29
8E93: 26 28       BNE    $8E9F
8E95: 0A AA       DEC    $28
8E97: 86 2C       LDA    #$04
8E99: 97 A1       STA    $29
8E9B: 86 D7       LDA    #$FF
8E9D: 97 D7       STA    timer_fraction_of_second_5f
8E9F: 39          RTS
8EA0: 96 7D       LDA    timer_fraction_of_second_5f
8EA2: 81 32       CMPA   #$B0
8EA4: 27 0A       BEQ    $8ECE
8EA6: 81 2A       CMPA   #$A8
8EA8: 27 07       BEQ    $8ED9
8EAA: 81 28       CMPA   #$A0
8EAC: 27 1B       BEQ    $8EE1
8EAE: 81 10       CMPA   #$98
8EB0: 27 15       BEQ    $8EE9
8EB2: 81 12       CMPA   #$90
8EB4: 27 19       BEQ    $8EF1
8EB6: BD 13 76    JSR    $915E
8EB9: BD 26 68    JSR    $AEE0
8EBC: 0A 77       DEC    timer_fraction_of_second_5f
8EBE: 26 85       BNE    $8ECD
8EC0: BD A3 97    JSR    clear_screen_8115
8EC3: 0F B9       CLR    $9B
8EC5: 0F 23       CLR    $A1
8EC7: 86 22       LDA    #$0A
8EC9: 97 A1       STA    $29
8ECB: 0F 40       CLR    $68
8ECD: 39          RTS
8ECE: CE 6A 3E    LDU    #$E21C
8ED1: 8E 8B 8A    LDX    #$0908
8ED4: 8D 01       BSR    $8EF9
8ED6: 7E 0C 9E    JMP    $8EB6
8ED9: CE 6A EC    LDU    #$E264
8EDC: 8E 21 8E    LDX    #$0906
8EDF: 20 D1       BRA    $8ED4
8EE1: CE 60 2E    LDU    #$E2AC
8EE4: 8E 2B 86    LDX    #$0904
8EE7: 20 C3       BRA    $8ED4
8EE9: CE 6A 7C    LDU    #$E2F4
8EEC: 8E 21 8A    LDX    #$0902
8EEF: 20 C1       BRA    $8ED4
8EF1: CE 61 BE    LDU    #$E33C
8EF4: 8E 2B 82    LDX    #$0900
8EF7: 20 F3       BRA    $8ED4
8EF9: 8D 8A       BSR    $8EFD
8EFB: 8D 28       BSR    $8EFD
8EFD: 30 89       LEAX   $1,X
8EFF: 34 32       PSHS   X
8F01: 10 8E 82 2E LDY    #$000C
8F05: EC 43       LDD    ,U++
8F07: A7 AC       STA    ,X			; [video_address]
8F09: E7 00 C8    STB    $40,X			; [video_address]
8F0C: 30 A1 88 08 LEAX   $0080,X
8F10: 31 1D       LEAY   -$1,Y
8F12: 26 73       BNE    $8F05
8F14: 35 32       PULS   X
8F16: 39          RTS
8F17: 8D 2A       BSR    $8F1B
8F19: 30 8A       LEAX   $2,X
8F1B: EC AC       LDD    ,X
8F1D: C3 88 89    ADDD   #$0001
8F20: ED A6       STD    ,X
8F22: 26 86       BNE    $8F28
8F24: 43          COMA
8F25: 53          COMB
8F26: ED 06       STD    ,X
8F28: 39          RTS
8F29: 8E 9D 21    LDX    #$15A9
8F2C: 8D C1       BSR    $8F17
8F2E: 96 DA       LDA    $52
8F30: 84 20       ANDA   #$02
8F32: 26 84       BNE    $8F3A
8F34: 96 73       LDA    $51
8F36: 84 86       ANDA   #$04
8F38: 26 38       BNE    $8F4A
8F3A: 96 CA       LDA    $42
8F3C: 27 24       BEQ    $8F4A
8F3E: 96 CB       LDA    current_player_43
8F40: 27 2A       BEQ    $8F4A
8F42: 96 D7       LDA    $55
8F44: 97 76       STA    $54
8F46: 96 D8       LDA    $5A
8F48: 97 71       STA    $59
8F4A: BD 0D CA    JSR    $85E2
8F4D: BD 19 D6    JSR    $915E
8F50: BD B6 D6    JSR    $9454
8F53: BD 83 BF    JSR    animate_most_sprites_a19d
8F56: 7E 13 EB    JMP    $91C3
8F59: 96 E0       LDA    $68
8F5B: 48          ASLA
8F5C: 8E EC A0    LDX    #table_c428
8F5F: 6E B4       JMP    [A,X]        ; [jump_table]
8F61: 96 C0       LDA    $42
8F63: 27 28       BEQ    $8F6F
8F65: C6 8A       LDB    #$08
8F67: 96 6B       LDA    current_player_43
8F69: 26 89       BNE    $8F6C
8F6B: 5A          DECB
8F6C: BD A8 29    JSR    $80A1
8F6F: C6 2B       LDB    #$09
8F71: BD 02 23    JSR    $80A1
8F74: 7E B1 08    JMP    $938A
8F77: BD A7 FA    JSR    copy_current_vars_to_player_vars_8fd2
8F7A: CC 88 2A    LDD    #$0002
8F7D: DD D7       STD    timer_fraction_of_second_5f
8F7F: D6 BC       LDB    nb_lives_current_player_9e
8F81: 96 C0       LDA    $42
8F83: 26 27       BNE    $8F8A
8F85: 5D          TSTB
8F86: 26 99       BNE    $8FA3
8F88: 20 0C       BRA    $8FAE
8F8A: 96 0B       LDA    $83
8F8C: 4A          DECA
8F8D: 27 92       BEQ    $8FA9
8F8F: 5D          TSTB
8F90: 26 2B       BNE    $8F9B
8F92: 0C 01       INC    $83
8F94: 8D E9       BSR    $8F61
8F96: CC 82 D2    LDD    #$00FA
8F99: DD D7       STD    timer_fraction_of_second_5f
8F9B: 5F          CLRB
8F9C: 96 6B       LDA    current_player_43
8F9E: 26 89       BNE    $8FA1
8FA0: 5C          INCB
8FA1: D7 C1       STB    current_player_43
8FA3: BD A3 43    JSR    $8161
8FA6: 0C AA       INC    $28
8FA8: 39          RTS
8FA9: 5D          TSTB
8FAA: 26 7F       BNE    $8FA3
8FAC: 8D 9B       BSR    $8F61
8FAE: 0C A0       INC    $28
8FB0: 0C 0A       INC    $28
8FB2: 96 C6       LDA    $44
8FB4: 27 24       BEQ    $8FBC
8FB6: 96 A1       LDA    $23
8FB8: 88 2C       EORA   #$04
8FBA: 97 AB       STA    $23
8FBC: BD B9 0F    JSR    $9187
8FBF: 96 66       LDA    $44
8FC1: 26 8C       BNE    $8FD1
8FC3: BD A5 D3    JSR    $87F1
8FC6: BD 03 49    JSR    $8161
8FC9: 96 B9       LDA    $31
8FCB: 27 2C       BEQ    $8FD1
8FCD: 86 8C       LDA    #$04
8FCF: 97 04       STA    game_sub_state_26
8FD1: 39          RTS

copy_current_vars_to_player_vars_8fd2:
8FD2: CE 97 B2    LDU    #current_player_variables_1590
8FD5: 8E 97 42    LDX    #$15C0
8FD8: 0D 6B       TST    current_player_43
8FDA: 27 8B       BEQ    $8FDF
8FDC: 8E 3D 78    LDX    #$15F0
8FDF: EC E3       LDD    ,U++
8FE1: ED 03       STD    ,X++
8FE3: 11 83 37 42 CMPU   #$15C0
8FE7: 25 DE       BCS    $8FDF
8FE9: 39          RTS

8FEA: DC D7       LDD    timer_fraction_of_second_5f
8FEC: 83 28 89    SUBD   #$0001
8FEF: DD 7D       STD    timer_fraction_of_second_5f
8FF1: 26 80       BNE    $8FF5
8FF3: 0F 0A       CLR    $28
8FF5: 39          RTS
8FF6: 96 A1       LDA    $23
8FF8: 84 D3       ANDA   #$FB
8FFA: 97 AB       STA    $23
8FFC: BD AE 23    JSR    $86AB
8FFF: D6 71       LDB    $53
9001: 96 A6       LDA    $24
9003: 27 D2       BEQ    $8FF5
9005: 4A          DECA
9006: 27 86       BEQ    $900C
9008: C5 38       BITB   #$10
900A: 26 9B       BNE    $901F
900C: C5 20       BITB   #$08
900E: 26 9E       BNE    $9026
9010: 96 0A       LDA    $28
9012: 26 63       BNE    $8FF5
9014: BD A5 73    JSR    $87F1
9017: 4F          CLRA
9018: C6 29       LDB    #$01
901A: D7 AD       STB    game_state_25
901C: 7E A5 AB    JMP    $8D23
901F: BD A5 D3    JSR    $87F1
9022: 86 8A       LDA    #$08
9024: 20 D0       BRA    $9018
9026: BD 05 D9    JSR    $87F1
9029: 86 8E       LDA    #$06
902B: 20 C3       BRA    $9018
902D: BD 09 9D    JSR    clear_screen_8115
9030: 86 DD       LDA    #$FF
9032: 97 DD       STA    timer_fraction_of_second_5f
9034: 0C 4A       INC    $68
9036: 96 19       LDA    $9B
9038: 81 2C       CMPA   #$04
903A: 27 82       BEQ    $9046
903C: 8D 09       BSR    draw_title_road_905f
903E: BD 19 B7    JSR    $9195
9041: C6 A1       LDB    #$23
9043: 7E A2 83    JMP    $80A1
9046: CC 85 28    LDD    #$0700
9049: DD D7       STD    timer_fraction_of_second_5f
904B: C6 0D       LDB    #$25
904D: BD 08 29    JSR    $80A1
9050: 86 24       LDA    #$06
9052: B7 A2 60    STA    scroll_dir_2042	; vertical scroll
9055: BD 11 10    JSR    $9392
9058: 8E 27 08    LDX    #$0F80
905B: BF 28 19    STX    >$0031
905E: 39          RTS

draw_title_road_905f:
905F: 86 2A       LDA    #$08
9061: B7 8A B2    STA    road_row_counter_0830		; 8 rows (using video memory argh)
9064: CC B2 C2    LDD    #$9040		; color and code of gray road tile
9067: 8E 24 69    LDX    #$0C41		; start video address
906A: 10 8E 28 36 LDY    #$001E		; 30 columns
906E: E7 01 DA 22 STB    -$0800,X	; [video_address]
9072: A7 02       STA    ,X+		; [video_address]
9074: 31 1D       LEAY   -$1,Y
9076: 26 74       BNE    $906E
9078: 30 A0 AA    LEAX   $22,X		; next row
907B: 7A 20 18    DEC    road_row_counter_0830
907E: 26 62       BNE    $906A
9080: 39          RTS

9081: 96 19       LDA    $9B
9083: 81 26       CMPA   #$04
9085: 27 C1       BEQ    $90CA
9087: 0A 77       DEC    timer_fraction_of_second_5f
9089: 10 26 96 A5 LBNE   $AF1A
908D: 0C E0       INC    $68
908F: 39          RTS
9090: BD A3 E3    JSR    $8161
9093: 8E 37 B4    LDX    #$1596
9096: 6C 06       INC    ,X		; next level
9098: A6 AC       LDA    ,X
909A: 81 8D       CMPA   #$05
909C: 26 2B       BNE    $90A1
909E: 6F 0C       CLR    ,X
90A0: 4F          CLRA
90A1: 97 19       STA    $9B
90A3: A6 23       LDA    $1,X
90A5: 8B 83       ADDA   #$01
90A7: 19          DAA
90A8: A7 29       STA    $1,X
90AA: 0C E0       INC    $68
90AC: 86 29       LDA    #$01
90AE: 97 D7       STA    timer_fraction_of_second_5f
90B0: 39          RTS
90B1: 0A DD       DEC    timer_fraction_of_second_5f
90B3: 26 D9       BNE    $90B0
90B5: 4F          CLRA
90B6: 5F          CLRB
90B7: DD 0F       STD    $27
90B9: DD 34       STD    $BC
90BB: 7E A7 FA    JMP    copy_current_vars_to_player_vars_8fd2
90BE: 30 00 62    LEAX   $40,X
90C1: 8C 92 82    CMPX   #$1000
90C4: 25 21       BCS    $90C9
90C6: 8E 8A 28    LDX    #$0800
90C9: 39          RTS
90CA: DC D7       LDD    timer_fraction_of_second_5f
90CC: 83 28 89    SUBD   #$0001
90CF: DD 7D       STD    timer_fraction_of_second_5f
90D1: 26 89       BNE    $90DE
90D3: BD A3 35    JSR    $8117
90D6: 86 80       LDA    #$02
90D8: B7 08 CA    STA    scroll_dir_2042	; horizontal scroll
90DB: 0C 40       INC    $68
90DD: 39          RTS
90DE: 10 83 24 22 CMPD   #$0600
90E2: 24 DF       BCC    $9141
90E4: 10 83 80 C8 CMPD   #$024A
90E8: 26 23       BNE    $90F5
90EA: BD 1B 4A    JSR    stop_music_9362
90ED: BD 1B 6A    JSR    $93E2
90F0: C6 12       LDB    #$30
90F2: BD 02 83    JSR    $80A1
90F5: 10 83 83 58 CMPD   #$0170
90F9: 25 CE       BCS    $9141
90FB: 96 1E       LDA    $36
90FD: 47          ASRA
90FE: 25 C9       BCS    $9141
9100: 7C 22 B2    INC    >$0030
9103: B6 22 12    LDA    >$0030
9106: 81 A2       CMPA   #$20
9108: 26 09       BNE    $912B
910A: 7F 88 18    CLR    >$0030
910D: 7C 88 BB    INC    >$0033
9110: BE 22 B3    LDX    >$0031
9113: 8D 8B       BSR    $90BE
9115: 8D 25       BSR    $90BE
9117: 8D 8D       BSR    $90BE
9119: 8D 2B       BSR    $90BE
911B: BF 28 19    STX    >$0031
911E: 1F 9B       TFR    X,U
9120: CC 32 92    LDD    #$1010
9123: 8D 3F       BSR    $9142
9125: 8D 99       BSR    $9142
9127: 8D 31       BSR    $9142
9129: 8D 9F       BSR    $9142
912B: 8E 08 28    LDX    #scroll_x_2000
912E: 6C 08       INC    ,X+
9130: 8C 02 A2    CMPX   #$2020
9133: 25 DB       BCS    $912E
9135: F6 82 B1    LDB    >$0033
9138: C1 23       CMPB   #$0B
913A: 24 8D       BCC    $9141
913C: CB 0D       ADDB   #$25
913E: BD 08 83    JSR    $80A1
9141: 39          RTS
9142: 1F B3       TFR    U,X
9144: 8D 29       BSR    $9151
9146: 10 8E 28 38 LDY    #$0010
914A: ED 09       STD    ,X++		; [video_address_word]
914C: 31 17       LEAY   -$1,Y
914E: 26 72       BNE    $914A
9150: 39          RTS
9151: 33 4A C2    LEAU   $40,U
9154: 11 83 92 82 CMPU   #$1000
9158: 25 2B       BCS    $915D
915A: CE 80 28    LDU    #$0800
915D: 39          RTS
915E: 0A 3A       DEC    $B2
9160: 26 2A       BNE    $916A
9162: 86 A2       LDA    #$20
9164: 97 90       STA    $B2
9166: C6 89       LDB    #$0B
9168: 20 20       BRA    $9172
916A: 96 3A       LDA    $B2
916C: 81 38       CMPA   #$10
916E: 26 9E       BNE    $9186
9170: C6 A9       LDB    #$8B
9172: 34 86       PSHS   B
9174: 96 61       LDA    current_player_43
9176: 27 83       BEQ    $9179
9178: 5A          DECB
9179: BD 08 29    JSR    $80A1
917C: 35 2C       PULS   B
917E: C8 0A       EORB   #$82
9180: 96 66       LDA    $44
9182: 10 27 CD 39 LBEQ   $80A1
9186: 39          RTS
9187: C6 23       LDB    #$0B
9189: 96 CA       LDA    $42
918B: 27 2D       BEQ    $9192
918D: BD 08 29    JSR    $80A1
9190: C6 28       LDB    #$0A
9192: 7E 02 83    JMP    $80A1
9195: DC D1       LDD    $53
9197: 10 83 30 BC CMPD   #$1834
919B: 26 0D       BNE    $91C2
919D: 5F          CLRB
919E: 10 8E 22 32 LDY    #$0010
91A2: 8E 8F 39    LDX    #$0D1B
91A5: CE 46 D7    LDU    #$C455
91A8: 8D 2F       BSR    $91B1
91AA: 10 8E 28 3B LDY    #$0013
91AE: 8E 84 BF    LDX    #$0C9D
91B1: 1F 1A       TFR    B,A
91B3: AB E0       ADDA   ,-U
91B5: 80 B2       SUBA   #$30
91B7: A7 AA       STA    ,-X			; [video_address]
91B9: 6F 01 70 28 CLR    -$0800,X		; [video_address]
91BD: 5A          DECB
91BE: 31 B7       LEAY   -$1,Y
91C0: 26 CD       BNE    $91B1
91C2: 39          RTS
91C3: 96 9E       LDA    $BC
91C5: 4A          DECA
91C6: 27 9F       BEQ    $91E5
91C8: 96 B7       LDA    level_completed_flag_9f
91CA: 27 A4       BEQ    $91F8
91CC: 97 8B       STA    $A3
91CE: 0C A0       INC    $28
91D0: 86 DD       LDA    #$FF
91D2: 97 B4       STA    $36
91D4: 97 83       STA    $A1
91D6: 0F EA       CLR    $68
91D8: 0F B7       CLR    level_completed_flag_9f
91DA: 4F          CLRA
91DB: 5F          CLRB
91DC: DD B8       STD    $90
91DE: DD 2F       STD    $A7
91E0: 8D 35       BSR    $91F9
91E2: 7E 0D 9E    JMP    $8FBC
91E5: 86 7D       LDA    #$FF
91E7: 97 89       STA    $A1
91E9: 0F 34       CLR    $BC
91EB: 0F B7       CLR    level_completed_flag_9f
91ED: 0A 16       DEC    nb_lives_current_player_9e
91EF: 0C 0A       INC    $28
91F1: 0C AA       INC    $28
91F3: 8D 26       BSR    $91F9
91F5: 7E 0D 3E    JMP    $8FBC
91F8: 39          RTS

; called on screen change
91F9: 4F          CLRA
91FA: 5F          CLRB
91FB: 10 8E 28 80 LDY    #$0008
91FF: 8E 32 D2    LDX    #$10F0
9202: ED 03       STD    ,X++
9204: 31 1D       LEAY   -$1,Y
9206: 26 78       BNE    $9202
9208: 39          RTS

9209: 8E 99 48    LDX    #$11C0
920C: A6 2E       LDA    $6,X
920E: 31 0C       LEAY   ,X
9210: 8E 33 42    LDX    #$11C0
9213: C6 22       LDB    #$00
9215: A1 84       CMPA   $6,X
9217: 25 29       BCS    $921A
9219: 5C          INCB
921A: A1 00 6E    CMPA   $46,X
921D: 25 89       BCS    $9220
921F: 5C          INCB
9220: A1 AB 82 04 CMPA   $0086,X
9224: 25 23       BCS    $9227
9226: 5C          INCB
9227: A1 A1 28 4E CMPA   $00C6,X
922B: 25 29       BCS    $922E
922D: 5C          INCB
922E: A1 01 23 24 CMPA   $0106,X
9232: 25 83       BCS    $9235
9234: 5C          INCB
9235: A1 0B 83 6E CMPA   $0146,X
9239: 25 89       BCS    $923C
923B: 5C          INCB
923C: A1 A1 89 0E CMPA   $0186,X
9240: 25 23       BCS    $9243
9242: 5C          INCB
9243: A1 AB 23 44 CMPA   $01C6,X
9247: 25 29       BCS    $924A
9249: 5C          INCB
924A: 30 01 2A 28 LEAX   $0200,X
924E: 8C 9B E2    CMPX   #$13C0
9251: 25 40       BCS    $9215
9253: 30 86       LEAX   ,Y
9255: E7 0A 92    STB    $10,X
9258: 30 A0 C8    LEAX   $40,X
925B: 8C 3B E8    CMPX   #$13C0
925E: 25 24       BCS    $920C
9260: C6 2A       LDB    #$08
9262: 8E 92 22    LDX    #$1000
9265: 96 A0       LDA    $22
9267: 84 20       ANDA   #$08
9269: 26 8B       BNE    $926E
926B: 8E 39 28    LDX    #$1100
926E: D8 AA       EORB   $22
9270: D7 00       STB    $22
9272: CE 93 E2    LDU    #$11C0
9275: 86 83       LDA    #$01
9277: 34 2A       PSHS   A
9279: A1 40 98    CMPA   $10,U
927C: 26 19       BNE    $92AF
927E: EC C6       LDD    $E,U
9280: ED A3       STD    ,X++
9282: A6 C6       LDA    $4,U
9284: E6 64       LDB    $6,U
9286: ED 03       STD    ,X++
9288: EC E0 96    LDD    $1E,U
928B: ED A9       STD    ,X++
928D: A6 40 9C    LDA    $14,U
9290: E6 EA 94    LDB    $16,U
9293: ED A3       STD    ,X++
9295: EC 4A AC    LDD    $2E,U
9298: ED A9       STD    ,X++
929A: A6 40 0C    LDA    $24,U
929D: E6 40 AE    LDB    game_sub_state_26,U
92A0: ED A3       STD    ,X++
92A2: EC 4A 1C    LDD    $3E,U
92A5: ED 03       STD    ,X++
92A7: A6 E0 1C    LDA    $34,U
92AA: E6 40 1E    LDB    $36,U
92AD: ED 09       STD    ,X++
92AF: 35 20       PULS   A
92B1: 33 4A C2    LEAU   $40,U
92B4: 11 83 91 42 CMPU   #$13C0
92B8: 25 95       BCS    $9277
92BA: CE 99 E8    LDU    #$11C0
92BD: 4C          INCA
92BE: 81 81       CMPA   #$09
92C0: 26 97       BNE    $9277
92C2: 10 8E 22 26 LDY    #$0004
92C6: CE 91 E8    LDU    #$13C0
92C9: EC C6       LDD    $E,U
92CB: ED A9       STD    ,X++
92CD: A6 CC       LDA    $4,U
92CF: E6 64       LDB    $6,U
92D1: ED 03       STD    ,X++
92D3: EC EA 3C    LDD    $1E,U
92D6: ED 03       STD    ,X++
92D8: A6 E0 9C    LDA    $14,U
92DB: E6 E0 3E    LDB    $16,U
92DE: ED 09       STD    ,X++
92E0: EC EA AC    LDD    $2E,U
92E3: ED A3       STD    ,X++
92E5: A6 4A A6    LDA    $24,U
92E8: E6 E0 AE    LDB    game_sub_state_26,U
92EB: ED A9       STD    ,X++
92ED: EC 40 B6    LDD    $3E,U
92F0: ED A3       STD    ,X++
92F2: A6 4A 16    LDA    $34,U
92F5: E6 4A B4    LDB    $36,U
92F8: ED A9       STD    ,X++
92FA: 33 40 68    LEAU   $40,U
92FD: 31 B7       LEAY   -$1,Y
92FF: 26 EA       BNE    $92C9
9301: 39          RTS
9302: 7F 95 2B    CLR    $1709
9305: 39          RTS
9306: 4F          CLRA
9307: 7E BB 9F    JMP    force_queue_sound_93b7
930A: 86 80       LDA    #$08
930C: 7E BB 28    JMP    queue_sound_93a0
930F: 86 24       LDA    #$06
9311: 7E 11 22    JMP    queue_sound_93a0
9314: 86 01       LDA    #$23
9316: 7E 11 88    JMP    queue_sound_93a0
9319: 86 84       LDA    #$0C
931B: 7E BB 88    JMP    queue_sound_93a0
931E: 86 99       LDA    #$11
9320: 7E B1 22    JMP    queue_sound_93a0
9323: 86 21       LDA    #$03
9325: 20 FB       BRA    queue_sound_93a0
9327: 86 2C       LDA    #$04
9329: 20 FD       BRA    queue_sound_93a0
932B: 86 38       LDA    #$10
932D: 20 F9       BRA    queue_sound_93a0
932F: 86 06       LDA    #$24
9331: 20 EF       BRA    queue_sound_93a0
9333: 86 2F       LDA    #$0D
9335: 20 EB       BRA    queue_sound_93a0
9337: 86 08       LDA    #$20
9339: 20 ED       BRA    queue_sound_93a0
933B: 86 09       LDA    #$21
933D: 20 E9       BRA    queue_sound_93a0
933F: 86 28       LDA    #$0A
9341: 20 DF       BRA    queue_sound_93a0
9343: 86 00       LDA    #$22
9345: 20 DB       BRA    queue_sound_93a0
9347: 86 27       LDA    #$0F
9349: 20 DD       BRA    queue_sound_93a0
934B: 86 3A       LDA    #$12
934D: 20 D9       BRA    queue_sound_93a0
934F: 86 29       LDA    #$0B
9351: 7F 95 8B    CLR    $1709
9354: 20 68       BRA    queue_sound_93a0
9356: 86 91       LDA    #$13
9358: 20 6E       BRA    queue_sound_93a0
935A: 86 89       LDA    #$01
935C: 20 6A       BRA    queue_sound_93a0
935E: 86 8D       LDA    #$05
9360: 20 1C       BRA    queue_sound_93a0
9362: 86 7C       LDA    #$FE
9364: 20 18       BRA    queue_sound_93a0
9366: 86 C1       LDA    #$43
9368: 20 25       BRA    $9377
936A: 86 1A       LDA    #$92
936C: 7F 3E 41    CLR    $16C9
936F: 20 0D       BRA    queue_sound_93a0
9371: 86 93       LDA    #$11
9373: 8D 09       BSR    queue_sound_93a0
9375: 86 16       LDA    #$94
9377: F6 3D 6C    LDB    $1544
937A: 26 AC       BNE    queue_sound_93a0
937C: 39          RTS
937D: F6 9D CC    LDB    $1544
9380: 27 D8       BEQ    $937C
9382: 86 C2       LDA    #$40
9384: 8D 38       BSR    queue_sound_93a0
9386: 86 0B       LDA    #$89
9388: 20 3E       BRA    queue_sound_93a0
938A: 86 CD       LDA    #$45
938C: 20 3A       BRA    queue_sound_93a0
938E: 86 CA       LDA    #$42
9390: 20 2C       BRA    queue_sound_93a0
9392: F6 97 66    LDB    $1544
9395: 27 67       BEQ    $937C
9397: 86 69       LDA    #$41
9399: 20 8D       BRA    queue_sound_93a0
939B: 86 6C       LDA    #$44
939D: 20 89       BRA    queue_sound_93a0
939F: 4F          CLRA
queue_sound_93a0:
93A0: D6 07       LDB    game_state_25
93A2: C1 81       CMPB   #$03
93A4: 27 33       BEQ    force_queue_sound_93b7
93A6: 0D C6       TST    $44
93A8: 26 25       BNE    force_queue_sound_93b7
93AA: D6 D9       LDB    $51
93AC: 58          ASLB
93AD: 24 92       BCC    $93C9
93AF: 81 5D       CMPA   #$7F
93B1: 22 86       BHI    force_queue_sound_93b7
93B3: 81 1D       CMPA   #$3F
93B5: 22 90       BHI    $93C9
force_queue_sound_93b7:
93B7: 34 38       PSHS   X
93B9: 9E B6       LDX    $3E
93BB: A7 A8       STA    ,X+
93BD: 8C 9D A8    CMPX   #$1520
93C0: 25 21       BCS    $93C5
93C2: 8E 97 22    LDX    #$1500
93C5: 9F BC       STX    $3E
93C7: 35 B8       PULS   X,PC
93C9: 39          RTS

93CA: 86 08       LDA    #$80
93CC: 20 FA       BRA    queue_sound_93a0
93CE: 86 0D       LDA    #$85
93D0: 20 EC       BRA    queue_sound_93a0
play_let_the_hostages_go_93d2:
93D2: 86 06       LDA    #$84
93D4: 20 E8       BRA    queue_sound_93a0
93D6: 86 04       LDA    #$86
93D8: 20 EE       BRA    queue_sound_93a0
93DA: 86 0B       LDA    #$83
93DC: 20 EA       BRA    queue_sound_93a0
93DE: 86 07       LDA    #$8F
93E0: 20 9C       BRA    queue_sound_93a0
93E2: 86 17       LDA    #$95
93E4: 20 98       BRA    queue_sound_93a0
93E6: 86 02       LDA    #$80
93E8: 20 9E       BRA    queue_sound_93a0
93EA: 86 86       LDA    #$0E
93EC: 20 9A       BRA    queue_sound_93a0
play_you_saved_manhattan_93ee:
93EE: 86 18       LDA    #$90
93F0: 20 8C       BRA    queue_sound_93a0
play_oh_no_93f2:
93F2: B6 92 DD    LDA    $10FF	; not the same "oh no" each time
93F5: 27 86       BEQ    $93FB
93F7: 86 AF       LDA    #$87
93F9: 20 2D       BRA    queue_sound_93a0
93FB: 86 A0       LDA    #$88
93FD: 20 29       BRA    queue_sound_93a0

93FF: BD B9 42    JSR    $9B60
9402: BD 15 99    JSR    $97BB
9405: BD 1A D2    JSR    $9850
9408: BD B6 BE    JSR    $9E36
940B: 12          NOP
940C: B6 39 64    LDA    $11EC
940F: 26 32       BNE    $9421
9411: B6 93 43    LDA    $11C1
9414: 26 29       BNE    $9421
9416: B6 92 D5    LDA    $10FD
9419: 26 8E       BNE    $9421
941B: BD B2 66    JSR    $9A4E
941E: BD 12 AE    JSR    $9A8C
9421: 39          RTS
9422: 8E 93 E2    LDX    #$11C0
9425: CC 02 2A    LDD    #$80A8
9428: 0D B3       TST    $9B
942A: 27 8B       BEQ    $942F
942C: CC 78 20    LDD    #$50A8
942F: A7 26       STA    $4,X
9431: E7 84       STB    $6,X
9433: 86 23       LDA    #$01
9435: B7 92 44    STA    $10C6
9438: 6F A0 99    CLR    $11,X
943B: 86 20       LDA    #$08
943D: A7 00 9A    STA    $12,X
9440: A7 AA 91    STA    $13,X
9443: A7 AA 37    STA    $15,X
9446: 86 87       LDA    #$05
9448: BD A8 2A    JSR    $80A2
944B: 6F A0 0A    CLR    $22,X
944E: 7F 98 E2    CLR    $10C0
9451: 7E 14 E0    JMP    $9662
9454: BD B1 7D    JSR    $93FF
9457: 8E 39 E8    LDX    #$11C0
945A: A6 89       LDA    $1,X
945C: 10 26 80 94 LBNE   $9C7C
9460: A6 AA AE    LDA    $2C,X
9463: 10 26 28 9E LBNE   $9E83
9467: BD BE 80    JSR    $96A8
946A: FC 98 E8    LDD    $10C0
946D: 53          COMB
946E: F4 98 E2    ANDB   $10C0
9471: C5 92       BITB   #$10
9473: 27 27       BEQ    $947A
9475: BD 14 63    JSR    $96E1
9478: 20 2F       BRA    $9481
947A: C5 A8       BITB   #$20
947C: 27 2B       BEQ    $9481
947E: BD 1C 95    JSR    $94B7
9481: 8E 93 42    LDX    #$11C0
9484: B6 32 42    LDA    $10C0
9487: B8 38 E9    EORA   $10C1
948A: 85 87       BITA   #$0F
948C: 27 60       BEQ    $94D6
948E: 31 0C       LEAY   ,X
9490: BD 85 1E    JSR    $A79C
9493: 6F AA 01    CLR    $23,X
9496: 6F 0A 02    CLR    $2A,X
9499: B6 98 48    LDA    $10C0
949C: 84 27       ANDA   #$0F
949E: A7 00 33    STA    $11,X
94A1: 27 B0       BEQ    $94D5
94A3: E6 AA 30    LDB    $12,X
94A6: E7 0A 3B    STB    $13,X
94A9: 6F 00 9F    CLR    $17,X
94AC: CE CE E1    LDU    #$E669
94AF: 4A          DECA
94B0: A6 E4       LDA    A,U
94B2: A7 0A 30    STA    $12,X
94B5: 20 9D       BRA    $94D6
94B7: 96 B0       LDA    weapons_flag_98
94B9: 81 89       CMPA   #$01
94BB: 27 30       BEQ    $94D5
94BD: BD 1B A7    JSR    $932F
94C0: 86 27       LDA    #$05
94C2: BD 02 80    JSR    $80A2
94C5: B6 92 44    LDA    $10C6
94C8: 4C          INCA
94C9: 91 10       CMPA   weapons_flag_98
94CB: 23 2A       BLS    $94CF
94CD: 86 89       LDA    #$01
94CF: B7 32 E4    STA    $10C6
94D2: 7E 1A 12    JMP    $9830
94D5: 39          RTS
94D6: B6 92 E8    LDA    $10C0
94D9: 84 87       ANDA   #$0F
94DB: 26 2E       BNE    $94E3
94DD: BD 1E EA    JSR    $9662
94E0: 7E B7 4F    JMP    $95CD
94E3: 31 A6       LEAY   ,X
94E5: CE 61 06    LDU    #$E384
94E8: F6 38 4E    LDB    $10C6
94EB: 5A          DECB
94EC: 58          ASLB
94ED: EE 4D       LDU    B,U
94EF: 4A          DECA
94F0: 48          ASLA
94F1: EE 44       LDU    A,U
94F3: FF 32 D1    STU    $10F3
94F6: CE 67 C1    LDU    #$E5E9
94F9: EE 4E       LDU    A,U
94FB: A6 2C       LDA    $4,X
94FD: E6 8E       LDB    $6,X
94FF: FD 32 C0    STD    $10E2
9502: 34 92       PSHS   X
9504: BD B4 1C    JSR    $969E
9507: BD 8F 4C    JSR    animate_most_sprites_a764
950A: BD 1E 15    JSR    $963D
950D: 35 98       PULS   X
950F: A6 AA 08    LDA    $2A,X
9512: 84 8D       ANDA   #$0F
9514: 26 21       BNE    $9519
9516: BD 11 72    JSR    $935A
9519: 6C 00 A2    INC    $2A,X
951C: BD B5 75    JSR    $9DFD
951F: 24 25       BCC    $9528
9521: FC 92 60    LDD    $10E2
9524: A7 26       STA    $4,X
9526: E7 84       STB    $6,X
9528: A6 2C       LDA    $4,X
952A: E6 8E       LDB    $6,X
952C: FD 38 6C    STD    $10E4
952F: B6 32 C0    LDA    $10E2
9532: FD 92 C2    STD    $10E0
9535: BD 19 76    JSR    $9BF4
9538: 24 2D       BCC    $953F
953A: B6 98 CB    LDA    $10E3
953D: A7 8E       STA    $6,X
953F: B6 32 C6    LDA    $10E4
9542: F6 92 C1    LDB    $10E3
9545: FD 92 62    STD    $10E0
9548: BD B3 7C    JSR    $9BF4
954B: 24 2D       BCC    $9552
954D: B6 98 6A    LDA    $10E2
9550: A7 26       STA    $4,X
9552: B6 92 C0    LDA    $10E2
9555: F6 92 67    LDB    $10E5
9558: FD 38 68    STD    $10E0
955B: BD B4 16    JSR    $9C3E
955E: 24 8D       BCC    $9565
9560: B6 32 61    LDA    $10E3
9563: A7 24       STA    $6,X
9565: B6 92 66    LDA    $10E4
9568: F6 38 6B    LDB    $10E3
956B: FD 38 C8    STD    $10E0
956E: BD 14 1C    JSR    $9C3E
9571: 24 87       BCC    $9578
9573: B6 32 C0    LDA    $10E2
9576: A7 86       STA    $4,X
9578: A6 2E       LDA    $6,X
957A: 81 58       CMPA   #$D0
957C: 25 2C       BCS    $9582
957E: 86 58       LDA    #$D0
9580: A7 24       STA    $6,X
9582: A6 86       LDA    $4,X
9584: 81 02       CMPA   #$20
9586: 24 86       BCC    $958C
9588: 86 08       LDA    #$20
958A: 20 AA       BRA    $95AE
958C: 81 A8       CMPA   #$80
958E: 23 A8       BLS    $95B0
9590: DE 85       LDU    $A7
9592: 11 83 28 6B CMPU   #$0A49
9596: 25 8A       BCS    $95A0
9598: 81 F8       CMPA   #$D0
959A: 25 9C       BCS    $95B0
959C: 86 F8       LDA    #$D0
959E: 20 86       BRA    $95AE
95A0: 80 A2       SUBA   #$80
95A2: 34 90       PSHS   X,A
95A4: BD A6 FC    JSR    $847E
95A7: 35 3A       PULS   A,X
95A9: 4A          DECA
95AA: 26 7E       BNE    $95A2
95AC: 86 A8       LDA    #$80
95AE: A7 8C       STA    $4,X
95B0: 31 A6       LEAY   ,X
95B2: B6 92 E2    LDA    $10C0
95B5: 84 8D       ANDA   #$0F
95B7: 4A          DECA
95B8: 48          ASLA
95B9: CE 6D 61    LDU    #$E5E9
95BC: EE EE       LDU    A,U
95BE: 34 98       PSHS   X
95C0: BD 85 94    JSR    $A716
95C3: 35 32       PULS   X
95C5: BD 14 44    JSR    $96C6
95C8: 20 2B       BRA    $95CD
95CA: 6F 00 0E    CLR    game_sub_state_26,X
95CD: 6F 00 BE    CLR    $36,X
95D0: A6 AA A1    LDA    $23,X
95D3: 26 20       BNE    $95D7
95D5: 20 E7       BRA    $963C
95D7: EE A0 08    LDU    $20,X
95DA: 6A 00 0B    DEC    $23,X
95DD: 81 82       CMPA   #$0A
95DF: 22 1E       BHI    $961D
95E1: 81 87       CMPA   #$05
95E3: 25 1A       BCS    $961D
95E5: F6 92 44    LDB    $10C6
95E8: C1 29       CMPB   #$01
95EA: 27 9B       BEQ    $95FF
95EC: C6 68       LDB    #$40
95EE: E7 00 1D    STB    $3F,X
95F1: C6 9A       LDB    #$18
95F3: 81 2B       CMPA   #$09
95F5: 22 96       BHI    $960B
95F7: 81 2F       CMPA   #$07
95F9: 25 98       BCS    $960B
95FB: C6 31       LDB    #$19
95FD: 20 84       BRA    $960B
95FF: C6 22       LDB    #$00
9601: 81 8B       CMPA   #$09
9603: 22 24       BHI    $960B
9605: 81 85       CMPA   #$07
9607: 25 2A       BCS    $960B
9609: C6 9F       LDB    #$17
960B: E7 A0 16    STB    $3E,X
960E: EC 00 0A    LDD    $28,X
9611: AB 86       ADDA   $4,X
9613: EB 24       ADDB   $6,X
9615: A7 0A B6    STA    $34,X
9618: E7 A0 BE    STB    $36,X
961B: 33 6C       LEAU   $4,U
961D: B6 98 4E    LDA    $10C6
9620: 81 20       CMPA   #$02
9622: 25 9A       BCS    $963C
9624: A6 AA 90    LDA    $12,X
9627: 81 20       CMPA   #$08
9629: 22 99       BHI    $963C
962B: 81 2C       CMPA   #$04
962D: 27 85       BEQ    $963C
962F: EC E6       LDD    ,U
9631: ED 0A 9C    STD    $1E,X
9634: A6 60       LDA    $2,U
9636: A7 0A 06    STA    $2E,X
9639: 7E 1E B5    JMP    $963D
963C: 39          RTS
963D: 34 D8       PSHS   U,X
963F: 8E 33 E2    LDX    #$11C0
9642: CE 64 51    LDU    #$E673
9645: A6 0A 90    LDA    $12,X
9648: 44          LSRA
9649: A6 4E       LDA    A,U
964B: 44          LSRA
964C: 4C          INCA
964D: 85 89       BITA   #$01
964F: 27 2C       BEQ    $965F
9651: C6 81       LDB    #$03
9653: A6 2D       LDA    $F,X
9655: 84 6D       ANDA   #$EF
9657: A7 27       STA    $F,X
9659: 30 00 98    LEAX   $10,X
965C: 5A          DECB
965D: 26 7C       BNE    $9653
965F: 35 72       PULS   X,U
9661: 39          RTS
9662: CE 61 A6    LDU    #$E384
9665: B6 92 44    LDA    $10C6
9668: 4A          DECA
9669: 48          ASLA
966A: EE 4E       LDU    A,U
966C: A6 A0 9A    LDA    $12,X
966F: 10 8E C4 F1 LDY    #$E673
9673: 44          LSRA
9674: A6 84       LDA    A,Y
9676: EE 44       LDU    A,U
9678: EC 69       LDD    $1,U
967A: C8 98       EORB   #$10
967C: ED 26       STD    $E,X
967E: EC CB       LDD    $3,U
9680: C8 32       EORB   #$10
9682: ED 0A 3C    STD    $1E,X
9685: EC C7       LDD    $5,U
9687: C8 38       EORB   #$10
9689: ED 00 A6    STD    $2E,X
968C: BD BE B5    JSR    $963D
968F: A6 26       LDA    $4,X
9691: E6 84       LDB    $6,X
9693: A7 AA 36    STA    $14,X
9696: C0 92       SUBB   #$10
9698: E7 A0 9E    STB    $16,X
969B: 7E BE EE    JMP    $96C6
969E: 4F          CLRA
969F: A7 2A       STA    $8,X
96A1: A7 88       STA    $A,X
96A3: A7 29       STA    $B,X
96A5: A7 8F       STA    $D,X
96A7: 39          RTS
96A8: B6 38 48    LDA    $10C0
96AB: B7 38 E9    STA    $10C1
96AE: 96 DC       LDA    $54
96B0: D6 73       LDB    $51
96B2: C5 86       BITB   #$04
96B4: 27 24       BEQ    $96BC
96B6: D6 D0       LDB    $52
96B8: C5 2A       BITB   #$02
96BA: 27 8E       BEQ    $96C2
96BC: D6 6B       LDB    current_player_43
96BE: 27 8A       BEQ    $96C2
96C0: 96 77       LDA    $55
96C2: B7 92 E2    STA    $10C0
96C5: 39          RTS
96C6: CE 64 1B    LDU    #$E633
96C9: B6 98 4E    LDA    $10C6
96CC: 4A          DECA
96CD: 48          ASLA
96CE: EE 4E       LDU    A,U
96D0: A6 AA 90    LDA    $12,X
96D3: EC E4       LDD    A,U
96D5: AB 86       ADDA   $4,X
96D7: A7 A0 0C    STA    $24,X
96DA: EB 00 3E    ADDB   $16,X
96DD: E7 00 AE    STB    game_sub_state_26,X
96E0: 39          RTS
96E1: B6 92 44    LDA    $10C6
96E4: 81 23       CMPA   #$01
96E6: 27 97       BEQ    $96FD
96E8: 81 2B       CMPA   #$03
96EA: 27 99       BEQ    $96FD
96EC: CE 3C D8    LDU    #$1450
96EF: 86 21       LDA    #$03
96F1: E6 46       LDB    ,U
96F3: C1 20       CMPB   #$02
96F5: 27 A5       BEQ    $971E
96F7: 33 E0 08    LEAU   $20,U
96FA: 4A          DECA
96FB: 26 DC       BNE    $96F1
96FD: CE 9C D8    LDU    #$1450
9700: 86 21       LDA    #$03
9702: F6 92 E4    LDB    $10C6
9705: C1 83       CMPB   #$01
9707: 26 2A       BNE    $970B
9709: 8B 8C       ADDA   #$04
970B: E6 EC       LDB    ,U
970D: 27 98       BEQ    $971F
970F: 33 EA 02    LEAU   $20,U
9712: F6 92 E4    LDB    $10C6
9715: C1 83       CMPB   #$01
9717: 26 2A       BNE    $971B
9719: 33 D8       LEAU   -$10,U
971B: 4A          DECA
971C: 26 C5       BNE    $970B
971E: 39          RTS
971F: FF 32 C2    STU    $10E0
9722: B6 92 E4    LDA    $10C6
9725: A7 46       STA    ,U
9727: 81 2B       CMPA   #$03
9729: 26 8B       BNE    $972E
972B: BD B5 5A    JSR    $9D72
972E: 10 8E C4 A1 LDY    #$E683
9732: 4A          DECA
9733: 48          ASLA
9734: 10 AE 24    LDY    A,Y
9737: CE CF 84    LDU    #table_e7ac
973A: AD 5E       JSR    [A,U]        ; [jump_table]
973C: A6 A0 9D    LDA    $15,X
973F: C6 24       LDB    #$06
9741: 3D          MUL
9742: 5C          INCB
9743: F7 32 C0    STB    $10E2
9746: CB 80       ADDB   #$02
9748: EC 8D       LDD    B,Y
974A: ED 00 00    STD    $28,X
974D: CC 88 C3    LDD    #$004B
9750: ED AA BC    STD    $3E,X
9753: FE 32 C2    LDU    $10E0
9756: B6 92 CA    LDA    $10E2
9759: EC 2E       LDD    A,Y
975B: ED 66       STD    $E,U
975D: B6 98 6A    LDA    $10E2
9760: 8B 20       ADDA   #$02
9762: EC 24       LDD    A,Y
9764: AB 26       ADDA   $4,X
9766: EB 84       ADDB   $6,X
9768: A7 6C       STA    $4,U
976A: E7 CE       STB    $6,U
976C: A6 2C       LDA    $4,X
976E: E6 8E       LDB    $6,X
9770: 34 52       PSHS   U,Y,X
9772: 30 46       LEAX   ,U
9774: BD B9 18    JSR    $9B9A
9777: 35 58       PULS   X,Y,U
9779: 34 CC       PSHS   U,B
977B: A6 60       LDA    $8,U
977D: E6 2C       LDB    ,Y
977F: 3D          MUL
9780: ED 6A       STD    $8,U
9782: A6 C8       LDA    $A,U
9784: E6 86       LDB    ,Y
9786: 3D          MUL
9787: ED 62       STD    $A,U
9789: BD 10 A0    JSR    $9828
978C: 35 6C       PULS   B,U
978E: 10 8E C4 59 LDY    #table_e67b
9792: 6E 37       JMP    [B,Y]        ; [jump_table]
9794: EC 6A       LDD    $8,U
9796: 43          COMA
9797: 53          COMB
9798: C3 28 89    ADDD   #$0001
979B: ED 60       STD    $8,U
979D: EC C2       LDD    $A,U
979F: 43          COMA
97A0: 53          COMB
97A1: C3 82 83    ADDD   #$0001
97A4: ED 68       STD    $A,U
97A6: 39          RTS
97A7: EC 60       LDD    $8,U
97A9: 43          COMA
97AA: 53          COMB
97AB: C3 28 29    ADDD   #$0001
97AE: ED C0       STD    $8,U
97B0: 39          RTS
97B1: EC C8       LDD    $A,U
97B3: 43          COMA
97B4: 53          COMB
97B5: C3 82 83    ADDD   #$0001
97B8: ED 62       STD    $A,U
97BA: 39          RTS
97BB: 8E 3C 78    LDX    #$1450
97BE: C6 8F       LDB    #$07
97C0: F7 32 62    STB    $10E0
97C3: A6 A6       LDA    ,X
97C5: 27 81       BEQ    $97CA
97C7: BD BF FB    JSR    $97D3
97CA: 30 00 38    LEAX   $10,X
97CD: 7A 98 68    DEC    $10E0
97D0: 26 D3       BNE    $97C3
97D2: 39          RTS
97D3: CE C5 90    LDU    #table_e7b2
97D6: 4A          DECA
97D7: 48          ASLA
97D8: 6E FE       JMP    [A,U]        ; [jump_table]
97DA: EE 8A       LDU    $2,X
97DC: A6 29       LDA    $1,X
97DE: 27 8B       BEQ    $97E3
97E0: BD BE 6F    JSR    $9CED
97E3: BD BF F3    JSR    $9DD1
97E6: A6 0A 34    LDA    $1C,X
97E9: 26 98       BNE    $97FB
97EB: EC 2E       LDD    $6,X
97ED: E3 82       ADDD   $A,X
97EF: ED 24       STD    $6,X
97F1: 81 A2       CMPA   #$20
97F3: 25 0D       BCS    $9824
97F5: 81 72       CMPA   #$F0
97F7: 22 03       BHI    $9824
97F9: 20 97       BRA    $981A
97FB: A6 A0 35    LDA    $1D,X
97FE: 26 80       BNE    $9808
9800: 6F AA 9E    CLR    $1C,X
9803: 6F A6       CLR    ,X
9805: 7E 19 44    JMP    $9BC6
9808: 6A A0 95    DEC    $1D,X
980B: 39          RTS
980C: EC 2E       LDD    $6,X
980E: E3 82       ADDD   $A,X
9810: ED 24       STD    $6,X
9812: 81 C2       CMPA   #$40
9814: 25 2C       BCS    $9824
9816: 81 72       CMPA   #$F0
9818: 22 22       BHI    $9824
981A: EC 8C       LDD    $4,X
981C: E3 20       ADDD   $8,X
981E: ED 8C       STD    $4,X
9820: 81 D2       CMPA   #$F0
9822: 25 81       BCS    $9827
9824: BD B9 44    JSR    $9BC6
9827: 39          RTS
9828: 8E 39 48    LDX    #$11C0
982B: 86 38       LDA    #$10
982D: A7 00 AB    STA    $23,X
9830: CE C5 56    LDU    #$E7D4
9833: B6 32 E4    LDA    $10C6
9836: 81 80       CMPA   #$02
9838: 25 3D       BCS    $984F
983A: 80 8A       SUBA   #$02
983C: 48          ASLA
983D: EE 4E       LDU    A,U
983F: A6 AA 30    LDA    $12,X
9842: 81 8A       CMPA   #$08
9844: 22 2B       BHI    $984F
9846: 81 86       CMPA   #$04
9848: 27 2D       BEQ    $984F
984A: EE 4E       LDU    A,U
984C: EF A0 A8    STU    $20,X
984F: 39          RTS
9850: B6 33 43    LDA    $11C1
9853: 26 0A       BNE    $987D
9855: 34 92       PSHS   X
9857: 10 8E 3A 88 LDY    #$1200
985B: 86 2F       LDA    #$07
985D: B7 98 68    STA    $10E0
9860: A6 03       LDA    $1,Y
9862: 27 8D       BEQ    $9873
9864: A6 8A 95    LDA    $17,Y
9867: 26 22       BNE    $9873
9869: A6 2C       LDA    ,Y
986B: BD B3 C2    JSR    $9BEA
986E: 33 2C       LEAU   ,Y
9870: BD BA FC    JSR    $987E
9873: 31 8A 62    LEAY   $40,Y
9876: 7A 92 C8    DEC    $10E0
9879: 26 6D       BNE    $9860
987B: 35 38       PULS   X
987D: 39          RTS
987E: 86 8F       LDA    #$07
9880: B7 32 63    STA    $10E1
9883: 8E 36 72    LDX    #$1450
9886: A6 2A 3F    LDA    $17,Y
9889: 26 87       BNE    $989A
988B: A6 AC       LDA    ,X
988D: 27 8B       BEQ    $9892
988F: BD BA B9    JSR    $989B
9892: 30 0A 32    LEAX   $10,X
9895: 7A 92 63    DEC    $10E1
9898: 26 C4       BNE    $9886
989A: 39          RTS
989B: A6 EC       LDA    ,U
989D: BD 13 62    JSR    $9BEA
98A0: 81 20       CMPA   #$02
98A2: 23 99       BLS    $98BF
98A4: 81 21       CMPA   #$03
98A6: 27 F8       BEQ    $9922
98A8: 81 2C       CMPA   #$04
98AA: 10 27 28 98 LBEQ   $995E
98AE: 81 8D       CMPA   #$05
98B0: 10 27 82 5C LBEQ   $9992
98B4: 81 25       CMPA   #$07
98B6: 23 85       BLS    $98BF
98B8: 81 20       CMPA   #$08
98BA: 10 27 29 2D LBEQ   $99C3
98BE: 39          RTS
98BF: A6 66       LDA    $4,U
98C1: E6 C9       LDB    $B,U
98C3: 26 20       BNE    $98C7
98C5: 8B 92       ADDA   #$10
98C7: A0 2C       SUBA   $4,X
98C9: 8B 80       ADDA   #$08
98CB: 81 38       CMPA   #$10
98CD: 22 67       BHI    $98BE
98CF: A6 24       LDA    $6,X
98D1: 8B 8A       ADDA   #$08
98D3: A0 64       SUBA   $6,U
98D5: 8B 92       ADDA   #$10
98D7: 81 08       CMPA   #$20
98D9: 22 6B       BHI    $98BE
98DB: A6 EC       LDA    ,U
98DD: 81 90       CMPA   #$18
98DF: 26 27       BNE    $98E6
98E1: 6D 4A A2    TST    $20,U
98E4: 27 FA       BEQ    $98BE
98E6: BD 19 C2    JSR    $9BEA
98E9: 81 8F       CMPA   #$07
98EB: 26 36       BNE    $990B
; hostage shot
98ED: A6 40 AF    LDA    $27,U
98F0: 26 EE       BNE    $98BE
98F2: A6 46       LDA    ,U
98F4: 84 21       ANDA   #$03
98F6: 4A          DECA
98F7: B7 38 D7    STA    $10FF
98FA: BD 1B DA    JSR    play_oh_no_93f2
98FD: 86 89       LDA    #$01
98FF: 97 BA       STA    weapons_flag_98
9901: B7 92 44    STA    $10C6
9904: 86 27       LDA    #$05
9906: BD 02 8A    JSR    $80A2
9909: 20 99       BRA    $991C
990B: BD BB F2    JSR    $93DA
990E: CC 8A 20    LDD    #$0202
9911: BD 02 20    JSR    $80A2
9914: A6 A6       LDA    ,X
9916: 81 80       CMPA   #$02
9918: 10 27 88 69 LBEQ   $99FD
991C: BD B3 4E    JSR    $9BC6
991F: 7E BB DF    JMP    $99FD
9922: A6 C6       LDA    $4,U
9924: 8B 02       ADDA   #$20
9926: A0 86       SUBA   $4,X
9928: 8B 08       ADDA   #$20
992A: 81 C8       CMPA   #$40
992C: 22 B8       BHI    $98BE
992E: A6 8E       LDA    $6,X
9930: 8B 2F       ADDA   #$0D
9932: A0 C4       SUBA   $6,U
9934: 8B 37       ADDA   #$15
9936: 81 A8       CMPA   #$2A
9938: 22 AC       BHI    $98BE
993A: A6 0C       LDA    ,X
993C: 81 2B       CMPA   #$03
993E: 26 80       BNE    $9948
9940: A6 AA 9E    LDA    $1C,X
9943: 26 5F       BNE    $99C2
9945: 7E 19 44    JMP    $9BC6
9948: BD B3 4E    JSR    $9BC6
994B: 81 2A       CMPA   #$02
994D: 27 8B       BEQ    $9952
994F: 7E B1 28    JMP    $930A
9952: BD 11 6D    JSR    $934F
9955: CC 80 86    LDD    #$0204
9958: BD A8 2A    JSR    $80A2
995B: 7E B1 D5    JMP    $99FD
995E: E6 CB       LDB    $3,U
9960: C1 21       CMPB   #$03
9962: 10 27 DD 7A LBEQ   $98BE
9966: A6 C6       LDA    $4,U
9968: 8B 20       ADDA   #$08
996A: A0 8C       SUBA   $4,X
996C: 8B 20       ADDA   #$08
996E: 81 98       CMPA   #$10
9970: 22 72       BHI    $99C2
9972: A6 84       LDA    $6,X
9974: 8B 2A       ADDA   #$08
9976: A0 C4       SUBA   $6,U
9978: 8B 20       ADDA   #$08
997A: 81 98       CMPA   #$10
997C: 22 6C       BHI    $99C2
997E: BD 1B F8    JSR    $93DA
9981: CC 80 81    LDD    #$0203
9984: BD A2 20    JSR    $80A2
9987: A6 AC       LDA    ,X
9989: 81 8A       CMPA   #$02
998B: 27 58       BEQ    $99FD
998D: BD 13 4E    JSR    $9BC6
9990: 20 49       BRA    $99FD
9992: A6 06       LDA    ,X
9994: 81 21       CMPA   #$03
9996: 26 A8       BNE    $99C2
9998: A6 6C       LDA    $4,U
999A: E6 C3       LDB    $B,U
999C: 26 2A       BNE    $99A0
999E: 8B 98       ADDA   #$10
99A0: A0 26       SUBA   $4,X
99A2: 8B 8A       ADDA   #$08
99A4: 81 32       CMPA   #$10
99A6: 22 98       BHI    $99C2
99A8: A6 2E       LDA    $6,X
99AA: 8B 80       ADDA   #$08
99AC: A0 6E       SUBA   $6,U
99AE: 8B 98       ADDA   #$10
99B0: 81 02       CMPA   #$20
99B2: 22 8C       BHI    $99C2
99B4: BD B1 58    JSR    $93DA
99B7: CC 2A 2B    LDD    #$0203
99BA: BD 08 8A    JSR    $80A2
99BD: BD 13 4E    JSR    $9BC6
99C0: 20 19       BRA    $99FD
99C2: 39          RTS
99C3: A6 66       LDA    $4,U
99C5: A0 86       SUBA   $4,X
99C7: 8B 2D       ADDA   #$05
99C9: 81 82       CMPA   #$0A
99CB: 22 DD       BHI    $99C2
99CD: A6 8E       LDA    $6,X
99CF: 8B 2A       ADDA   #$08
99D1: A0 C4       SUBA   $6,U
99D3: 8B 2A       ADDA   #$08
99D5: 81 92       CMPA   #$10
99D7: 22 C1       BHI    $99C2
99D9: A6 0C       LDA    ,X
99DB: 81 2B       CMPA   #$03
99DD: 26 80       BNE    $99E7
99DF: A6 AA 3E    LDA    $1C,X
99E2: 26 5C       BNE    $99C2
99E4: 7E B9 44    JMP    $9BC6
99E7: BD B3 EE    JSR    $9BC6
99EA: 81 8A       CMPA   #$02
99EC: 27 2B       BEQ    $99F1
99EE: 7E 1B 28    JMP    $930A
99F1: BD 11 BD    JSR    $933F
99F4: CC 20 83    LDD    #$0201
99F7: BD A8 8A    JSR    $80A2
99FA: 20 89       BRA    $99FD
99FC: 39          RTS
99FD: 5F          CLRB
99FE: A6 80       LDA    $8,X
9A00: 2A 23       BPL    $9A03
9A02: 5C          INCB
9A03: E7 EA 3A    STB    $18,U
9A06: E6 CB       LDB    $9,U
9A08: C1 0C       CMPB   #$24
9A0A: 27 BE       BEQ    $9A42
9A0C: C1 0D       CMPB   #$25
9A0E: 27 BA       BEQ    $9A42
9A10: 6C EA 95    INC    $17,U
9A13: A6 E6       LDA    ,U
9A15: BD 19 68    JSR    $9BEA
9A18: 81 2F       CMPA   #$07
9A1A: 27 AD       BEQ    $9A41
9A1C: 81 2B       CMPA   #$03
9A1E: 25 8E       BCS    $9A26
9A20: 81 26       CMPA   #$04
9A22: 26 9F       BNE    $9A41
9A24: 86 23       LDA    #$01
9A26: CE 6A 04    LDU    #$E82C
9A29: 48          ASLA
9A2A: EE 4E       LDU    A,U
9A2C: 86 D7       LDA    #$FF
9A2E: A1 4C       CMPA   ,U
9A30: 27 2D       BEQ    $9A41
9A32: 6C 46       INC    ,U
9A34: A6 60       LDA    $2,U
9A36: 8B 83       ADDA   #$01
9A38: 19          DAA
9A39: A7 CA       STA    $2,U
9A3B: A6 69       LDA    $1,U
9A3D: 89 88       ADCA   #$00
9A3F: A7 63       STA    $1,U
9A41: 39          RTS
9A42: 86 83       LDA    #$01
9A44: B7 32 7F    STA    $10FD
9A47: 7F 38 D0    CLR    $10F8
9A4A: 7F 98 D3    CLR    $10FB
9A4D: 39          RTS
9A4E: 8E 99 E2    LDX    #$11C0
9A51: CE 91 42    LDU    #$13C0
9A54: 10 8E 82 8B LDY    #$0009
9A58: EC 66       LDD    $E,U
9A5A: 10 83 28 68 CMPD   #$0040
9A5E: 27 80       BEQ    $9A68
9A60: 10 83 86 C2 CMPD   #$0440
9A64: 26 3C       BNE    $9A84
9A66: 86 8A       LDA    #$08
9A68: 88 20       EORA   #$08
9A6A: AB CE       ADDA   $6,U
9A6C: A0 2E       SUBA   $6,X
9A6E: 8B 80       ADDA   #$08
9A70: 81 32       CMPA   #$10
9A72: 22 92       BHI    $9A84
9A74: A6 66       LDA    $4,U
9A76: A0 86       SUBA   $4,X
9A78: 8B 2D       ADDA   #$05
9A7A: 81 82       CMPA   #$0A
9A7C: 22 2E       BHI    $9A84
9A7E: CC 88 23    LDD    #$0001
9A81: 7E 19 A6    JMP    player_killed_9b24
9A84: 33 EA 92    LEAU   $10,U
9A87: 31 17       LEAY   -$1,Y
9A89: 26 45       BNE    $9A58
9A8B: 39          RTS
9A8C: 8E 39 48    LDX    #$11C0
9A8F: 33 AA 62    LEAU   $40,X
9A92: C6 85       LDB    #$07
9A94: F7 32 62    STB    $10E0
9A97: A6 EC       LDA    ,U
9A99: BD 13 62    JSR    $9BEA
9A9C: 81 20       CMPA   #$08
9A9E: 27 DC       BEQ    $9AF4
9AA0: 81 26       CMPA   #$04
9AA2: 26 84       BNE    $9AAA
9AA4: A6 61       LDA    $3,U
9AA6: 81 81       CMPA   #$03
9AA8: 27 7A       BEQ    $9AFC
9AAA: A6 89       LDA    $1,X
9AAC: 26 66       BNE    $9AFC
9AAE: A6 40 35    LDA    $17,U
9AB1: 26 CB       BNE    $9AFC
9AB3: A6 63       LDA    $1,U
9AB5: 81 8E       CMPA   #$0C
9AB7: 26 3A       BNE    $9ACB
9AB9: BD 13 BD    JSR    $9B35
9ABC: 33 E1 88 48 LEAU   $00C0,U
9AC0: B6 32 62    LDA    $10E0
9AC3: 80 21       SUBA   #$03
9AC5: B7 92 62    STA    $10E0
9AC8: 26 29       BNE    $9ACB
9ACA: 39          RTS
9ACB: A6 6C       LDA    $4,U
9ACD: E6 C3       LDB    $B,U
9ACF: 26 20       BNE    $9AD3
9AD1: 8B 92       ADDA   #$10
9AD3: A0 26       SUBA   $4,X
9AD5: 8B 8A       ADDA   #$08
9AD7: 81 38       CMPA   #$10
9AD9: 22 91       BHI    $9AF4
9ADB: A6 6E       LDA    $6,U
9ADD: A0 8E       SUBA   $6,X
9ADF: 8B 2A       ADDA   #$08
9AE1: 81 92       CMPA   #$10
9AE3: 22 2D       BHI    $9AF4
9AE5: A6 46       LDA    ,U
9AE7: BD B3 C2    JSR    $9BEA
9AEA: 81 8F       CMPA   #$07
9AEC: 27 27       BEQ    $9AFD		; award weapon on hostage release
; killed
9AEE: CC 88 20    LDD    #$0002
9AF1: 7E 19 A6    JMP    player_killed_9b24
9AF4: 33 EA C2    LEAU   $40,U
9AF7: 7A 38 C8    DEC    $10E0
9AFA: 26 13       BNE    $9A97
9AFC: 39          RTS
9AFD: A6 40 AF    LDA    $27,U
9B00: 26 D8       BNE    $9AFC
9B02: 96 1A       LDA    weapons_flag_98
9B04: 4C          INCA
9B05: 81 81       CMPA   #$03
9B07: 23 2F       BLS    $9B10
9B09: BD 1B BB    JSR    $9333
9B0C: 86 2B       LDA    #$03
9B0E: 20 84       BRA    $9B1C
9B10: 34 20       PSHS   A
9B12: BD 11 3B    JSR    $9319
9B15: 86 87       LDA    #$05
9B17: BD A8 8A    JSR    $80A2
9B1A: 35 8A       PULS   A
9B1C: 97 B0       STA    weapons_flag_98
9B1E: 86 89       LDA    #$01
9B20: A7 EA A5    STA    $27,U
9B23: 39          RTS

player_killed_9b24:
9B24: A7 AA 98    STA    $1A,X
9B27: E7 29       STB    $1,X
9B29: 4F          CLRA
9B2A: E6 CC       LDB    $4,U
9B2C: E1 2C       CMPB   $4,X
9B2E: 22 89       BHI    $9B31
9B30: 4C          INCA
9B31: A7 0A 9F    STA    $1D,X
9B34: 39          RTS
9B35: A6 86       LDA    $4,X
9B37: 81 68       CMPA   #$40
9B39: 24 8E       BCC    $9B41
9B3B: A6 6C       LDA    $4,U
9B3D: 81 40       CMPA   #$C8
9B3F: 24 3C       BCC    $9B5F
9B41: A6 C6       LDA    $4,U
9B43: 8B 02       ADDA   #$20
9B45: A0 86       SUBA   $4,X
9B47: 8B 00       ADDA   #$28
9B49: 81 D8       CMPA   #$50
9B4B: 22 3A       BHI    $9B5F
9B4D: A6 CE       LDA    $6,U
9B4F: 80 2E       SUBA   #$0C
9B51: A0 84       SUBA   $6,X
9B53: 8B 32       ADDA   #$10
9B55: 81 A2       CMPA   #$20
9B57: 22 2E       BHI    $9B5F
9B59: CC 88 8A    LDD    #$0002
9B5C: 7E B3 AC    JMP    player_killed_9b24
9B5F: 39          RTS
9B60: 8E 33 42    LDX    #$11C0
9B63: A6 AA 35    LDA    $17,X
9B66: 81 8A       CMPA   #$08
9B68: 26 2E       BNE    $9B70
9B6A: A6 00 3A    LDA    $12,X
9B6D: A7 00 9B    STA    $13,X
9B70: 6C AA 95    INC    $17,X
9B73: A6 AA 30    LDA    $12,X
9B76: 1F 0B       TFR    A,B
9B78: E0 A0 9B    SUBB   $13,X
9B7B: C1 2A       CMPB   #$02
9B7D: 27 81       BEQ    $9B88
9B7F: C1 DC       CMPB   #$FE
9B81: 27 8A       BEQ    $9B8B
9B83: A7 AA 31    STA    $13,X
9B86: 20 8C       BRA    $9B96
9B88: A6 A0 9B    LDA    $13,X
9B8B: 4C          INCA
9B8C: E6 A0 9F    LDB    $17,X
9B8F: C1 2A       CMPB   #$08
9B91: 25 81       BCS    $9B96
9B93: A6 AA 30    LDA    $12,X
9B96: A7 0A 3D    STA    $15,X
9B99: 39          RTS
9B9A: B6 99 FD    LDA    $11D5
9B9D: 5F          CLRB
9B9E: CE 60 18    LDU    #$E83A
9BA1: 81 86       CMPA   #$04
9BA3: 25 27       BCS    $9BAA
9BA5: 80 86       SUBA   #$04
9BA7: 5C          INCB
9BA8: 20 DF       BRA    $9BA1
9BAA: 48          ASLA
9BAB: 33 EE       LEAU   A,U
9BAD: 10 8E 60 10 LDY    #table_e832
9BB1: 58          ASLB
9BB2: 6E 37       JMP    [B,Y]        ; [jump_table]
9BB4: A6 E6       LDA    ,U
9BB6: A7 8A       STA    $8,X
9BB8: A6 69       LDA    $1,U
9BBA: A7 82       STA    $A,X
9BBC: 39          RTS
9BBD: A6 4C       LDA    ,U
9BBF: A7 28       STA    $A,X
9BC1: A6 C3       LDA    $1,U
9BC3: A7 2A       STA    $8,X
9BC5: 39          RTS
9BC6: 34 94       PSHS   X,D
9BC8: A6 AC       LDA    ,X
9BCA: 81 8B       CMPA   #$03
9BCC: 26 39       BNE    $9BDF
9BCE: 6C 00 3E    INC    $1C,X
9BD1: BD 11 DC    JSR    $935E
9BD4: 86 32       LDA    #$10
9BD6: A7 0A 35    STA    $1D,X
9BD9: 20 84       BRA    $9BE7
9BDB: 34 3E       PSHS   X,D
9BDD: 30 4C       LEAX   ,U
9BDF: CC 22 32    LDD    #$0010
9BE2: A7 02       STA    ,X+
9BE4: 5A          DECB
9BE5: 26 79       BNE    $9BE2
9BE7: 35 3E       PULS   D,X
9BE9: 39          RTS
9BEA: 34 C8       PSHS   U
9BEC: CE C3 4C    LDU    #$EBC4
9BEF: A6 E4       LDA    A,U
9BF1: 35 C2       PULS   U
9BF3: 39          RTS
9BF4: 96 B9       LDA    $9B
9BF6: 48          ASLA
9BF7: CE C0 6A    LDU    #$E842
9BFA: EE 4E       LDU    A,U
9BFC: B6 38 69    LDA    $10E1
9BFF: A1 67       CMPA   $5,U
9C01: 22 AD       BHI    $9C32
9C03: A1 66       CMPA   $4,U
9C05: 25 A9       BCS    $9C32
9C07: A0 6C       SUBA   $4,U
9C09: 44          LSRA
9C0A: 1F 01       TFR    A,B
9C0C: 4F          CLRA
9C0D: 1F 8A       TFR    D,Y
9C0F: E3 E6       ADDD   ,U
9C11: FD 92 64    STD    $10E6
9C14: 1F 02       TFR    Y,D
9C16: E3 C0       ADDD   $2,U
9C18: FD 38 60    STD    $10E8
9C1B: 4F          CLRA
9C1C: F6 38 68    LDB    $10E0
9C1F: D3 85       ADDD   $A7
9C21: 83 82 8A    SUBD   #$0008
9C24: 10 B3 92 64 CMPD   $10E6
9C28: 25 20       BCS    $9C32
9C2A: 10 B3 38 C0 CMPD   $10E8
9C2E: 22 8A       BHI    $9C32
9C30: 43          COMA
9C31: 39          RTS
9C32: 33 C4       LEAU   $6,U
9C34: A6 E6       LDA    ,U
9C36: 81 7D       CMPA   #$FF
9C38: 27 2A       BEQ    $9C3C
9C3A: 26 48       BNE    $9BFC
9C3C: 4F          CLRA
9C3D: 39          RTS
9C3E: 96 13       LDA    $9B
9C40: 81 21       CMPA   #$03
9C42: 25 B4       BCS    $9C7A
9C44: 81 27       CMPA   #$05
9C46: 24 76       BCC    $9C3C
9C48: 80 2B       SUBA   #$03
9C4A: 48          ASLA
9C4B: CE C0 E1    LDU    #$E8C9
9C4E: EE 4E       LDU    A,U
9C50: B6 32 63    LDA    $10E1
9C53: A1 67       CMPA   $5,U
9C55: 22 9B       BHI    $9C70
9C57: A1 6C       CMPA   $4,U
9C59: 25 9D       BCS    $9C70
9C5B: 4F          CLRA
9C5C: F6 38 68    LDB    $10E0
9C5F: D3 85       ADDD   $A7
9C61: 83 82 8A    SUBD   #$0008
9C64: 10 A3 46    CMPD   ,U
9C67: 25 2F       BCS    $9C70
9C69: 10 A3 CA    CMPD   $2,U
9C6C: 22 2A       BHI    $9C70
9C6E: 43          COMA
9C6F: 39          RTS
9C70: 33 64       LEAU   $6,U
9C72: A6 46       LDA    ,U
9C74: 81 DD       CMPA   #$FF
9C76: 27 80       BEQ    $9C7A
9C78: 26 FE       BNE    $9C50
9C7A: 4F          CLRA
9C7B: 39          RTS
9C7C: 8E 39 48    LDX    #$11C0
9C7F: A6 AA 38    LDA    $1A,X
9C82: 81 E2       CMPA   #$60
9C84: 24 78       BCC    $9CE0
9C86: A6 0A 32    LDA    $1A,X
9C89: 26 AB       BNE    $9CAE
9C8B: 86 29       LDA    #$01
9C8D: 97 10       STA    weapons_flag_98
9C8F: BD B1 53    JSR    $9371
9C92: CC 7E 62    LDD    #$FC40
9C95: ED 0A 9A    STD    $18,X
9C98: CC D7 88    LDD    #$FF00
9C9B: 6D A0 35    TST    $1D,X
9C9E: 27 8E       BEQ    $9CA6
9CA0: BD BE 64    JSR    $9CE6
9CA3: CC 23 22    LDD    #$0100
9CA6: ED 0A 33    STD    $1B,X
9CA9: 31 0C       LEAY   ,X
9CAB: BD 8F B4    JSR    $A79C
9CAE: EC 00 3A    LDD    $18,X
9CB1: C3 82 B2    ADDD   #$0030
9CB4: ED AA 9A    STD    $18,X
9CB7: 10 83 2C 88 CMPD   #$0400
9CBB: 2B 2A       BMI    $9CBF
9CBD: 22 83       BHI    $9CCA
9CBF: E3 24       ADDD   $6,X
9CC1: ED 84       STD    $6,X
9CC3: EC 26       LDD    $4,X
9CC5: E3 0A 99    ADDD   $1B,X
9CC8: ED 2C       STD    $4,X
9CCA: CE 60 F3    LDU    #$E8DB
9CCD: FF 98 7B    STU    $10F3
9CD0: CE CA 75    LDU    #$E8F7
9CD3: 34 32       PSHS   X
9CD5: 31 06       LEAY   ,X
9CD7: BD 8F 4C    JSR    animate_most_sprites_a764
9CDA: 35 98       PULS   X
9CDC: 6C A0 92    INC    $1A,X
9CDF: 39          RTS
9CE0: 7F 32 7A    CLR    $10F8
9CE3: 0C 9E       INC    $BC
9CE5: 39          RTS
9CE6: 86 83       LDA    #$01
9CE8: A7 20       STA    $8,X
9CEA: A7 83       STA    $B,X
9CEC: 39          RTS
9CED: BD 15 C9    JSR    $9D41
9CF0: EC 2E       LDD    $C,X
9CF2: F1 92 CD    CMPB   $10EF
9CF5: 26 8B       BNE    $9D00
9CF7: A6 24       LDA    $C,X
9CF9: B1 98 66    CMPA   $10EE
9CFC: 27 2E       BEQ    $9D04
9CFE: 22 8A       BHI    $9D02
9D00: 8B 24       ADDA   #$06
9D02: 80 81       SUBA   #$03
9D04: 81 A2       CMPA   #$80
9D06: 25 83       BCS    $9D09
9D08: 4F          CLRA
9D09: 81 B7       CMPA   #$3F
9D0B: 23 20       BLS    $9D15
9D0D: A6 85       LDA    $D,X
9D0F: 40          NEGA
9D10: 4C          INCA
9D11: A7 8F       STA    $D,X
9D13: 86 1D       LDA    #$3F
9D15: A7 8E       STA    $C,X
9D17: CE D0 EE    LDU    #$F8C6
9D1A: E6 4E       LDB    A,U
9D1C: F7 38 65    STB    $10ED
9D1F: CE DB 27    LDU    #$F905
9D22: 40          NEGA
9D23: A6 E4       LDA    A,U
9D25: C6 81       LDB    #$03
9D27: 3D          MUL
9D28: 6D 25       TST    $D,X
9D2A: 26 8A       BNE    $9D2E
9D2C: 43          COMA
9D2D: 53          COMB
9D2E: C3 88 23    ADDD   #$0001
9D31: ED 8A       STD    $8,X
9D33: 86 21       LDA    #$03
9D35: F6 92 6F    LDB    $10ED
9D38: 3D          MUL
9D39: 43          COMA
9D3A: 53          COMB
9D3B: C3 28 29    ADDD   #$0001
9D3E: ED 82       STD    $A,X
9D40: 39          RTS
9D41: 5F          CLRB
9D42: A6 C6       LDA    $4,U
9D44: A1 26       CMPA   $4,X
9D46: 25 83       BCS    $9D49
9D48: 5C          INCB
9D49: F7 98 67    STB    $10EF
9D4C: A6 6C       LDA    $4,U
9D4E: A0 8C       SUBA   $4,X
9D50: 2A 23       BPL    $9D53
9D52: 40          NEGA
9D53: E6 64       LDB    $6,U
9D55: E0 84       SUBB   $6,X
9D57: 2A 29       BPL    $9D5A
9D59: 40          NEGA
9D5A: 81 98       CMPA   #$10
9D5C: 22 2C       BHI    $9D62
9D5E: C1 98       CMPB   #$10
9D60: 25 26       BCS    $9D66
9D62: 44          LSRA
9D63: 54          LSRB
9D64: 20 D6       BRA    $9D5A
9D66: CE 75 8E    LDU    #$F7A6
9D69: 58          ASLB
9D6A: EE 4D       LDU    B,U
9D6C: E6 EE       LDB    A,U
9D6E: F7 98 CC    STB    $10EE
9D71: 39          RTS
9D72: 34 C0       PSHS   U,A
9D74: A6 AA 97    LDA    $15,X
9D77: 27 67       BEQ    $9DC8
9D79: 81 8F       CMPA   #$07
9D7B: 22 63       BHI    $9DC8
9D7D: CE 60 75    LDU    #$E8FD
9D80: 4A          DECA
9D81: 48          ASLA
9D82: EC 44       LDD    A,U
9D84: FE 32 62    LDU    $10E0
9D87: ED 64       STD    $C,U
9D89: 86 8F       LDA    #$07
9D8B: B7 38 CA    STA    $10E2
9D8E: CE 9A 22    LDU    #$1200
9D91: A6 C4       LDA    $6,U
9D93: 27 09       BEQ    $9DC0
9D95: 81 CA       CMPA   #$48
9D97: 22 0F       BHI    $9DC0
9D99: C6 8B       LDB    #$03
9D9B: 10 8E 3C D8 LDY    #$1450
9D9F: A6 04       LDA    $6,Y
9DA1: 27 87       BEQ    $9DA8
9DA3: 11 A3 00    CMPU   $2,Y
9DA6: 27 9A       BEQ    $9DC0
9DA8: 31 80 A8    LEAY   $20,Y
9DAB: 5A          DECB
9DAC: 26 D9       BNE    $9D9F
9DAE: 10 BE 32 C2 LDY    $10E0
9DB2: EF A0       STU    $2,Y
9DB4: 86 23       LDA    #$01
9DB6: A7 A3       STA    $1,Y
9DB8: B6 39 5D    LDA    $11D5
9DBB: A7 80 39    STA    $11,Y
9DBE: 20 86       BRA    $9DCE
9DC0: 33 EA C2    LEAU   $40,U
9DC3: 7A 32 C0    DEC    $10E2
9DC6: 26 4B       BNE    $9D91
9DC8: 10 BE 98 68 LDY    $10E0
9DCC: 6F 09       CLR    $1,Y
9DCE: 35 CA       PULS   A,U
9DD0: 39          RTS
9DD1: CE 6B 8F    LDU    #$E90D
9DD4: A6 AA 9E    LDA    $1C,X
9DD7: 27 2B       BEQ    $9DDC
9DD9: CE 61 97    LDU    #$E91F
9DDC: 6C A0 9B    INC    $13,X
9DDF: A6 AA 31    LDA    $13,X
9DE2: A1 DD       CMPA   -$1,U
9DE4: 25 34       BCS    $9DFC
9DE6: 6F 0A 3B    CLR    $13,X
9DE9: 6C 00 9A    INC    $12,X
9DEC: A6 A0 9A    LDA    $12,X
9DEF: A1 7C       CMPA   -$2,U
9DF1: 25 86       BCS    $9DF7
9DF3: 4F          CLRA
9DF4: A7 AA 90    STA    $12,X
9DF7: 48          ASLA
9DF8: EC EE       LDD    A,U
9DFA: ED 86       STD    $E,X
9DFC: 39          RTS
9DFD: CE 9A 88    LDU    #$1200
9E00: C6 25       LDB    #$07
9E02: F7 92 C2    STB    $10E0
9E05: A6 46       LDA    ,U
9E07: BD B3 C2    JSR    $9BEA
9E0A: E6 CC       LDB    $4,U
9E0C: 81 20       CMPA   #$08
9E0E: 27 8E       BEQ    $9E16
9E10: 81 26       CMPA   #$04
9E12: 26 9A       BNE    $9E2C
9E14: CB 2A       ADDB   #$08
9E16: E0 86       SUBB   $4,X
9E18: CB 24       ADDB   #$0C
9E1A: C1 90       CMPB   #$18
9E1C: 22 26       BHI    $9E2C
9E1E: A6 8E       LDA    $6,X
9E20: 8B 21       ADDA   #$03
9E22: A0 C4       SUBA   $6,U
9E24: 8B 2A       ADDA   #$08
9E26: 81 92       CMPA   #$10
9E28: 22 2A       BHI    $9E2C
9E2A: 43          COMA
9E2B: 39          RTS
9E2C: 33 E0 C8    LEAU   $40,U
9E2F: 7A 32 C2    DEC    $10E0
9E32: 26 53       BNE    $9E05
9E34: 4F          CLRA
9E35: 39          RTS
9E36: 96 1D       LDA    level_completed_flag_9f
9E38: 26 6C       BNE    $9E7E
9E3A: B6 99 C4    LDA    $11EC
9E3D: 26 B7       BNE    $9E7E
9E3F: B6 32 DF    LDA    $10FD
9E42: 81 83       CMPA   #$01
9E44: 27 1A       BEQ    $9E7E
9E46: B6 92 D3    LDA    $10FB
9E49: 26 8D       BNE    $9E50
9E4B: B6 38 D0    LDA    $10F8
9E4E: 27 A6       BEQ    $9E7E
9E50: CE 30 82    LDU    #$1200
9E53: C6 25       LDB    #$07
9E55: A6 CB       LDA    $9,U
9E57: 81 0C       CMPA   #$24
9E59: 27 80       BEQ    $9E63
9E5B: 81 0D       CMPA   #$25
9E5D: 27 8C       BEQ    $9E63
9E5F: A6 64       LDA    $6,U
9E61: 26 99       BNE    $9E7E
9E63: 33 EA 62    LEAU   $40,U
9E66: 5A          DECB
9E67: 26 C4       BNE    $9E55
9E69: 7F 98 70    CLR    $10F8
9E6C: 96 B3       LDA    $9B
9E6E: 81 8C       CMPA   #$04
9E70: 26 28       BNE    level_completed_9e7c
9E72: B6 92 D9    LDA    $10FB
9E75: 26 8A       BNE    $9E7F
9E77: 7C 38 DF    INC    $10F7
9E7A: 20 8A       BRA    $9E7E
level_completed_9e7c:
9E7C: 0C B7       INC    level_completed_flag_9f
9E7E: 39          RTS
9E7F: 7C 33 CE    INC    $11EC
9E82: 39          RTS

9E83: A6 AA 0E    LDA    $2C,X
9E86: 85 80       BITA   #$02
9E88: 26 68       BNE    $9ECA
9E8A: 5F          CLRB
9E8B: A6 2C       LDA    $4,X
9E8D: 81 F6       CMPA   #$7E
9E8F: 22 07       BHI    $9EB6
9E91: A6 84       LDA    $6,X
9E93: 81 B3       CMPA   #$91
9E95: 27 86       BEQ    $9E9B
9E97: 22 33       BHI    $9EB4
9E99: 20 92       BRA    $9EB5
9E9B: A6 2C       LDA    $4,X
9E9D: 81 F6       CMPA   #$7E
9E9F: 26 34       BNE    $9EB7
9EA1: CC 42 80    LDD    #$C002
9EA4: ED AA A9    STD    $2B,X
9EA7: 86 23       LDA    #$0B
9EA9: B7 9A E8    STA    $1260
9EAC: 6F A0 AE    CLR    game_sub_state_26,X
9EAF: 31 A6       LEAY   ,X
9EB1: 7E 25 1E    JMP    $A79C
9EB4: 5C          INCB
9EB5: 5C          INCB
9EB6: 5C          INCB
9EB7: CE C1 03    LDU    #$E92B
9EBA: A6 4D       LDA    B,U
9EBC: B1 38 48    CMPA   $10C0
9EBF: 26 21       BNE    $9EC4
9EC1: B7 92 43    STA    $10C1
9EC4: B7 32 42    STA    $10C0
9EC7: 7E BC AC    JMP    $9484
9ECA: 31 0C       LEAY   ,X
9ECC: CE C1 A7    LDU    #$E92F
9ECF: FF 32 D1    STU    $10F3
9ED2: CE 6B 18    LDU    #$E93A
9ED5: 34 92       PSHS   X
9ED7: BD 8F 4C    JSR    animate_most_sprites_a764
9EDA: 35 98       PULS   X
9EDC: A6 A0 A3    LDA    $2B,X
9EDF: 81 A2       CMPA   #$80
9EE1: 26 81       BNE    $9EE6
9EE3: BD B1 CC    JSR    play_you_saved_manhattan_93ee
9EE6: 6A 0A 03    DEC    $2B,X
9EE9: 26 8A       BNE    $9EED
9EEB: 0C B7       INC    level_completed_flag_9f
9EED: 39          RTS
9EEE: DC 2F       LDD    $A7
9EF0: 10 83 82 82 CMPD   #$0000
9EF4: 27 4C       BEQ    $9F64
9EF6: DC 25       LDD    $A7
9EF8: 10 83 77 D8 CMPD   #$FF50
9EFC: 25 7E       BCS    $9F54
9EFE: B6 98 C2    LDA    $10E0
9F01: 7C 92 62    INC    $10E0
9F04: 81 36       CMPA   #$14
9F06: 27 84       BEQ    $9F0E
9F08: 22 2F       BHI    $9F11
9F0A: 0C D7       INC    timer_fraction_of_second_5f
9F0C: 20 61       BRA    $9F57
9F0E: BD 1C 00    JSR    $9422
9F11: 8E 93 42    LDX    #$11C0
9F14: 31 A6       LEAY   ,X
9F16: CE 61 EE    LDU    #$E3C6
9F19: FF 98 7B    STU    $10F3
9F1C: CE CE A5    LDU    #$E62D
9F1F: 34 32       PSHS   X
9F21: BD 25 E6    JSR    animate_most_sprites_a764
9F24: 35 32       PULS   X
9F26: B6 92 C8    LDA    $10E0
9F29: 34 9E       PSHS   X,D
9F2B: BD BE 80    JSR    $96A8
9F2E: FC 98 E2    LDD    $10C0
9F31: 53          COMB
9F32: F4 92 E2    ANDB   $10C0
9F35: C5 92       BITB   #$10
9F37: 27 2B       BEQ    $9F3C
9F39: BD 1E 69    JSR    $96E1
9F3C: BD BB 77    JSR    $93FF
9F3F: 35 34       PULS   D,X
9F41: B7 92 62    STA    $10E0
9F44: 6F 23       CLR    $1,X
9F46: A6 86       LDA    $4,X
9F48: E6 2E       LDB    $6,X
9F4A: 8B 98       ADDA   #$10
9F4C: C0 38       SUBB   #$10
9F4E: A7 00 06    STA    $24,X
9F51: E7 0A A4    STB    game_sub_state_26,X
9F54: BD A6 FC    JSR    $847E
9F57: B6 38 C8    LDA    $10E0
9F5A: 81 9C       CMPA   #$14
9F5C: 24 2E       BCC    $9F64
9F5E: BD 17 8F    JSR    $9FAD
9F61: BD 1D 66    JSR    $9FE4
9F64: C6 2C       LDB    #$0E
9F66: 8E 90 28    LDX    #$1200
9F69: A6 8C       LDA    $4,X
9F6B: 81 D0       CMPA   #$F8
9F6D: 26 8A       BNE    $9F71
9F6F: 6F 24       CLR    $6,X
9F71: 81 72       CMPA   #$F0
9F73: 23 24       BLS    $9F7B
9F75: A6 8D       LDA    $F,X
9F77: 8A A8       ORA    #$80
9F79: A7 87       STA    $F,X
9F7B: 30 A0 38    LEAX   $10,X
9F7E: 5A          DECB
9F7F: 26 CA       BNE    $9F69
9F81: 8E 93 62    LDX    #$11E0
9F84: 6C 29       INC    $B,X
9F86: A6 89       LDA    $B,X
9F88: 85 20       BITA   #$08
9F8A: 27 90       BEQ    $9FA4
9F8C: 8E 3A 18    LDX    #$1290
9F8F: 86 19       LDA    #$3B
9F91: F6 92 62    LDB    $10E0
9F94: 27 24       BEQ    $9F9C
9F96: C1 91       CMPB   #$13
9F98: 23 3A       BLS    $9FAC
9F9A: 86 B2       LDA    #$3A
9F9C: 5F          CLRB
9F9D: ED 86       STD    $E,X
9F9F: 86 1B       LDA    #$39
9FA1: ED 0A BC    STD    $3E,X
9FA4: B6 32 42    LDA    $10C0
9FA7: 84 18       ANDA   #$30
9FA9: B7 98 48    STA    $10C0
9FAC: 39          RTS
9FAD: 8E 9A 88    LDX    #$1200
9FB0: 86 42       LDA    #$60
9FB2: C6 22       LDB    #$A0
9FB4: BD BD 50    JSR    $9FD2
9FB7: 86 48       LDA    #$60
9FB9: C6 18       LDB    #$90
9FBB: BD B7 FA    JSR    $9FD2
9FBE: 80 B0       SUBA   #$38
9FC0: A7 26       STA    $4,X
9FC2: C0 92       SUBB   #$10
9FC4: E7 24       STB    $6,X
9FC6: 30 0A 38    LEAX   $10,X
9FC9: 8B 80       ADDA   #$08
9FCB: CB 18       ADDB   #$30
9FCD: A7 8C       STA    $4,X
9FCF: E7 24       STB    $6,X
9FD1: 39          RTS
9FD2: 10 8E 22 24 LDY    #$0006
9FD6: A7 86       STA    $4,X
9FD8: E7 2E       STB    $6,X
9FDA: 8B 98       ADDA   #$10
9FDC: 30 A0 98    LEAX   $10,X
9FDF: 31 1D       LEAY   -$1,Y
9FE1: 26 71       BNE    $9FD6
9FE3: 39          RTS
9FE4: 8E 30 82    LDX    #$1200
9FE7: 5F          CLRB
9FE8: B6 38 68    LDA    $10E0
9FEB: 27 2E       BEQ    $9FF3
9FED: 5C          INCB
9FEE: 81 9B       CMPA   #$13
9FF0: 25 23       BCS    $9FF3
9FF2: 5C          INCB
9FF3: 58          ASLB
9FF4: CE CB C2    LDU    #$E940
9FF7: EE ED       LDU    B,U
9FF9: 10 8E 88 26 LDY    #$000E
9FFD: C6 C8       LDB    #$40
9FFF: A6 E2       LDA    ,U+
A001: ED 8C       STD    $E,X
A003: 81 1D       CMPA   #$3F
A005: 26 80       BNE    $A009
A007: 6F 27       CLR    $F,X
A009: 30 00 98    LEAX   $10,X
A00C: 31 17       LEAY   -$1,Y
A00E: 26 67       BNE    $9FFF
A010: 39          RTS
A011: 6F 0A 91    CLR    $13,X
A014: BD B1 A9    JSR    $932B
A017: F6 39 EE    LDB    $11C6
A01A: C0 8E       SUBB   #$06
A01C: 20 26       BRA    $A02C
A01E: 86 70       LDA    #$F8
A020: A7 26       STA    $4,X
A022: 4F          CLRA
A023: A7 2A       STA    $8,X
A025: A7 89       STA    $B,X
A027: F6 3A 5D    LDB    $1275
A02A: 20 FC       BRA    $A0A0
A02C: CB 23       ADDB   #$0B
A02E: 20 FB       BRA    $A0A3
A030: F6 30 F7    LDB    $1275
A033: E7 26       STB    $4,X
A035: 6F 0A 90    CLR    $12,X
A038: C6 78       LDB    #$50
A03A: 96 13       LDA    $9B
A03C: 81 2C       CMPA   #$04
A03E: 26 EB       BNE    $A0A3
A040: 86 04       LDA    #$26
A042: B7 92 D0    STA    $10F2
A045: C0 86       SUBB   #$04
A047: 20 72       BRA    $A0A3
A049: BD 1B 5A    JSR    play_let_the_hostages_go_93d2
A04C: CC 88 77    LDD    #$A0FF
A04F: A7 26       STA    $4,X
A051: 4F          CLRA
A052: A7 8A       STA    $8,X
A054: A7 29       STA    $B,X
A056: 20 C9       BRA    $A0A3
A058: F6 3A FD    LDB    $1275
A05B: 20 6B       BRA    $A0A0
A05D: F6 9A FD    LDB    $1275
A060: 20 63       BRA    $A0A3
A062: 86 7A       LDA    #$F8
A064: A7 26       STA    $4,X
A066: 4F          CLRA
A067: A7 20       STA    $8,X
A069: A7 83       STA    $B,X
A06B: 20 0E       BRA    $A093
A06D: C6 E8       LDB    #$60
A06F: 20 10       BRA    $A0A3
A071: C6 62       LDB    #$E0
A073: 20 0C       BRA    $A0A3
A075: C6 BA       LDB    #$38
A077: 96 B3       LDA    $9B
A079: 81 8A       CMPA   #$02
A07B: 26 0B       BNE    $A0A0
A07D: C6 C0       LDB    #$48
A07F: 20 3D       BRA    $A0A0
A081: BD 11 54    JSR    $93D6
A084: 20 21       BRA    $A089
A086: BD 11 E6    JSR    $93CE
A089: C6 E8       LDB    #$60
A08B: 20 3B       BRA    $A0A0
A08D: 86 E8       LDA    #$60
A08F: C1 82       CMPB   #$A0
A091: 24 89       BCC    $A09E
A093: 86 C2       LDA    #$E0
A095: A7 88       STA    $A,X
A097: A7 25       STA    $D,X
A099: C6 8D       LDB    #$05
A09B: F7 38 DA    STB    $10F2
A09E: 1F 01       TFR    A,B
A0A0: 6C AA 90    INC    $12,X
A0A3: E7 24       STB    $6,X
A0A5: B6 92 70    LDA    $10F2
A0A8: A7 21       STA    $9,X
A0AA: 6F 00 08    CLR    $20,X
A0AD: 81 A9       CMPA   #$21
A0AF: 26 24       BNE    $A0B7
A0B1: 6F 0A 91    CLR    $13,X
A0B4: BD B1 96    JSR    $9314
A0B7: 39          RTS
A0B8: B6 38 79    LDA    $10F1
A0BB: A7 AC       STA    ,X
A0BD: 27 70       BEQ    $A0B7
A0BF: C6 D2       LDB    #$F0
A0C1: E7 86       STB    $4,X
A0C3: CE CB 90    LDU    #table_e9b2
A0C6: 4A          DECA
A0C7: 48          ASLA
A0C8: F6 39 4E    LDB    $11C6
A0CB: E7 20       STB    $8,X
A0CD: E7 83       STB    $B,X
A0CF: 6F AA 30    CLR    $12,X
A0D2: 6E 54       JMP    [A,U]        ; [jump_table]
A0D4: 8E CB 13    LDX    #$E991
A0D7: A6 AD       LDA    B,X
A0D9: B7 98 7A    STA    $10F2
A0DC: 8E C1 F8    LDX    #$E970
A0DF: E6 A7       LDB    B,X
A0E1: F7 92 72    STB    $10F0
A0E4: 33 86       LEAU   ,Y
A0E6: A6 C3       LDA    $1,U
A0E8: 27 2E       BEQ    $A0F0
A0EA: 33 40 38    LEAU   $10,U
A0ED: 4A          DECA
A0EE: 26 72       BNE    $A0EA
A0F0: 30 E6       LEAX   ,U
A0F2: F6 92 D2    LDB    $10F0
A0F5: 11 83 96 78 CMPU   #$1450
A0F9: 24 34       BCC    $A0B7
A0FB: 6D 69       TST    $1,U
A0FD: 26 6F       BNE    $A0E6
A0FF: 33 EA 32    LEAU   $10,U
A102: 5A          DECB
A103: 26 D2       BNE    $A0F5
A105: B6 92 72    LDA    $10F0
A108: 4A          DECA
A109: 27 8E       BEQ    $A111
A10B: 11 83 3B 58 CMPU   #$13D0
A10F: 24 84       BCC    $A0B7
A111: 4C          INCA
A112: A7 83       STA    $1,X
A114: 20 80       BRA    $A0B8
A116: 8E 90 28    LDX    #$1200
A119: BD 1B 56    JSR    $93DE
A11C: 86 29       LDA    #$01
A11E: CE 71 6B    LDU    #$F949
A121: BD 2C 43    JSR    $AEC1
A124: 7E 80 04    JMP    $A286
A127: 8E 3A 68    LDX    #$1240
A12A: 86 89       LDA    #$01
A12C: CE D1 C7    LDU    #$F94F
A12F: BD 8C E3    JSR    $AEC1
A132: 7F 90 70    CLR    $1252
A135: 7E 20 04    JMP    $A286
A138: 8E 3B C8    LDX    #$1340
A13B: 20 F7       BRA    $A11C
A13D: 8E 9A 48    LDX    #$12C0
A140: 20 F8       BRA    $A11C
A142: 8E 91 22    LDX    #$1300
A145: 20 57       BRA    $A11C
A147: F6 38 D6    LDB    $10FE
A14A: 27 9E       BEQ    $A162
A14C: 7C 38 76    INC    $10FE
A14F: C1 62       CMPB   #$40
A151: 25 8C       BCS    $A161
A153: 86 23       LDA    #$01
A155: 97 1C       STA    nb_lives_current_player_9e
A157: 97 94       STA    $BC
A159: BD 09 9F    JSR    $8117
A15C: C6 39       LDB    #$11
A15E: BD 08 83    JSR    $80A1
A161: 39          RTS
A162: F6 92 D9    LDB    $10FB
A165: 10 26 83 35 LBNE   $A286
A169: 7C 98 7F    INC    $10F7
A16C: 81 2A       CMPA   #$02
A16E: 27 2E       BEQ    $A116
A170: 81 32       CMPA   #$10
A172: 27 31       BEQ    $A127
A174: 81 02       CMPA   #$20
A176: 27 42       BEQ    $A138
A178: 81 18       CMPA   #$30
A17A: 27 49       BEQ    $A13D
A17C: 81 68       CMPA   #$40
A17E: 27 4A       BEQ    $A142
A180: 81 66       CMPA   #$44
A182: 10 25 23 22 LBCS   $A286
A186: 7C 92 D3    INC    $10FB
A189: 7C 9A A8    INC    $1220
A18C: 7C 3A 68    INC    $12E0
A18F: 7C 31 02    INC    $1320
A192: 7C 91 42    INC    $1360
A195: 86 8B       LDA    #$09
A197: B7 3A 48    STA    $1260
A19A: 7E 2A AE    JMP    $A286
; animate enemies, projectiles, ..., everything except
; main character
animate_most_sprites_a19d:
A19D: 10 8E 9A 22 LDY    #$1200
A1A1: BD 2D E2    JSR    $AF60
A1A4: B6 32 75    LDA    $10F7
A1A7: 26 B6       BNE    $A147
A1A9: DC 23       LDD    $AB
A1AB: 81 08       CMPA   #$20
A1AD: 25 83       BCS    $A1BA
A1AF: C4 3D       ANDB   #$1F
A1B1: C1 9D       CMPB   #$1F
A1B3: 26 27       BNE    $A1BA
A1B5: C6 A2       LDB    #$20
A1B7: 7E 8A A8    JMP    $A280
A1BA: 8E 7C EF    LDX    #$F4C7
A1BD: 96 13       LDA    $9B
A1BF: 48          ASLA
A1C0: AE A4       LDX    A,X
A1C2: DC 25       LDD    $A7
A1C4: 10 B3 90 F0 CMPD   $1272
A1C8: 26 3C       BNE    $A1DE
A1CA: 7C 9A 58    INC    $1270
A1CD: B6 9A F8    LDA    $1270
A1D0: D6 B5       LDB    stage_number_97
A1D2: C1 84       CMPB   #$06
A1D4: 24 74       BCC    $A22C
A1D6: 81 B2       CMPA   #$30
A1D8: 10 25 88 22 LBCS   $A286
A1DC: 20 66       BRA    $A22C
A1DE: 7F 9A 52    CLR    $1270
A1E1: FD 90 F0    STD    $1272
A1E4: 7F 32 77    CLR    $10F5
A1E7: 10 A3 AC    CMPD   ,X
A1EA: 27 95       BEQ    $A209
A1EC: 34 2B       PSHS   A,CC
A1EE: A6 8A       LDA    $2,X
A1F0: 81 3A       CMPA   #$18
A1F2: 25 86       BCS    $A1F8
A1F4: 81 02       CMPA   #$20
A1F6: 25 85       BCS    $A1FF
A1F8: 80 27       SUBA   #$0F
A1FA: 27 8B       BEQ    $A1FF
A1FC: 4A          DECA
A1FD: 26 8A       BNE    $A201
A1FF: 30 23       LEAX   $1,X
A201: 30 81       LEAX   $3,X
A203: 35 21       PULS   CC,A
A205: 24 62       BCC    $A1E7
A207: 20 55       BRA    $A286
A209: E6 8A       LDB    $2,X
A20B: A6 2B       LDA    $3,X
A20D: B7 9A FD    STA    $1275
A210: 20 4C       BRA    $A280
A212: CC 82 23    LDD    #$0001
A215: F3 92 7B    ADDD   $10F9
A218: FD 38 71    STD    $10F9
A21B: 10 83 2A 88 CMPD   #$0200
A21F: 25 34       BCS    $A237
A221: B7 92 7A    STA    $10F8
A224: 81 26       CMPA   #$04
A226: 25 DC       BCS    $A286
A228: 0C B7       INC    level_completed_flag_9f
A22A: 20 D2       BRA    $A286
A22C: 96 B3       LDA    $9B
A22E: 48          ASLA
A22F: CC 28 6A    LDD    #$0A48
A232: 10 93 85    CMPD   $A7
A235: 25 59       BCS    $A212
A237: 7C 38 DD    INC    $10F5
A23A: 8E 7B C9    LDX    #$F3E1
A23D: 96 13       LDA    $9B
A23F: 48          ASLA
A240: AE A4       LDX    A,X
A242: DC 25       LDD    $A7
A244: 10 A3 06    CMPD   ,X
A247: 25 2C       BCS    $A24D
A249: 30 8B       LEAX   $3,X
A24B: 20 DF       BRA    $A244
A24D: A6 8A       LDA    $2,X
A24F: D6 B9       LDB    $9B
A251: 8E 76 A3    LDX    #$F421
A254: 58          ASLB
A255: 48          ASLA
A256: AE 07       LDX    B,X
A258: AE AE       LDX    A,X
A25A: B6 98 DD    LDA    $10F5
A25D: 30 8B       LEAX   $3,X
A25F: A1 3F       CMPA   -$3,X
A261: 27 86       BEQ    $A267
A263: 25 03       BCS    $A286
A265: 20 74       BRA    $A25D
A267: A6 AA       LDA    ,-X
A269: B7 9A FD    STA    $1275
A26C: E6 AA       LDB    ,-X
A26E: F7 98 D3    STB    $10F1
A271: 7C 92 74    INC    $10F6
A274: B6 32 74    LDA    $10F6
A277: 8E C3 B0    LDX    #table_eb98
A27A: F6 98 D4    LDB    $10FC
A27D: 58          ASLB
A27E: 6E 1D       JMP    [B,X]        ; [jump_table]
A280: F7 32 73    STB    $10F1
A283: BD 82 F6    JSR    $A0D4
A286: A6 A3       LDA    $1,Y
A288: 10 26 89 55 LBNE   $A469
A28C: A7 0E       STA    $6,Y
A28E: 31 20 32    LEAY   $10,Y
A291: 10 8C 96 72 CMPY   #$1450
A295: 25 6D       BCS    $A286
A297: 39          RTS
A298: 84 2B       ANDA   #$03
A29A: 26 62       BNE    $A286
A29C: 20 22       BRA    $A2A8
A29E: 84 8A       ANDA   #$02
A2A0: 26 C6       BNE    $A286
A2A2: 20 86       BRA    $A2A8
A2A4: 84 21       ANDA   #$03
A2A6: 27 5C       BEQ    $A286
A2A8: F6 38 79    LDB    $10F1
A2AB: 20 FE       BRA    $A283
A2AD: E6 20 9D    LDB    $15,Y
A2B0: 26 2A       BNE    $A2BA
A2B2: C6 81       LDB    #$03
A2B4: E7 8A 9E    STB    $1C,Y
A2B7: 6F 80 35    CLR    $1D,Y
A2BA: 6C 20 3D    INC    $15,Y
A2BD: 4F          CLRA
A2BE: C0 82       SUBB   #$0A
A2C0: 25 21       BCS    $A2C5
A2C2: 4C          INCA
A2C3: 20 DB       BRA    $A2BE
A2C5: 81 81       CMPA   #$03
A2C7: 25 24       BCS    $A2D5
A2C9: 6F 20 9D    CLR    $15,Y
A2CC: 6F 80 9F    CLR    $17,Y
A2CF: BD 84 CA    JSR    $A6E8
A2D2: 7E 26 D2    JMP    $A4F0
A2D5: B7 90 FB    STA    $1279
A2D8: 6F 80 9A    CLR    $12,Y
A2DB: E6 01       LDB    $9,Y
A2DD: 34 C8       PSHS   U
A2DF: BD 84 D0    JSR    $A6F2
A2E2: F7 92 D1    STB    $10F3
A2E5: CE 6F 12    LDU    #$ED90
A2E8: 8E C3 4C    LDX    #$EBC4
A2EB: E6 8C       LDB    ,Y
A2ED: E6 0D       LDB    B,X
A2EF: C1 2A       CMPB   #$08
A2F1: 26 A3       BNE    $A314
A2F3: 10 8C 30 82 CMPY   #$1200
A2F7: 26 33       BNE    $A314
A2F9: 96 13       LDA    $9B
A2FB: 81 2D       CMPA   #$05
A2FD: 27 9D       BEQ    $A314
A2FF: 7F 30 5B    CLR    $1279
A302: CE 69 AA    LDU    #$EB88
A305: A6 2A 97    LDA    $15,Y
A308: 81 38       CMPA   #$10
A30A: 26 FD       BNE    $A381
A30C: CC 2A 80    LDD    #$0208
A30F: BD A2 80    JSR    $80A2
A312: 20 EF       BRA    $A381
A314: C1 25       CMPB   #$07
A316: 26 8F       BNE    $A325
A318: A6 8C       LDA    ,Y
A31A: 84 8B       ANDA   #$03
A31C: 4A          DECA
A31D: 48          ASLA
A31E: CE 63 84    LDU    #$EBA6
A321: EE 44       LDU    A,U
A323: 20 7E       BRA    $A381
A325: C1 87       CMPB   #$05
A327: 26 01       BNE    $A352
A329: A6 A0       LDA    $8,Y
A32B: 26 22       BNE    $A337
A32D: E7 A0       STB    $8,Y
A32F: E7 09       STB    $B,Y
A331: A6 A6       LDA    $4,Y
A333: 8B 32       ADDA   #$10
A335: A7 A6       STA    $4,Y
A337: 10 8C 3A D8 CMPY   #$1250
A33B: 24 3D       BCC    $A352
A33D: 7F 9A F1    CLR    $1279
A340: CE C9 12    LDU    #$EB90
A343: A6 8A 37    LDA    $15,Y
A346: 81 92       CMPA   #$10
A348: 26 1F       BNE    $A381
A34A: CC 8A 20    LDD    #$0208
A34D: BD 08 2A    JSR    $80A2
A350: 20 0D       BRA    $A381
A352: 86 81       LDA    #$03
A354: 3D          MUL
A355: 1F 1A       TFR    B,A
A357: 8B 2A       ADDA   #$02
A359: A6 4E       LDA    A,U
A35B: EE ED       LDU    B,U
A35D: 1F 01       TFR    A,B
A35F: B6 32 D5    LDA    $10F7
A362: 27 8A       BEQ    $A36C
A364: 10 8C 90 C2 CMPY   #$1240
A368: 27 2A       BEQ    $A36C
A36A: C6 8E       LDB    #$06
A36C: B6 3A F1    LDA    $1279
A36F: F7 30 5B    STB    $1279
A372: D6 19       LDB    $9B
A374: C1 27       CMPB   #$05
A376: 26 84       BNE    $A37E
A378: 6F 80 9B    CLR    $13,Y
A37B: CE C5 99    LDU    #$EDB1
A37E: 48          ASLA
A37F: EE E4       LDU    A,U
A381: 30 26       LEAX   ,Y
A383: B6 32 DF    LDA    $10FD
A386: 27 90       BEQ    $A39A
A388: 8C 3A C8    CMPX   #$1240
A38B: 26 25       BNE    $A39A
A38D: 86 8C       LDA    #$04
A38F: B7 32 D0    STA    $10F2
A392: 6F 2A 35    CLR    $17,Y
A395: 35 C2       PULS   U
A397: 7E 8C D8    JMP    $A4F0
A39A: A6 48       LDA    ,U+
A39C: A7 26       STA    $E,X
A39E: E6 48       LDB    ,U+
A3A0: FA 30 FB    ORB    $1279
A3A3: E7 2D       STB    $F,X
A3A5: 30 0A 92    LEAX   $10,X
A3A8: 7A 38 7B    DEC    $10F3
A3AB: 26 C5       BNE    $A39A
A3AD: CE 63 4C    LDU    #$EBC4
A3B0: A6 86       LDA    ,Y
A3B2: A6 44       LDA    A,U
A3B4: 81 21       CMPA   #$03
A3B6: 25 84       BCS    $A3BE
A3B8: 96 B3       LDA    $9B
A3BA: 81 8D       CMPA   #$05
A3BC: 26 38       BNE    $A3CE
A3BE: EC 20 3E    LDD    $1C,Y
A3C1: 83 82 BA    SUBD   #$0038
A3C4: ED 8A 9E    STD    $1C,Y
A3C7: EC 0E       LDD    $6,Y
A3C9: A3 20 94    SUBD   $1C,Y
A3CC: ED 0E       STD    $6,Y
A3CE: 35 C8       PULS   U
A3D0: BD 85 94    JSR    $A716
A3D3: A6 03       LDA    $1,Y
A3D5: 81 8E       CMPA   #$0C
A3D7: 10 26 29 9D LBNE   $A4F0
A3DB: 30 8C       LEAX   ,Y
A3DD: E6 00 9B    LDB    $13,X
A3E0: 26 3A       BNE    $A3FA
A3E2: E6 86       LDB    $4,X
A3E4: C1 DA       CMPB   #$F8
A3E6: 24 81       BCC    $A3EB
A3E8: 5D          TSTB
A3E9: 2B 8E       BMI    $A3F1
A3EB: E6 27       LDB    $F,X
A3ED: CA 08       ORB    #$80
A3EF: E7 2D       STB    $F,X
A3F1: 30 0A 92    LEAX   $10,X
A3F4: 4A          DECA
A3F5: 26 69       BNE    $A3E2
A3F7: 7E 8C D8    JMP    $A4F0
A3FA: E6 8C       LDB    $4,X
A3FC: C1 B8       CMPB   #$90
A3FE: 10 25 22 CC LBCS   $A4F0
A402: E6 86       LDB    $4,X
A404: 2A 24       BPL    $A40C
A406: E6 8D       LDB    $F,X
A408: CA A8       ORB    #$80
A40A: E7 87       STB    $F,X
A40C: 30 A0 98    LEAX   $10,X
A40F: 4A          DECA
A410: 26 D2       BNE    $A402
A412: 7E 26 D2    JMP    $A4F0
A415: CE 69 46    LDU    #$EBC4
A418: A6 8C       LDA    ,Y
A41A: A6 4E       LDA    A,U
A41C: CE C1 7A    LDU    #$E9F2
A41F: 8E CB DA    LDX    #$E9F8
A422: 4A          DECA
A423: 48          ASLA
A424: AE A4       LDX    A,X
A426: E6 2A 09    LDB    $21,Y
A429: 5A          DECB
A42A: 58          ASLB
A42B: AE AD       LDX    B,X
A42D: BF 98 7B    STX    $10F3
A430: A6 0B       LDA    $9,Y
A432: 34 A0       PSHS   Y,A
A434: BD 85 E6    JSR    animate_most_sprites_a764
A437: 35 0A       PULS   A,Y
A439: E6 A1       LDB    $9,Y
A43B: 10 26 28 01 LBNE   $A4C8
A43F: A7 0B       STA    $9,Y
A441: 6F 2A A3    CLR    $21,Y
A444: A6 09       LDA    $B,Y
A446: B7 92 D8    STA    $10F0
A449: E6 20 AD    LDB    game_state_25,Y
A44C: BD 80 3A    JSR    $A8B2
A44F: CE CE DD    LDU    #$ECFF
A452: A6 AB       LDA    $9,Y
A454: 27 25       BEQ    $A45D
A456: 4A          DECA
A457: 48          ASLA
A458: EE EE       LDU    A,U
A45A: BD 2F 3E    JSR    $A716
A45D: CC 88 C8    LDD    #$0040
A460: AE 8A A0    LDX    $22,Y
A463: ED 2C       STD    $E,X
A465: A6 AB       LDA    $9,Y
A467: 20 77       BRA    $A4C8
A469: A6 2C       LDA    ,Y
A46B: 10 27 2A B1 LBEQ   $A6A8
A46F: E6 8A 03    LDB    $21,Y
A472: 26 23       BNE    $A415
A474: E6 8A A5    LDB    $27,Y
A477: 10 26 29 B3 LBNE   $A5B6
A47B: 8E C4 85    LDX    #$ECAD
A47E: CE 64 DD    LDU    #$ECFF
A481: A6 AB       LDA    $9,Y
A483: 4A          DECA
A484: 48          ASLA
A485: EE 44       LDU    A,U
A487: EC AE       LDD    A,X
A489: FD 98 7B    STD    $10F3
A48C: A6 80 9F    LDA    $17,Y
A48F: 10 26 DC 98 LBNE   $A2AD
A493: A6 0B       LDA    $9,Y
A495: 34 A0       PSHS   Y,A
A497: BD 8F 4C    JSR    animate_most_sprites_a764
A49A: 35 AA       PULS   A,Y
A49C: E6 09       LDB    $1,Y
A49E: C1 84       CMPB   #$0C
A4A0: 26 04       BNE    $A4C8
A4A2: E6 A4       LDB    $6,Y
A4A4: E7 8A C4    STB    $46,Y
A4A7: E7 81 28 0E STB    $0086,Y
A4AB: C0 38       SUBB   #$10
A4AD: E7 20 9E    STB    $16,Y
A4B0: C0 32       SUBB   #$10
A4B2: E7 2A 04    STB    game_sub_state_26,Y
A4B5: E6 A6       LDB    $4,Y
A4B7: E7 80 3C    STB    $14,Y
A4BA: E7 20 0C    STB    $24,Y
A4BD: CB 98       ADDB   #$10
A4BF: E7 8A 66    STB    $44,Y
A4C2: CB 92       ADDB   #$10
A4C4: E7 8B 82 06 STB    $0084,Y
A4C8: E6 80 9A    LDB    $12,Y
A4CB: 27 2B       BEQ    $A4D0
A4CD: BD 2D 77    JSR    $A5FF
A4D0: E6 86       LDB    ,Y
A4D2: 8E 69 C7    LDX    #table_ebe5
A4D5: 58          ASLB
A4D6: AD 17       JSR    [B,X]        ; [jump_table]
A4D8: 96 B3       LDA    $9B
A4DA: 81 8D       CMPA   #$05
A4DC: 27 3A       BEQ    $A4F0
A4DE: 80 8A       SUBA   #$02
A4E0: 25 2C       BCS    $A4F0
A4E2: E6 26       LDB    ,Y
A4E4: 27 28       BEQ    $A4F0
A4E6: C1 A2       CMPB   #$20
A4E8: 27 2E       BEQ    $A4F0
A4EA: 48          ASLA
A4EB: 8E C3 88    LDX    #table_eba0
A4EE: AD 1E       JSR    [A,X]        ; [jump_table]
A4F0: B6 32 70    LDA    $10F2
A4F3: 31 8A 32    LEAY   $10,Y
A4F6: 4A          DECA
A4F7: 26 D2       BNE    $A4F3
A4F9: 10 8C 9C 78 CMPY   #$1450
A4FD: 10 25 75 A7 LBCS   $A286
A501: 39          RTS
A502: 8E 69 E6    LDX    #$EBC4
A505: A6 26       LDA    ,Y
A507: C6 2B       LDB    #$03
A509: A6 0E       LDA    A,X
A50B: 27 21       BEQ    $A516
A50D: 4A          DECA
A50E: 27 82       BEQ    $A51A
A510: 4A          DECA
A511: 27 89       BEQ    $A51E
A513: 35 32       PULS   X
A515: 39          RTS
A516: CC 83 2F    LDD    #$0107
A519: 39          RTS
A51A: CC 80 24    LDD    #$080C
A51D: 39          RTS
A51E: CC 85 33    LDD    #$0D11
A521: 39          RTS
A522: DC 25       LDD    $A7
A524: 10 83 88 C2 CMPD   #$0A40
A528: 24 0B       BCC    $A54D
A52A: 10 83 20 E8 CMPD   #$08C0
A52E: 25 99       BCS    $A541
A530: 8D F2       BSR    $A502
A532: A7 AB       STA    $9,Y
A534: A6 04       LDA    $6,Y
A536: 81 02       CMPA   #$80
A538: 25 3B       BCS    $A54D
A53A: E7 A1       STB    $9,Y
A53C: E7 02       STB    $A,Y
A53E: E7 A5       STB    $D,Y
A540: 39          RTS
A541: 10 83 83 92 CMPD   #$01B0
A545: 25 84       BCS    $A54D
A547: 10 83 2A B8 CMPD   #$0230
A54B: 25 27       BCS    $A55C
A54D: 39          RTS
A54E: DC 2F       LDD    $A7
A550: 10 83 8A C2 CMPD   #$0840
A554: 25 D5       BCS    $A54D
A556: 10 83 21 A8 CMPD   #$0980
A55A: 24 79       BCC    $A54D
A55C: 8D 27       BSR    $A56D
A55E: A7 A1       STA    $9,Y
A560: A6 04       LDA    $6,Y
A562: 81 32       CMPA   #$B0
A564: 24 C5       BCC    $A54D
A566: E7 AB       STB    $9,Y
A568: 6F 02       CLR    $A,Y
A56A: 6F A5       CLR    $D,Y
A56C: 39          RTS
A56D: 8E 63 4C    LDX    #$EBC4
A570: A6 86       LDA    ,Y
A572: C6 81       LDB    #$03
A574: A6 A4       LDA    A,X
A576: 27 8B       BEQ    $A581
A578: 4A          DECA
A579: 27 82       BEQ    $A585
A57B: 4A          DECA
A57C: 27 23       BEQ    $A589
A57E: 35 98       PULS   X
A580: 39          RTS
A581: CC 83 81    LDD    #$0103
A584: 39          RTS
A585: CC 8A 88    LDD    #$080A
A588: 39          RTS
A589: CC 85 87    LDD    #$0D0F
A58C: 39          RTS
A58D: DC 2F       LDD    $A7
A58F: 10 83 23 62 CMPD   #$01E0
A593: 25 D5       BCS    $A58C
A595: 10 83 81 1B CMPD   #$0333
A599: 25 49       BCS    $A55C
A59B: 10 83 21 08 CMPD   #$0980
A59F: 25 C9       BCS    $A58C
A5A1: 10 83 8B D2 CMPD   #$09F0
A5A5: 24 67       BCC    $A58C
A5A7: A6 80 09    LDA    $21,Y
A5AA: 26 68       BNE    $A58C
A5AC: A6 03       LDA    $B,Y
A5AE: B7 98 D2    STA    $10F0
A5B1: C6 83       LDB    #$01
A5B3: 7E 8A 90    JMP    $A8B2
A5B6: C6 86       LDB    #$04
A5B8: F7 38 7A    STB    $10F2
A5BB: 8E C3 58    LDX    #$EB70
A5BE: C6 8D       LDB    #$05
A5C0: 81 33       CMPA   #$11
A5C2: 27 8C       BEQ    $A5D2
A5C4: 8E C9 FA    LDX    #$EB78
A5C7: C6 2E       LDB    #$06
A5C9: 81 9E       CMPA   #$16
A5CB: 27 2D       BEQ    $A5D2
A5CD: C6 8F       LDB    #$07
A5CF: 8E C9 A2    LDX    #$EB80
A5D2: 6C 2A 05    INC    $27,Y
A5D5: A6 2A A5    LDA    $27,Y
A5D8: 81 08       CMPA   #$20
A5DA: 26 86       BNE    $A5EA
A5DC: 6F 80 AF    CLR    $27,Y
A5DF: BD 84 CA    JSR    $A6E8
A5E2: 86 80       LDA    #$02
A5E4: BD A2 20    JSR    $80A2
A5E7: 7E 8C D8    JMP    $A4F0
A5EA: 33 2C       LEAU   ,Y
A5EC: 86 2C       LDA    #$04
A5EE: E6 08       LDB    ,X+
A5F0: E7 6C       STB    $E,U
A5F2: E6 02       LDB    ,X+
A5F4: E7 6D       STB    $F,U
A5F6: 33 4A 38    LEAU   $10,U
A5F9: 4A          DECA
A5FA: 26 7A       BNE    $A5EE
A5FC: 7E 8C 78    JMP    $A4F0
A5FF: E6 09       LDB    $B,Y
A601: 26 88       BNE    $A60D
A603: E6 8A 06    LDB    $24,Y
A606: CB A2       ADDB   #$20
A608: E7 80 AC    STB    $24,Y
A60B: 20 20       BRA    $A615
A60D: E6 20 BC    LDB    $34,Y
A610: C0 02       SUBB   #$20
A612: E7 2A 16    STB    $34,Y
A615: 39          RTS
A616: E6 A6       LDB    $4,Y
A618: C1 D5       CMPB   #$FD
A61A: 24 8E       BCC    $A622
A61C: E6 37       LDB    -$1,X
A61E: C1 94       CMPB   #$1C
A620: 25 2A       BCS    $A62A
A622: 6F 9D       CLR    -$1,X
A624: BD 84 6A    JSR    $A6E8
A627: 7E 8C D8    JMP    $A4F0
; divide B per 7, result in A
A62A: 4F          CLRA
A62B: C0 2F       SUBB   #$07
A62D: 4C          INCA
A62E: 24 73       BCC    $A62B
A630: 4A          DECA
A631: 48          ASLA
A632: CE 6F 43    LDU    #$ED61
A635: A6 44       LDA    A,U
A637: C6 68       LDB    #$40
A639: ED A6       STD    $E,Y
A63B: 7E 8C D8    JMP    $A4F0
A63E: 8E 9A 10    LDX    #$1232
A641: 86 80       LDA    #$02
A643: 10 BF 32 72 STY    $10F0
A647: CE 3B E8    LDU    #$13C0
A64A: E6 08       LDB    ,X+
A64C: 11 B3 98 78 CMPU   $10F0
A650: 27 2E       BEQ    animate_molotovs_a65e
A652: 33 4A 32    LEAU   $10,U
A655: 4A          DECA
A656: 26 70       BNE    $A64A
A658: 86 2F       LDA    #$07
A65A: 30 8B       LEAX   $3,X
A65C: 20 C4       BRA    $A64A
animate_molotovs_a65e:
A65E: 6C 97       INC    -$1,X
A660: 4F          CLRA
A661: C1 B5       CMPB   #$37
A663: 25 23       BCS    $A666
; divide B per 8, result in A
A665: 5F          CLRB
A666: C0 8A       SUBB   #$08
A668: 4C          INCA
A669: 24 73       BCC    $A666
A66B: 4A          DECA
A66C: CE C5 D9    LDU    #$ED51
A66F: 48          ASLA
A670: EC E4       LDD    A,U
A672: ED AC       STD    $E,Y
A674: A6 0A       LDA    $8,Y
A676: A1 A4       CMPA   $6,Y
A678: 25 B4       BCS    $A616
A67A: EC A0       LDD    $8,Y
A67C: E3 04       ADDD   $C,Y
A67E: ED A0       STD    $8,Y
A680: BD 84 43    JSR    $A6C1
A683: A6 06       LDA    $4,Y
A685: 81 7F       CMPA   #$FD
A687: 24 B1       BCC    $A622
A689: EC A2       LDD    $A,Y
A68B: 83 28 30    SUBD   #$0018
A68E: ED A2       STD    $A,Y
A690: EC 04       LDD    $6,Y
A692: 81 92       CMPA   #$10
A694: 25 AE       BCS    $A622
A696: A3 A8       SUBD   $A,Y
A698: ED 0E       STD    $6,Y
A69A: A1 A0       CMPA   $8,Y
A69C: 10 25 76 D8 LBCS   $A4F0
A6A0: 6F 3D       CLR    -$1,X
A6A2: BD 11 61    JSR    $9343
A6A5: 7E 26 72    JMP    $A4F0
A6A8: C6 29       LDB    #$01
A6AA: F7 98 DA    STB    $10F2
A6AD: EC A6       LDD    $E,Y
A6AF: 10 83 1D 82 CMPD   #$3F00
A6B3: 10 27 DC BB LBEQ   $A4F0
A6B7: A6 00       LDA    $8,Y
A6B9: 26 0B       BNE    $A63E
A6BB: BD 8E E9    JSR    $A6C1
A6BE: 7E 2C D2    JMP    $A4F0
A6C1: EC A0       LDD    $2,Y
A6C3: E3 06       ADDD   $4,Y
A6C5: ED A6       STD    $4,Y
A6C7: EC 04       LDD    $C,Y
A6C9: E3 AE       ADDD   $6,Y
A6CB: ED 0E       STD    $6,Y
A6CD: E6 A0       LDB    $8,Y
A6CF: 26 34       BNE    $A6E7
A6D1: E6 AE       LDB    $C,Y
A6D3: 2A 24       BPL    $A6DB
A6D5: 81 C2       CMPA   #$40
A6D7: 25 24       BCS    $A6E5
A6D9: 20 8C       BRA    $A6DF
A6DB: 81 38       CMPA   #$10
A6DD: 25 8E       BCS    $A6E5
A6DF: A6 06       LDA    $4,Y
A6E1: 81 7F       CMPA   #$FD
A6E3: 25 20       BCS    $A6E7
A6E5: 8D 83       BSR    $A6E8
A6E7: 39          RTS
A6E8: 86 38       LDA    #$10
A6EA: 33 2C       LEAU   ,Y
A6EC: 6F E8       CLR    ,U+
A6EE: 4A          DECA
A6EF: 26 D9       BNE    $A6EC
A6F1: 39          RTS
A6F2: E6 C6       LDB    $4,U
A6F4: 58          ASLB
A6F5: 34 92       PSHS   X
A6F7: 8E C4 8D    LDX    #$ECA5
A6FA: EC 0D       LDD    B,X
A6FC: FD 38 78    STD    $10F0
A6FF: 3D          MUL
A700: F7 32 70    STB    $10F2
A703: 35 32       PULS   X
A705: C1 8F       CMPB   #$0D
A707: 24 29       BCC    $A70A
A709: 39          RTS
A70A: CC 8A 2A    LDD    #$0202
A70D: FD 98 78    STD    $10F0
A710: C6 26       LDB    #$04
A712: B7 92 D0    STA    $10F2
A715: 39          RTS
A716: 8D 58       BSR    $A6F2
A718: 30 8C       LEAX   ,Y
A71A: A6 AE       LDA    $6,Y
A71C: F6 38 78    LDB    $10F0
A71F: A7 24       STA    $6,X
A721: 30 0A 92    LEAX   $10,X
A724: 5A          DECB
A725: 26 7A       BNE    $A71F
A727: 80 38       SUBA   #$10
A729: 7A 98 79    DEC    $10F1
A72C: 26 C6       BNE    $A71C
A72E: 8D 4A       BSR    $A6F2
A730: 30 86       LEAX   ,Y
A732: B6 92 D2    LDA    $10F0
A735: E6 A6       LDB    $4,Y
A737: E7 2C       STB    $4,X
A739: 30 00 98    LEAX   $10,X
A73C: CB 38       ADDB   #$10
A73E: 4A          DECA
A73F: 26 D4       BNE    $A737
A741: 7A 92 73    DEC    $10F1
A744: 26 CE       BNE    $A732
A746: 39          RTS
A747: 30 0C       LEAX   $4,Y
A749: EC 4C       LDD    ,U		; [video_address_word]
A74B: 20 2C       BRA    $A751
A74D: 30 AE       LEAX   $6,Y
A74F: EC 60       LDD    $2,U		; [video_address_word]
A751: 27 71       BEQ    $A746
A753: 6D 26       TST    $4,X
A755: 27 87       BEQ    $A75C
A757: 43          COMA
A758: 53          COMB
A759: C3 88 89    ADDD   #$0001
A75C: B7 38 78    STA    $10F0
A75F: E3 A6       ADDD   ,X
A761: ED 06       STD    ,X
A763: 39          RTS

animate_most_sprites_a764:
A764: A6 0E       LDA    $C,Y
A766: 26 88       BNE    $A772
A768: 6C 04       INC    $C,Y
A76A: 86 77       LDA    #$FF
A76C: A7 0A       STA    $2,Y
A76E: 86 89       LDA    #$01
A770: A7 01       STA    $3,Y
A772: 8D 51       BSR    $A747
A774: 8D F5       BSR    $A74D
A776: 8D 1C       BSR    $A716
A778: A6 0B       LDA    $3,Y
A77A: 4A          DECA
A77B: F6 38 DA    LDB    $10F2
A77E: 58          ASLB
A77F: 3D          MUL
A780: BE 32 71    LDX    $10F3
A783: 30 A7       LEAX   B,X
A785: A6 A1       LDA    $3,Y
A787: 26 29       BNE    $A78A
A789: 4C          INCA
A78A: 30 0E       LEAX   A,X
A78C: E6 37       LDB    -$1,X
A78E: EB AA       ADDB   $2,Y
A790: E7 00       STB    $2,Y
A792: 24 96       BCC    $A7A8
A794: 6C 01       INC    $3,Y
A796: 6F A0       CLR    $2,Y
A798: A1 6D       CMPA   $5,U
A79A: 23 85       BLS    $A7A9
A79C: 4F          CLRA
A79D: 5F          CLRB
A79E: A7 A1       STA    $9,Y
A7A0: A7 0E       STA    $C,Y
A7A2: A7 A5       STA    $7,Y
A7A4: A7 07       STA    $5,Y
A7A6: ED A0       STD    $2,Y
A7A8: 39          RTS

A7A9: A6 A3       LDA    $B,Y
A7AB: 27 3B       BEQ    $A7C0
A7AD: B6 98 7A    LDA    $10F2
A7B0: B7 32 72    STA    $10F0
A7B3: EC A3       LDD    ,X++
A7B5: ED AC       STD    $E,Y
A7B7: 31 80 38    LEAY   $10,Y
A7BA: 7A 98 D8    DEC    $10F0
A7BD: 26 7C       BNE    $A7B3
A7BF: 39          RTS

A7C0: BD 84 70    JSR    $A6F2
A7C3: B6 32 D2    LDA    $10F0
A7C6: F6 92 D8    LDB    $10F0
A7C9: 31 20 98    LEAY   $10,Y
A7CC: 4A          DECA
A7CD: 26 72       BNE    $A7C9
A7CF: 33 86       LEAU   ,Y
A7D1: 33 D2       LEAU   -$10,U
A7D3: A6 A2       LDA    ,X+
A7D5: A7 CC       STA    $E,U
A7D7: A6 A8       LDA    ,X+
A7D9: 88 98       EORA   #$10
A7DB: A7 67       STA    $F,U
A7DD: 5A          DECB
A7DE: 26 79       BNE    $A7D1
A7E0: 7A 32 73    DEC    $10F1
A7E3: 26 FC       BNE    $A7C3
A7E5: 39          RTS

A7E6: E6 AB       LDB    $9,Y
A7E8: 26 22       BNE    $A7F4
A7EA: A7 A1       STA    $9,Y
A7EC: BD 85 C3    JSR    $AD4B
A7EF: BD B1 19    JSR    $933B
A7F2: 20 80       BRA    $A7F6
A7F4: A7 0B       STA    $9,Y
A7F6: A6 A6       LDA    $4,Y
A7F8: 81 A8       CMPA   #$80
A7FA: 10 25 29 BC LBCS   $A992
A7FE: 81 18       CMPA   #$90
A800: 10 24 83 0C LBCC   $A992
A804: A6 09       LDA    $B,Y
A806: B7 92 D8    STA    $10F0
A809: C6 89       LDB    #$01
A80B: BD 80 9A    JSR    $A8B2
A80E: 7E 21 B0    JMP    $A992
A811: BD 2A 17    JSR    $A895
A814: E6 08       LDB    $A,Y
A816: 27 8E       BEQ    $A824
A818: 81 2D       CMPA   #$05
A81A: 25 8C       BCS    $A820
A81C: 81 20       CMPA   #$08
A81E: 25 81       BCS    $A829
A820: 86 27       LDA    #$05
A822: 20 92       BRA    $A834
A824: 81 21       CMPA   #$03
A826: 25 83       BCS    $A829
A828: 4F          CLRA
A829: E6 A1       LDB    $9,Y
A82B: 10 26 29 EB LBNE   $A992
A82F: 81 25       CMPA   #$07
A831: 27 6F       BEQ    $A820
A833: 4C          INCA
A834: A7 0B       STA    $9,Y
A836: E6 26       LDB    ,Y
A838: C1 2C       CMPB   #$04
A83A: 26 8B       BNE    $A83F
A83C: BD 80 2D    JSR    $A8A5
A83F: 7E 8B B0    JMP    $A992
A842: E6 A6       LDB    $4,Y
A844: C1 72       CMPB   #$50
A846: 25 86       BCS    $A84C
A848: C1 D8       CMPB   #$F0
A84A: 25 8E       BCS    $A852
A84C: C6 3C       LDB    #$14
A84E: A6 A1       LDA    $9,Y
A850: 20 2C       BRA    $A860
A852: A6 AB       LDA    $9,Y
A854: 8D 1D       BSR    $A895
A856: E6 A8       LDB    $A,Y
A858: 26 2C       BNE    $A85E
A85A: C6 87       LDB    #$0F
A85C: 20 2A       BRA    $A860
A85E: C6 99       LDB    #$11
A860: E7 0B       STB    $9,Y
A862: 4D          TSTA
A863: 10 26 23 A9 LBNE   $A992
A867: BD 85 63    JSR    $AD4B
A86A: 8C 9C 78    CMPX   #$1450
A86D: 10 24 89 03 LBCC   $A992
A871: BD 11 B5    JSR    $9337
A874: A6 24       LDA    $6,X
A876: A7 8A       STA    $8,X
A878: CC 2B 88    LDD    #$0300
A87B: ED 22       STD    $A,X
A87D: 7E 21 1A    JMP    $A992
A880: EC 2C       LDD    $E,X
A882: C8 92       EORB   #$10
A884: FD 32 71    STD    $10F3
A887: EC A0 36    LDD    $1E,X
A88A: C8 98       EORB   #$10
A88C: ED 26       STD    $E,X
A88E: FC 98 D1    LDD    $10F3
A891: ED 0A 9C    STD    $1E,X
A894: 39          RTS
A895: E6 A4       LDB    $6,Y
A897: C1 F8       CMPB   #$D0
A899: 24 8D       BCC    $A8A0
A89B: C1 4C       CMPB   #$64
A89D: 24 8D       BCC    $A8A4
A89F: 5F          CLRB
A8A0: E7 08       STB    $A,Y
A8A2: E7 AF       STB    $D,Y
A8A4: 39          RTS
A8A5: A6 A9       LDA    $B,Y
A8A7: B7 38 D8    STA    $10F0
A8AA: B6 99 EC    LDA    $11C4
A8AD: A1 AC       CMPA   $4,Y
A8AF: 25 23       BCS    $A8B2
A8B1: 5F          CLRB
A8B2: E7 AA       STB    $8,Y
A8B4: E7 09       STB    $B,Y
A8B6: A6 2A 3A    LDA    $12,Y
A8B9: 27 AA       BEQ    $A8DD
A8BB: A6 0C       LDA    $4,Y
A8BD: 5D          TSTB
A8BE: 26 81       BNE    $A8C9
A8C0: F6 32 72    LDB    $10F0
A8C3: 10 27 DD FA LBEQ   $A83F
A8C7: 20 2F       BRA    $A8D0
A8C9: F6 98 78    LDB    $10F0
A8CC: 26 FE       BNE    $A8A4
A8CE: 8B A8       ADDA   #$20
A8D0: 80 32       SUBA   #$10
A8D2: A7 A6       STA    $4,Y
A8D4: 30 86       LEAX   ,Y
A8D6: 8D 2A       BSR    $A880
A8D8: 30 A0 A8    LEAX   $20,X
A8DB: 8D 8B       BSR    $A880
A8DD: CE 64 77    LDU    #$ECFF
A8E0: A6 0B       LDA    $9,Y
A8E2: 4A          DECA
A8E3: 48          ASLA
A8E4: EE E4       LDU    A,U
A8E6: BD 25 3E    JSR    $A716
A8E9: A6 20 9A    LDA    $12,Y
A8EC: 27 9E       BEQ    $A8A4
A8EE: 7E 2D DD    JMP    $A5FF
A8F1: E6 AB       LDB    $9,Y
A8F3: 26 2B       BNE    $A8FE
A8F5: A7 AB       STA    $9,Y
A8F7: BD BB FE    JSR    $93D6
A8FA: 20 8A       BRA    $A8FE
A8FC: A7 01       STA    $9,Y
A8FE: E6 AE       LDB    $6,Y
A900: C1 32       CMPB   #$10
A902: 10 25 22 B4 LBCS   $A99C
A906: 7E 2B BA    JMP    $A992
A909: E6 A1       LDB    $9,Y
A90B: 10 26 28 0B LBNE   $A992
A90F: A7 0B       STA    $9,Y
A911: BD 2F C9    JSR    $AD4B
A914: BD B1 B5    JSR    $9337
A917: A6 2E       LDA    $6,X
A919: A7 80       STA    $8,X
A91B: CC 2B 28    LDD    #$0300
A91E: ED 82       STD    $A,X
A920: 20 52       BRA    $A992
A922: E6 AB       LDB    $9,Y
A924: 26 4E       BNE    $A992
A926: A7 AB       STA    $9,Y
A928: BD 85 C3    JSR    $AD4B
A92B: BD BB 13    JSR    $933B
A92E: 20 EA       BRA    $A992
A930: E6 0B       LDB    $9,Y
A932: 26 99       BNE    $A94F
A934: 86 26       LDA    #$04
A936: A7 AB       STA    $9,Y
A938: A6 80 9B    LDA    $13,Y
A93B: 27 2C       BEQ    $A941
A93D: A6 AC       LDA    $4,Y
A93F: 2B 2E       BMI    $A94D
A941: BD 11 B9    JSR    $933B
A944: BD 8F C9    JSR    $AD4B
A947: 20 2C       BRA    $A94D
A949: E6 A1       LDB    $9,Y
A94B: 26 2A       BNE    $A94F
A94D: 86 8C       LDA    #$04
A94F: A7 0B       STA    $9,Y
A951: 33 26       LEAU   ,Y
A953: E6 06       LDB    $4,Y
A955: A6 2A 91    LDA    $13,Y
A958: 26 30       BNE    $A972
A95A: 5D          TSTB
A95B: 2A 38       BPL    $A96D
A95D: C6 84       LDB    #$0C
A95F: A6 66       LDA    $4,U
A961: 2B 80       BMI    $A965
A963: 6F 64       CLR    $6,U
A965: 33 4A 92    LEAU   $10,U
A968: 5A          DECB
A969: 26 7C       BNE    $A95F
A96B: 20 0D       BRA    $A992
A96D: 6C 20 9B    INC    $13,Y
A970: 20 02       BRA    $A992
A972: 86 8E       LDA    #$0C
A974: E6 06       LDB    $4,Y
A976: 10 2A 28 AB LBPL   $A9FD
A97A: C1 38       CMPB   #$B0
A97C: 25 36       BCS    $A99C
A97E: E6 CC       LDB    $4,U
A980: 2A 24       BPL    $A988
A982: E6 CD       LDB    $F,U
A984: CA A2       ORB    #$80
A986: E7 CD       STB    $F,U
A988: 33 E0 98    LEAU   $10,U
A98B: 4A          DECA
A98C: 26 D8       BNE    $A97E
A98E: A6 DC       LDA    -$C,U
A990: 20 24       BRA    $A998
A992: A6 A6       LDA    $4,Y
A994: E6 09       LDB    $B,Y
A996: 27 8F       BEQ    $A9A5
A998: 81 D5       CMPA   #$FD
A99A: 25 E9       BCS    $A9FD
A99C: 6F 80 A9    CLR    $21,Y
A99F: 6F 8A 31    CLR    $13,Y
A9A2: 7E 24 CA    JMP    $A6E8
A9A5: 81 6F       CMPA   #$ED
A9A7: 25 7C       BCS    $A9FD
A9A9: 81 78       CMPA   #$F0
A9AB: 24 78       BCC    $A9FD
A9AD: 20 65       BRA    $A99C
A9AF: E6 0B       LDB    $9,Y
A9B1: 26 9C       BNE    $A9D1
A9B3: A7 0B       STA    $9,Y
A9B5: BD 2F C9    JSR    $AD4B
A9B8: A6 8C       LDA    ,Y
A9BA: 81 8D       CMPA   #$05
A9BC: 27 26       BEQ    $A9CC
A9BE: BD 1B 15    JSR    $9337
A9C1: A6 84       LDA    $6,X
A9C3: A7 2A       STA    $8,X
A9C5: CC 81 82    LDD    #$0300
A9C8: ED 22       STD    $A,X
A9CA: 20 8F       BRA    $A9D3
A9CC: BD BB B3    JSR    $933B
A9CF: 20 20       BRA    $A9D3
A9D1: A7 AB       STA    $9,Y
A9D3: A6 09       LDA    $B,Y
A9D5: B7 92 72    STA    $10F0
A9D8: 8E C4 AF    LDX    #$EC27
A9DB: E6 8C       LDB    ,Y
A9DD: C1 8D       CMPB   #$05
A9DF: 27 21       BEQ    $A9E4
A9E1: 8E 6E B3    LDX    #table_ec31
A9E4: E6 8A A2    LDB    $20,Y
A9E7: 58          ASLB
A9E8: A6 0C       LDA    $4,Y
A9EA: AD 1D       JSR    [B,X]        ; [jump_table]
A9EC: BD 80 3A    JSR    $A8B2
A9EF: 20 83       BRA    $A992
A9F1: B1 93 46    CMPA   $11C4
A9F4: 25 6B       BCS    $AA3F
A9F6: BD 28 47    JSR    $AA6F
A9F9: 86 80       LDA    #$08
A9FB: A7 01       STA    $9,Y
A9FD: 39          RTS
A9FE: E6 AE       LDB    $6,Y
AA00: F1 33 44    CMPB   $11C6
AA03: 24 18       BCC    $AA3F
AA05: 8D EA       BSR    $AA6F
AA07: 86 22       LDA    #$0A
AA09: A7 A1       STA    $9,Y
AA0B: 39          RTS
AA0C: E6 0E       LDB    $6,Y
AA0E: C1 58       CMPB   #$D0
AA10: 24 0F       BCC    $AA3F
AA12: CC 82 22    LDD    #$0000
AA15: 8D D9       BSR    $AA72
AA17: 86 22       LDA    #$0A
AA19: A7 A1       STA    $9,Y
AA1B: 39          RTS
AA1C: 81 F8       CMPA   #$D0
AA1E: 24 97       BCC    $AA3F
AA20: CC 22 82    LDD    #$0000
AA23: 8D 6F       BSR    $AA72
AA25: 86 8A       LDA    #$08
AA27: A7 01       STA    $9,Y
AA29: 39          RTS
AA2A: E6 AE       LDB    $6,Y
AA2C: C1 4C       CMPB   #$64
AA2E: 25 82       BCS    $AA3A
AA30: CC 23 82    LDD    #$0100
AA33: 8D 1F       BSR    $AA72
AA35: 86 89       LDA    #$0B
AA37: A7 01       STA    $9,Y
AA39: 39          RTS
AA3A: 6F 20 08    CLR    $20,Y
AA3D: 20 8B       BRA    $AA42
AA3F: 6C 8A 02    INC    $20,Y
AA42: 35 C2       PULS   U
AA44: 7E 8B 10    JMP    $A992
AA47: E6 01       LDB    $9,Y
AA49: 10 26 77 6D LBNE   $A992
AA4D: A7 A1       STA    $9,Y
AA4F: 5C          INCB
AA50: BD 8A 27    JSR    $A8A5
AA53: BD 8F 69    JSR    $AD4B
AA56: BD 11 13    JSR    $933B
AA59: 7E 21 1A    JMP    $A992
AA5C: E6 01       LDB    $9,Y
AA5E: 10 26 DD 12 LBNE   $A992
AA62: A7 AB       STA    $9,Y
AA64: D6 7D       LDB    timer_fraction_of_second_5f
AA66: C1 F2       CMPB   #$70
AA68: 10 25 77 AE LBCS   $A992
AA6C: 7E 82 DB    JMP    $AA53
AA6F: CC 22 23    LDD    #$0001
AA72: A7 A8       STA    $A,Y
AA74: A7 0F       STA    $D,Y
AA76: A6 2A 09    LDA    $21,Y
AA79: 26 8D       BNE    $AA80
AA7B: E7 00       STB    $8,Y
AA7D: E7 A3       STB    $B,Y
AA7F: 39          RTS
AA80: E6 0A       LDB    $8,Y
AA82: 39          RTS
AA83: B1 33 E6    CMPA   $11C4
AA86: 25 35       BCS    $AA3F
AA88: CC 29 89    LDD    #$0101
AA8B: 8D CD       BSR    $AA72
AA8D: 86 85       LDA    #$0D
AA8F: A7 0B       STA    $9,Y
AA91: 39          RTS
AA92: E6 A4       LDB    $6,Y
AA94: F1 33 44    CMPB   $11C6
AA97: 25 8E       BCS    $AA3F
AA99: CC 89 89    LDD    #$0101
AA9C: 8D FC       BSR    $AA72
AA9E: 86 99       LDA    #$11
AAA0: A7 0B       STA    $9,Y
AAA2: 39          RTS
AAA3: E6 04       LDB    $6,Y
AAA5: C1 E6       CMPB   #$64
AAA7: 25 BE       BCS    $AA3F
AAA9: CC 89 88    LDD    #$0100
AAAC: 8D EC       BSR    $AA72
AAAE: 86 99       LDA    #$11
AAB0: A7 0B       STA    $9,Y
AAB2: 39          RTS
AAB3: 81 F2       CMPA   #$D0
AAB5: 10 24 7D AE LBCC   $AA3F
AAB9: CC 88 88    LDD    #$0000
AABC: 8D 9C       BSR    $AA72
AABE: 86 85       LDA    #$0D
AAC0: A7 0B       STA    $9,Y
AAC2: 39          RTS
AAC3: E6 04       LDB    $6,Y
AAC5: C1 52       CMPB   #$D0
AAC7: 10 24 D7 E7 LBCC   $AA3A
AACB: CC 28 28    LDD    #$0000
AACE: 8D 2A       BSR    $AA72
AAD0: 86 2C       LDA    #$0E
AAD2: A7 AB       STA    $9,Y
AAD4: 39          RTS
AAD5: E6 A6       LDB    $4,Y
AAD7: C1 78       CMPB   #$50
AAD9: 25 8C       BCS    $AADF
AADB: C1 D8       CMPB   #$F0
AADD: 25 87       BCS    $AAEE
AADF: C6 31       LDB    #$13
AAE1: A6 AB       LDA    $9,Y
AAE3: 20 3A       BRA    $AAFD
AAE5: A6 A6       LDA    $4,Y
AAE7: 81 38       CMPA   #$10
AAE9: 25 8B       BCS    $AAEE
AAEB: BD 80 8D    JSR    $A8A5
AAEE: A6 A1       LDA    $9,Y
AAF0: BD 8A 17    JSR    $A895
AAF3: E6 08       LDB    $A,Y
AAF5: 26 86       BNE    $AAFB
AAF7: C6 22       LDB    #$0A
AAF9: 20 8A       BRA    $AAFD
AAFB: C6 24       LDB    #$0C
AAFD: E7 A1       STB    $9,Y
AAFF: 4D          TSTA
AB00: 10 26 7C 0C LBNE   $A992
AB04: BD 8F C9    JSR    $AD4B
AB07: BD BB 13    JSR    $933B
AB0A: 7E 21 BA    JMP    $A992
AB0D: A7 A1       STA    $9,Y
AB0F: 7E 8B B0    JMP    $A992
AB12: BD 2A B7    JSR    $A895
AB15: 86 95       LDA    #$17
AB17: E6 02       LDB    $A,Y
AB19: 26 89       BNE    $AB1C
AB1B: 4C          INCA
AB1C: A7 01       STA    $9,Y
AB1E: 7E 21 B0    JMP    $A992
AB21: E6 AB       LDB    $9,Y
AB23: 26 35       BNE    $AB3C
AB25: E6 2A A2    LDB    $20,Y
AB28: 26 20       BNE    $AB32
AB2A: 6C 20 08    INC    $20,Y
AB2D: 6C 20 9A    INC    $12,Y
AB30: 8D 12       BSR    $AB62
AB32: A7 AB       STA    $9,Y
AB34: BD 8F C9    JSR    $AD4B
AB37: BD BB 13    JSR    $933B
AB3A: 20 8A       BRA    $AB3E
AB3C: A7 01       STA    $9,Y
AB3E: A6 A3       LDA    $B,Y
AB40: B7 32 72    STA    $10F0
AB43: 8E CE 19    LDX    #table_ec3b
AB46: E6 2A 08    LDB    $20,Y
AB49: 10 27 76 6D LBEQ   $A992
AB4D: 58          ASLB
AB4E: A6 AC       LDA    $4,Y
AB50: AD B7       JSR    [B,X]        ; [jump_table]
AB52: BD 2A 90    JSR    $A8B2
AB55: 7E 2B 10    JMP    $A992
AB58: 81 F8       CMPA   #$D0
AB5A: 24 B0       BCC    $AB94
AB5C: A6 0E       LDA    $6,Y
AB5E: 81 68       CMPA   #$E0
AB60: 24 10       BCC    $AB94
AB62: CC 82 22    LDD    #$0000
AB65: BD 28 F0    JSR    $AA72
AB68: 86 22       LDA    #$0A
AB6A: A7 A1       STA    $9,Y
AB6C: 39          RTS
AB6D: B6 99 4E    LDA    $11C6
AB70: A1 04       CMPA   $6,Y
AB72: 25 A2       BCS    $AB94
AB74: 8D CE       BSR    $AB62
AB76: 6A AB       DEC    $9,Y
AB78: 39          RTS
AB79: A6 AE       LDA    $6,Y
AB7B: 81 C8       CMPA   #$E0
AB7D: 24 9D       BCC    $AB94
AB7F: BD 88 4D    JSR    $AA6F
AB82: 20 66       BRA    $AB68
AB84: B1 33 46    CMPA   $11C4
AB87: 25 23       BCS    $AB94
AB89: BD 22 E7    JSR    $AA6F
AB8C: 86 20       LDA    #$08
AB8E: A7 A1       STA    $9,Y
AB90: 39          RTS
AB91: 6F 2A A2    CLR    $20,Y
AB94: 6C 8A A2    INC    $20,Y
AB97: 39          RTS
AB98: 81 6C       CMPA   #$44
AB9A: 25 70       BCS    $AB94
AB9C: A6 0E       LDA    $6,Y
AB9E: 81 E8       CMPA   #$60
ABA0: 25 D0       BCS    $AB94
ABA2: CC 83 23    LDD    #$0101
ABA5: BD 28 F0    JSR    $AA72
ABA8: 86 24       LDA    #$0C
ABAA: A7 A1       STA    $9,Y
ABAC: 39          RTS
ABAD: B6 99 4E    LDA    $11C6
ABB0: A1 04       CMPA   $6,Y
ABB2: 24 62       BCC    $AB94
ABB4: 8D CE       BSR    $ABA2
ABB6: 6A AB       DEC    $9,Y
ABB8: 39          RTS
ABB9: A6 AE       LDA    $6,Y
ABBB: 81 7E       CMPA   #$56
ABBD: 25 5D       BCS    $AB94
ABBF: CC 23 22    LDD    #$0100
ABC2: BD 28 50    JSR    $AA72
ABC5: 86 8E       LDA    #$0C
ABC7: A7 01       STA    $9,Y
ABC9: 39          RTS
ABCA: B1 99 EC    CMPA   $11C4
ABCD: 24 4A       BCC    $AB91
ABCF: CC 22 22    LDD    #$0000
ABD2: BD 28 50    JSR    $AA72
ABD5: 86 8A       LDA    #$08
ABD7: A7 01       STA    $9,Y
ABD9: 39          RTS
ABDA: C6 AA       LDB    #$22
ABDC: A6 0E       LDA    $6,Y
ABDE: B1 99 E4    CMPA   $11C6
ABE1: 24 80       BCC    $ABE5
ABE3: C6 01       LDB    #$23
ABE5: A6 AB       LDA    $9,Y
ABE7: 26 22       BNE    $ABF3
ABE9: E7 A1       STB    $9,Y
ABEB: BD 85 63    JSR    $AD4B
ABEE: BD 1B 19    JSR    $933B
ABF1: 20 80       BRA    $ABF5
ABF3: E7 0B       STB    $9,Y
ABF5: BD 2A 27    JSR    $A8A5
ABF8: 7E 81 1A    JMP    $A992
ABFB: E6 01       LDB    $9,Y
ABFD: 26 86       BNE    $AC0D
ABFF: A7 0B       STA    $9,Y
AC01: 81 A2       CMPA   #$20
AC03: 24 28       BCC    $AC0F
AC05: BD 2F C9    JSR    $AD4B
AC08: BD BB B3    JSR    $933B
AC0B: 20 2A       BRA    $AC0F
AC0D: A7 A1       STA    $9,Y
AC0F: E6 09       LDB    $B,Y
AC11: F7 92 72    STB    $10F0
AC14: A6 06       LDA    $4,Y
AC16: E6 2A 08    LDB    $20,Y
AC19: 58          ASLB
AC1A: 8E 64 75    LDX    #table_ec5d
AC1D: AD 1D       JSR    [B,X]        ; [jump_table]
AC1F: E6 0A       LDB    $8,Y
AC21: BD 2A 30    JSR    $A8B2
AC24: 10 8C 90 C2 CMPY   #$1240
AC28: 10 27 75 EE LBEQ   $A992
AC2C: 86 2C       LDA    #$04
AC2E: 30 2C       LEAX   ,Y
AC30: E6 2D       LDB    $F,X
AC32: C4 8D       ANDB   #$0F
AC34: C1 20       CMPB   #$02
AC36: 26 84       BNE    $AC3E
AC38: E6 27       LDB    $F,X
AC3A: CA 8E       ORB    #$06
AC3C: E7 27       STB    $F,X
AC3E: 30 00 32    LEAX   $10,X
AC41: 4A          DECA
AC42: 26 6E       BNE    $AC30
AC44: 7E 8B 10    JMP    $A992
AC47: A6 0E       LDA    $6,Y
AC49: 81 F8       CMPA   #$70
AC4B: 10 25 28 48 LBCS   $AD0F
AC4F: CC 23 23    LDD    #$0101
AC52: BD 28 50    JSR    $AA72
AC55: 86 8E       LDA    #$0C
AC57: A7 01       STA    $9,Y
AC59: 39          RTS
AC5A: 81 F0       CMPA   #$78
AC5C: 10 25 88 27 LBCS   $AD0F
AC60: CC 23 83    LDD    #$0101
AC63: BD 88 50    JSR    $AA72
AC66: 86 8A       LDA    #$08
AC68: A7 01       STA    $9,Y
AC6A: 39          RTS
AC6B: A6 0E       LDA    $6,Y
AC6D: 81 08       CMPA   #$80
AC6F: 10 24 22 1E LBCC   $AD0F
AC73: BD 88 4D    JSR    $AA6F
AC76: 86 88       LDA    #$0A
AC78: A7 01       STA    $9,Y
AC7A: 39          RTS
AC7B: A6 0E       LDA    $6,Y
AC7D: 81 28       CMPA   #$A0
AC7F: 10 24 22 0E LBCC   $AD0F
AC83: BD 88 4D    JSR    $AA6F
AC86: 86 8B       LDA    #$09
AC88: A7 01       STA    $9,Y
AC8A: 39          RTS
AC8B: A6 0E       LDA    $6,Y
AC8D: 81 48       CMPA   #$C0
AC8F: 24 5C       BCC    $AD0F
AC91: CC 82 82    LDD    #$0000
AC94: BD 88 F0    JSR    $AA72
AC97: 86 22       LDA    #$0A
AC99: A7 A1       STA    $9,Y
AC9B: 39          RTS
AC9C: 81 A8       CMPA   #$80
AC9E: 24 E7       BCC    $AD0F
ACA0: CC 22 82    LDD    #$0000
ACA3: BD 88 50    JSR    $AA72
ACA6: 86 8A       LDA    #$08
ACA8: A7 01       STA    $9,Y
ACAA: 39          RTS
ACAB: A6 0E       LDA    $6,Y
ACAD: 81 28       CMPA   #$A0
ACAF: 25 7C       BCS    $AD0F
ACB1: CC 83 82    LDD    #$0100
ACB4: BD 88 F0    JSR    $AA72
ACB7: 86 24       LDA    #$0C
ACB9: A7 A1       STA    $9,Y
ACBB: 39          RTS
ACBC: A6 0E       LDA    $6,Y
ACBE: 81 08       CMPA   #$80
ACC0: 25 68       BCS    $AD0C
ACC2: CC 83 23    LDD    #$0101
ACC5: BD 28 F0    JSR    $AA72
ACC8: 86 23       LDA    #$0B
ACCA: A7 A1       STA    $9,Y
ACCC: 39          RTS
ACCD: 10 8C 9A 62 CMPY   #$1240
ACD1: 26 7B       BNE    $ACCC
ACD3: B6 32 DF    LDA    $10FD
ACD6: 27 76       BEQ    $ACCC
ACD8: 86 21       LDA    #$09
ACDA: A7 20 08    STA    $20,Y
ACDD: 20 81       BRA    $ACE8
ACDF: 86 07       LDA    #$25
ACE1: A7 AB       STA    $9,Y
ACE3: B6 32 DF    LDA    $10FD
ACE6: 27 67       BEQ    $ACCD
ACE8: BD 8F 14    JSR    $A79C
ACEB: 6C 80 08    INC    $20,Y
ACEE: BD 1B 69    JSR    $934B
ACF1: 7C 92 7F    INC    $10FD
ACF4: B6 32 7F    LDA    $10FD
ACF7: 81 1C       CMPA   #$34
ACF9: 24 8D       BCC    $AD00
ACFB: 86 0F       LDA    #$27
ACFD: A7 A1       STA    $9,Y
ACFF: 39          RTS
AD00: 7C 32 7C    INC    $10FE
AD03: BD A3 32    JSR    $8110
AD06: 39          RTS
AD07: 86 01       LDA    #$29
AD09: A7 A1       STA    $9,Y
AD0B: 39          RTS
AD0C: 6F 80 A8    CLR    $20,Y
AD0F: 6C 8A 02    INC    $20,Y
AD12: 39          RTS
AD13: F6 32 D4    LDB    $10F6
AD16: 7C 92 DE    INC    $10F6
AD19: C4 89       ANDB   #$01
AD1B: 27 2D       BEQ    $AD22
AD1D: C6 12       LDB    #$9A
AD1F: 7E 8F FF    JMP    $ADDD
AD22: C6 D6       LDB    #$54
AD24: 7E 8F 5F    JMP    $ADDD
AD27: F6 38 DE    LDB    $10F6
AD2A: 86 DA       LDA    #$52
AD2C: C4 29       ANDB   #$01
AD2E: 10 27 22 BB LBEQ   $ADCB
AD32: 86 FA       LDA    #$78
AD34: 7E 8F 49    JMP    $ADCB
AD37: C4 2D       ANDB   #$05
AD39: 26 83       BNE    $AD46
AD3B: 39          RTS
AD3C: C4 2B       ANDB   #$03
AD3E: 26 8E       BNE    $AD46
AD40: 39          RTS
AD41: C4 81       ANDB   #$03
AD43: 27 23       BEQ    $AD46
AD45: 39          RTS
AD46: 35 D2       PULS   X,U
AD48: 7E 81 1A    JMP    $A992
AD4B: B6 38 D4    LDA    $10FC
AD4E: D6 13       LDB    $9B
AD50: C1 27       CMPB   #$05
AD52: 27 8E       BEQ    $AD60
AD54: F6 32 74    LDB    $10F6
AD57: 7C 38 DE    INC    $10F6
AD5A: 8E 64 5D    LDX    #table_ec75
AD5D: 48          ASLA
AD5E: AD 1E       JSR    [A,X]        ; [jump_table]
AD60: 34 02       PSHS   Y
AD62: 10 8E 31 E2 LDY    #$13C0
AD66: 5F          CLRB
AD67: F7 38 D9    STB    $10F1
AD6A: F7 98 DB    STB    $10F3
AD6D: BD 28 5C    JSR    $A0D4
AD70: 35 02       PULS   Y
AD72: 8C 96 72    CMPX   #$1450
AD75: 25 87       BCS    $AD7C
AD77: 35 38       PULS   X
AD79: 7E 21 1A    JMP    $A992
AD7C: CE C3 4C    LDU    #$EBC4
AD7F: A6 86       LDA    ,Y
AD81: A6 44       LDA    A,U
AD83: 81 21       CMPA   #$03
AD85: 26 94       BNE    $AD9D
AD87: E6 0E       LDB    $6,Y
AD89: C0 90       SUBB   #$18
AD8B: F7 3A 50    STB    $1278
AD8E: A6 AC       LDA    $4,Y
AD90: E6 09       LDB    $B,Y
AD92: 26 80       BNE    $AD96
AD94: 8B 32       ADDA   #$10
AD96: 8B 92       ADDA   #$10
AD98: B7 3A FF    STA    $1277
AD9B: 20 2F       BRA    $ADA4
AD9D: A6 AC       LDA    $4,Y
AD9F: E6 04       LDB    $6,Y
ADA1: FD 90 F5    STD    $1277
ADA4: A6 03       LDA    $1,Y
ADA6: B7 92 DA    STA    $10F2
ADA9: 8C 9C D8    CMPX   #$1450
ADAC: 10 24 74 47 LBCC   $AA7F
ADB0: 4F          CLRA
ADB1: A7 06       STA    ,X
ADB3: A7 2A       STA    $8,X
ADB5: A7 88       STA    $A,X
ADB7: B6 39 EC    LDA    $11C4
ADBA: D6 13       LDB    $9B
ADBC: C1 2D       CMPB   #$05
ADBE: 34 89       PSHS   CC
ADC0: 10 27 7D E1 LBEQ   $AD27
ADC4: F6 30 F2    LDB    $1270
ADC7: 26 2A       BNE    $ADCB
ADC9: 8B B0       ADDA   #$38
ADCB: B0 3A 5F    SUBA   $1277
ADCE: 24 8C       BCC    $ADD4
ADD0: 40          NEGA
ADD1: 7C 92 73    INC    $10F1
ADD4: F6 33 44    LDB    $11C6
ADD7: 35 29       PULS   CC
ADD9: 10 27 77 1E LBEQ   $AD13
ADDD: F0 9A F0    SUBB   $1278
ADE0: 24 26       BCC    $ADE6
ADE2: 50          NEGB
ADE3: 7C 32 D1    INC    $10F3
ADE6: C1 92       CMPB   #$10
ADE8: 25 2C       BCS    $ADEE
ADEA: 44          LSRA
ADEB: 54          LSRB
ADEC: 20 D0       BRA    $ADE6
ADEE: 81 98       CMPA   #$10
ADF0: 25 26       BCS    $ADF6
ADF2: 44          LSRA
ADF3: 54          LSRB
ADF4: 20 DA       BRA    $ADEE
ADF6: CE 75 8E    LDU    #$F7A6
ADF9: 58          ASLB
ADFA: EE 4D       LDU    B,U
ADFC: A6 EE       LDA    A,U
ADFE: CE 70 E4    LDU    #$F8C6
AE01: E6 44       LDB    A,U
AE03: CE DB 27    LDU    #$F905
AE06: 40          NEGA
AE07: A6 EE       LDA    A,U
AE09: 1E 01       EXG    A,B
AE0B: B7 38 D8    STA    $10F0
AE0E: 86 8A       LDA    #$02
AE10: 3D          MUL
AE11: 7D 92 73    TST    $10F1
AE14: 27 27       BEQ    $AE1B
AE16: 43          COMA
AE17: 53          COMB
AE18: C3 28 89    ADDD   #$0001
AE1B: ED 2A       STD    $2,X
AE1D: 86 8A       LDA    #$02
AE1F: F6 32 D2    LDB    $10F0
AE22: 3D          MUL
AE23: 7D 32 D1    TST    $10F3
AE26: 27 87       BEQ    $AE2D
AE28: 43          COMA
AE29: 53          COMB
AE2A: C3 88 29    ADDD   #$0001
AE2D: ED 84       STD    $C,X
AE2F: CC 1D 22    LDD    #$3F00
AE32: ED 8C       STD    $E,X
AE34: A6 03       LDA    $1,Y
AE36: 81 86       CMPA   #$04
AE38: 10 26 88 F4 LBNE   $AEB8
AE3C: AF 80 AA    STX    $22,Y
AE3F: 4F          CLRA
AE40: A7 0E       STA    $C,Y
AE42: A7 A1       STA    $3,Y
AE44: A7 00       STA    $2,Y
AE46: E6 AA       LDB    $8,Y
AE48: E7 80 AD    STB    game_state_25,Y
AE4B: E6 24       LDB    $C,X
AE4D: 27 85       BEQ    $AE5C
AE4F: 4C          INCA
AE50: F6 32 71    LDB    $10F3
AE53: 27 23       BEQ    $AE56
AE55: 4C          INCA
AE56: E6 80       LDB    $2,X
AE58: 27 2A       BEQ    $AE5C
AE5A: 8B 8A       ADDA   #$02
AE5C: 4C          INCA
AE5D: A7 20 A9    STA    $21,Y
AE60: 5F          CLRB
AE61: B6 92 73    LDA    $10F1
AE64: 27 23       BEQ    $AE67
AE66: 5C          INCB
AE67: A6 03       LDA    $B,Y
AE69: B7 98 78    STA    $10F0
AE6C: 34 38       PSHS   X
AE6E: BD 20 90    JSR    $A8B2
AE71: 35 92       PULS   X
AE73: A6 8A 03    LDA    $21,Y
AE76: 4A          DECA
AE77: CE C3 EC    LDU    #$EBC4
AE7A: E6 2C       LDB    ,Y
AE7C: E6 ED       LDB    B,U
AE7E: C1 8B       CMPB   #$03
AE80: 27 06       BEQ    $AEA6
AE82: CE 6E 6F    LDU    #$EC4D
AE85: 58          ASLB
AE86: EE 47       LDU    B,U
AE88: 48          ASLA
AE89: EC 4E       LDD    A,U
AE8B: EB 0E       ADDB   $6,Y
AE8D: E7 8E       STB    $6,X
AE8F: AB 06       ADDA   $4,Y
AE91: E6 A9       LDB    $B,Y
AE93: 26 2F       BNE    $AEA2
AE95: E6 2A A3    LDB    $21,Y
AE98: 5A          DECB
AE99: 5A          DECB
AE9A: C1 8A       CMPB   #$02
AE9C: 25 2A       BCS    $AEA0
AE9E: 8B 98       ADDA   #$10
AEA0: 8B 32       ADDA   #$10
AEA2: A7 86       STA    $4,X
AEA4: 20 33       BRA    $AEB7
AEA6: A6 A6       LDA    $4,Y
AEA8: A7 2C       STA    $4,X
AEAA: A6 AE       LDA    $6,Y
AEAC: 80 38       SUBA   #$10
AEAE: B1 99 E4    CMPA   $11C6
AEB1: 25 80       BCS    $AEB5
AEB3: 80 32       SUBA   #$10
AEB5: A7 84       STA    $6,X
AEB7: 39          RTS
AEB8: CC 28 C8    LDD    #$0040
AEBB: ED 26       STD    $E,X
AEBD: 20 6F       BRA    $AEA6
AEBF: 86 2A       LDA    #$08
AEC1: B7 92 72    STA    $10F0
AEC4: EC E3       LDD    ,U++
AEC6: ED 06       STD    ,X
AEC8: EC E9       LDD    ,U++
AECA: A7 8C       STA    $4,X
AECC: E7 2E       STB    $6,X
AECE: EC 49       LDD    ,U++
AED0: ED 2A       STD    $8,X
AED2: A7 89       STA    $B,X
AED4: 6C AA 90    INC    $12,X
AED7: 30 A0 68    LEAX   $40,X
AEDA: 7A 98 D8    DEC    $10F0
AEDD: 26 6D       BNE    $AEC4
AEDF: 39          RTS
AEE0: 10 8E 93 42 LDY    #$11C0
AEE4: 96 7D       LDA    timer_fraction_of_second_5f
AEE6: 81 7D       CMPA   #$FF
AEE8: 27 23       BEQ    $AEF5
AEEA: 81 25       CMPA   #$AD
AEEC: 27 39       BEQ    $AEFF
AEEE: 81 3B       CMPA   #$B3
AEF0: 27 02       BEQ    $AF12
AEF2: 7E 20 A4    JMP    $A286
AEF5: CE 7B 9B    LDU    #$F919
AEF8: 30 8C       LEAX   ,Y
AEFA: 8D 4B       BSR    $AEBF
AEFC: 7E 8A 0E    JMP    $A286
AEFF: 7C 33 F5    INC    $11D7
AF02: CE 91 E2    LDU    #$13C0
AF05: 86 92       LDA    #$10
AF07: 6F E8       CLR    ,U+
AF09: 4A          DECA
AF0A: 26 73       BNE    $AF07
AF0C: BD BB 96    JSR    $931E
AF0F: 7E 80 A4    JMP    $A286
AF12: 7C 90 35    INC    $1217
AF15: CE 91 52    LDU    #$13D0
AF18: 20 C3       BRA    $AF05
AF1A: 10 8E 39 E8 LDY    #$11C0
AF1E: 96 D7       LDA    timer_fraction_of_second_5f
AF20: 81 DC       CMPA   #$FE
AF22: 27 90       BEQ    $AF36
AF24: C6 37       LDB    #$15
AF26: 8E 7B 2E    LDX    #$F906
AF29: A1 08       CMPA   ,X+
AF2B: 10 27 DB D9 LBEQ   $A280
AF2F: 10 24 D1 D1 LBCC   $A286
AF33: 20 D6       BRA    $AF29
AF35: 39          RTS
AF36: 86 80       LDA    #$02
AF38: CE D1 85    LDU    #$F90D
AF3B: 30 8C       LEAX   ,Y
AF3D: BD 26 49    JSR    $AEC1
AF40: 7F 30 90    CLR    $1212
AF43: 7F 32 DA    CLR    $10F8
AF46: 7F 92 D1    CLR    $10F9
AF49: 7F 98 72    CLR    $10FA
AF4C: 0F 8F       CLR    $A7
AF4E: 96 13       LDA    $9B
AF50: 81 26       CMPA   #$04
AF52: 27 84       BEQ    $AF5A
AF54: BD B1 FF    JSR    $937D
AF57: 7E 8A AE    JMP    $A286
AF5A: BD 1B BA    JSR    $9392
AF5D: 7E 2A 0E    JMP    $A286
AF60: D6 66       LDB    $44
AF62: 27 AE       BEQ    $AF90
AF64: D6 B9       LDB    $9B
AF66: C1 87       CMPB   #$05
AF68: 27 0C       BEQ    $AF8E
AF6A: 96 1F       LDA    stage_number_97
AF6C: 81 2E       CMPA   #$06
AF6E: 24 96       BCC    $AF8E
AF70: F7 32 7E    STB    $10FC
AF73: 96 73       LDA    $51
AF75: 84 B2       ANDA   #$30
AF77: 44          LSRA
AF78: 44          LSRA
AF79: 44          LSRA
AF7A: 44          LSRA
AF7B: BB 38 D4    ADDA   $10FC
AF7E: B7 98 DE    STA    $10FC
AF81: D6 29       LDB    $AB
AF83: 54          LSRB
AF84: 54          LSRB
AF85: 54          LSRB
AF86: 54          LSRB
AF87: FB 38 D4    ADDB   $10FC
AF8A: C1 8C       CMPB   #$04
AF8C: 25 2A       BCS    $AF90
AF8E: C6 8B       LDB    #$03
AF90: F7 32 7E    STB    $10FC
AF93: 39          RTS
AF94: 86 C5       LDA    #$E7

play_sound_af96:
AF96: 12          NOP
AF97: 12          NOP
AF98: 12          NOP
AF99: 12          NOP
AF9A: 12          NOP
AF9B: B7 19 28    STA    dsw2_3100
AF9E: B7 BA 22    STA    dsw3_3200
AFA1: 39          RTS

continue_boot_afa2:
AFA2: C6 86       LDB    #$04
AFA4: 86 BD       LDA    #$9F
AFA6: BD 2D BE    JSR    play_sound_af96
AFA9: 8B A8       ADDA   #$20
AFAB: 5A          DECB
AFAC: 26 D0       BNE    $AFA6
AFAE: 7E 09 8F    JMP    resume_boot_81ad

AFB1: C6 86       LDB    #$04
AFB3: 86 BD       LDA    #$9F
AFB5: BD 2D 14    JSR    play_sound_af96
AFB8: 8B 08       ADDA   #$20
AFBA: 5A          DECB
AFBB: 26 D0       BNE    $AFB5
AFBD: CC 27 5E    LDD    #$AFD6
AFC0: FD 34 42    STD    $16C0
AFC3: FD 34 E0    STD    $16C2
AFC6: FD 94 EC    STD    $16C4
AFC9: CC 88 88    LDD    #$0000
AFCC: FD 3E 4E    STD    $16C6
AFCF: FD 34 EA    STD    $16C8
AFD2: 39          RTS
AFD3: B7 35 23    STA    $1701
AFD6: 39          RTS
AFD7: 84 17       ANDA   #$3F
AFD9: 81 8F       CMPA   #$07
AFDB: 24 D1       BCC    $AFD6
AFDD: B7 9E 75    STA    $16FD
AFE0: 10 8E 94 42 LDY    #$16C0
AFE4: CC 91 BF    LDD    #$B33D
AFE7: ED 89       STD    ,Y++
AFE9: CC 3B CC    LDD    #$B344
AFEC: ED 89       STD    ,Y++
AFEE: CC 3B 6A    LDD    #$B348
AFF1: ED 26       STD    ,Y
AFF3: CC 33 33    LDD    #$1111
AFF6: FD 94 EE    STD    $16C6
AFF9: 7F 9E 41    CLR    $16C9
AFFC: 86 D7       LDA    #$FF
AFFE: 7E 27 B4    JMP    play_sound_af96
B001: B6 94 49    LDA    $16CB
B004: 27 1B       BEQ    $B03F
B006: 7F 94 E3    CLR    $16CB
B009: B6 9E 42    LDA    $16CA
B00C: 27 8B       BEQ    $AFB1
B00E: B7 9F 24    STA    $1706
B011: 81 7C       CMPA   #$FE
B013: 27 9C       BEQ    $AFD3
B015: 85 C2       BITA   #$40
B017: 26 96       BNE    $AFD7
B019: F6 9E 41    LDB    $16C9
B01C: 26 09       BNE    $B03F
B01E: 85 08       BITA   #$80
B020: 10 26 82 39 LBNE   $B0DF
B024: 85 02       BITA   #$20
B026: 26 9A       BNE    $B040
B028: 81 3C       CMPA   #$14
B02A: 24 9B       BCC    $B03F
B02C: B1 3E 4E    CMPA   $16C6
B02F: 25 2C       BCS    $B03F
B031: B7 94 44    STA    $16C6
B034: 4A          DECA
B035: 48          ASLA
B036: 10 8E D6 C7 LDY    #$FEEF
B03A: EC 2E       LDD    A,Y
B03C: FD 3E 4A    STD    $16C2
B03F: 39          RTS
B040: 84 3D       ANDA   #$1F
B042: 81 84       CMPA   #$06
B044: 24 DB       BCC    $B03F
B046: B1 94 EF    CMPA   $16C7
B049: 25 7C       BCS    $B03F
B04B: B7 3E EF    STA    $16C7
B04E: 48          ASLA
B04F: 10 8E DD 97 LDY    #$FF15
B053: EC 84       LDD    A,Y
B055: FD 94 46    STD    $16C4
B058: 86 D7       LDA    #$FF
B05A: 7E 27 BE    JMP    play_sound_af96

; speech handling
irq_b05d:
B05D: 86 76       LDA    #$FE
B05F: B4 37 03    ANDA   $1521
B062: B7 97 03    STA    $1521
B065: B7 A2 C6    STA    ctrl_2044		; ack interrupt
B068: B6 3F 85    LDA    $170D
B06B: 27 39       BEQ    $B07E
B06D: B6 E8 88    LDA    speech_6000
B070: 85 23       BITA   #$01
B072: 26 88       BNE    $B07E
B074: 7F 35 8F    CLR    $170D
B077: B6 3E E0    LDA    $16C8
B07A: 81 0E       CMPA   #$86
B07C: 27 12       BEQ    $B0B8
B07E: 8D 09       BSR    $B001
B080: 4F          CLRA
B081: FE 94 42    LDU    $16C0
B084: 10 8E 95 8D LDY    #$170F
B088: BD 98 4E    JSR    store_and_jump_b0c6
B08B: FF 3E E8    STU    $16C0
B08E: 86 A8       LDA    #$20
B090: FE 34 40    LDU    $16C2
B093: 10 8E 35 95 LDY    #$1717
B097: BD 98 EE    JSR    store_and_jump_b0c6
B09A: FF 9E EA    STU    $16C2
B09D: 86 C8       LDA    #$40
B09F: FE 34 E6    LDU    $16C4
B0A2: 10 8E 35 3D LDY    #$171F
B0A6: BD 32 EE    JSR    store_and_jump_b0c6
B0A9: FF 9E 4C    STU    $16C4
B0AC: 86 29       LDA    #$01
B0AE: BA 9D 03    ORA    $1521
B0B1: B7 97 A3    STA    $1521
B0B4: B7 02 C6    STA    ctrl_2044
B0B7: 3B          RTI

B0B8: 8E 98 F6    LDX    #$B07E
B0BB: 34 38       PSHS   X
B0BD: 7A 9F 86    DEC    $170E
B0C0: 26 67       BNE    $B107
B0C2: 7F 94 EA    CLR    $16C8
B0C5: 39          RTS

; dynamic jump to whatever is in [U]
; at start, all 3 function pointers are set to AFD6
; which does nothing

store_and_jump_b0c6:
B0C6: B7 95 24    STA    $170C
B0C9: 6E 4C       JMP    ,U			; [indirect_jump]

B0CB: CE 87 FE    LDU    #$AFD6
B0CE: B6 9F 2E    LDA    $170C
B0D1: 8B 1D       ADDA   #$9F
B0D3: BD 8D B4    JSR    play_sound_af96
B0D6: 81 5D       CMPA   #$DF
B0D8: 26 62       BNE    $B124
B0DA: 86 77       LDA    #$FF
B0DC: 7E 87 1E    JMP    play_sound_af96
B0DF: F6 35 24    LDB    $1706
B0E2: C1 1B       CMPB   #$99
B0E4: 24 1C       BCC    $B124
B0E6: B6 95 25    LDA    $170D
B0E9: 27 8D       BEQ    $B0F0
B0EB: F1 3E E0    CMPB   $16C8
B0EE: 25 BC       BCS    $B124
B0F0: F7 34 4A    STB    $16C8
B0F3: 1F BA       TFR    B,A
B0F5: 80 02       SUBA   #$80
B0F7: 48          ASLA
B0F8: 10 8E 71 DD LDY    #table_f955
B0FC: 6E 9E       JMP    [A,Y]        ; [jump_table]
B0FE: BD 39 69    JSR    $B14B
B101: C4 FD       ANDB   #$7F
B103: 58          ASLB
B104: F7 72 82    STB    $5000
B107: 86 29       LDA    #$01
B109: B7 C8 88    STA    speech_4000
B10C: 86 2B       LDA    #$03
B10E: B7 C8 22    STA    speech_4000
B111: 86 83       LDA    #$01
B113: B4 42 22    ANDA   speech_6000
B116: 27 7B       BEQ    $B111
B118: B7 3F 85    STA    $170D
B11B: 86 29       LDA    #$01
B11D: B7 C8 88    STA    speech_4000
B120: 4F          CLRA
B121: B7 C2 82    STA    speech_4000
B124: 39          RTS
B125: 7C 95 86    INC    $1704
B128: B6 3F 8C    LDA    $1704
B12B: 84 2F       ANDA   #$07
B12D: 10 8E 71 A5 LDY    #$F987
B131: E6 24       LDB    A,Y
B133: 20 EB       BRA    $B0FE
B135: F7 94 4B    STB    $16C9
B138: 8D 39       BSR    $B14B
B13A: C6 8C       LDB    #$04
B13C: F7 78 88    STB    $5000
B13F: 20 E4       BRA    $B107
B141: 86 80       LDA    #$02
B143: B7 35 2C    STA    $170E
B146: 20 34       BRA    $B0FE
B148: BD 87 35    JSR    $AFBD
B14B: 86 2C       LDA    #$04
B14D: B7 C8 88    STA    speech_4000
B150: 86 23       LDA    #$01
B152: B4 E2 22    ANDA   speech_6000
B155: 26 7B       BNE    $B150
B157: 1F B0       TFR    B,A
B159: 84 F7       ANDA   #$7F
B15B: 8E D1 A7    LDX    #$F98F
B15E: A6 0E       LDA    A,X
B160: B7 72 82    STA    $5000
B163: 86 27       LDA    #$05
B165: B7 C2 82    STA    speech_4000
B168: 86 29       LDA    #$01
B16A: B7 C8 28    STA    speech_4000
B16D: 4F          CLRA
B16E: B7 C8 22    STA    speech_4000
B171: 39          RTS
B172: BD 33 B3    JSR    $B191
B175: FC 95 85    LDD    $1707
B178: 58          ASLB
B179: 49          ROLA
B17A: FD 9F 2F    STD    $1707
B17D: 86 08       LDA    #$80
B17F: 20 3A       BRA    $B199
B181: BD 33 13    JSR    $B191
B184: FC 35 88    LDD    $170A
B187: F3 3F 2F    ADDD   $1707
B18A: FD 9F 2F    STD    $1707
B18D: 86 08       LDA    #$80
B18F: 20 2A       BRA    $B199
B191: FD 95 85    STD    $1707
B194: B6 35 8E    LDA    $170C
B197: 8B A8       ADDA   #$80
B199: C4 87       ANDB   #$0F
B19B: F7 3F 2E    STB    $1706
B19E: BB 9F 24    ADDA   $1706
B1A1: BD 2D 14    JSR    play_sound_af96
B1A4: FC 35 85    LDD    $1707
B1A7: 84 2B       ANDA   #$03
B1A9: 58          ASLB
B1AA: 49          ROLA
B1AB: 58          ASLB
B1AC: 49          ROLA
B1AD: 58          ASLB
B1AE: 49          ROLA
B1AF: 58          ASLB
B1B0: 49          ROLA
B1B1: 7E 2D 14    JMP    play_sound_af96
B1B4: BD 93 3D    JSR    $B1BF
B1B7: 86 B8       LDA    #$90
B1B9: BB 9F 8E    ADDA   $1706
B1BC: 7E 87 1E    JMP    play_sound_af96
B1BF: B6 35 2E    LDA    $170C
B1C2: 8B 12       ADDA   #$90
B1C4: 53          COMB
B1C5: C4 8D       ANDB   #$0F
B1C7: F7 3F 2E    STB    $1706
B1CA: BB 9F 2E    ADDA   $1706
B1CD: 7E 27 1E    JMP    play_sound_af96
B1D0: 86 FD       LDA    #$DF
B1D2: BD 2D B4    JSR    play_sound_af96
B1D5: 86 72       LDA    #$F0
B1D7: 20 C3       BRA    $B1C4
B1D9: BE 9F 8A    LDX    $1702
B1DC: E6 AC       LDB    ,X
B1DE: 7C 9F 21    INC    $1703
B1E1: 39          RTS
B1E2: 6A 83       DEC    $1,X
B1E4: 26 02       BNE    $B206
B1E6: B6 94 D7    LDA    $16FF
B1E9: A7 89       STA    $1,X
B1EB: 6A AC       DEC    ,X
B1ED: 27 90       BEQ    $B207
B1EF: B6 35 23    LDA    $1701
B1F2: 27 8E       BEQ    $B200
B1F4: 6A 2F       DEC    $D,X
B1F6: 26 8A       BNE    $B200
B1F8: 86 68       LDA    #$40
B1FA: A7 85       STA    $D,X
B1FC: 6A 2E       DEC    $6,X
B1FE: 27 C4       BEQ    $B24C
B200: E6 25       LDB    $7,X
B202: E0 8A       SUBB   $8,X
B204: 2A 19       BPL    $B241
B206: 39          RTS
B207: A6 B0 2A    LDA    [$02,X]
B20A: B7 9E D6    STA    $16FE
B20D: 81 98       CMPA   #$10
B20F: 10 25 22 24 LBCS   $B2B9
B213: 84 3D       ANDA   #$1F
B215: 27 DE       BEQ    $B273
B217: 81 37       CMPA   #$1F
B219: 10 27 88 4B LBEQ   $B280
B21D: CC 88 89    LDD    #$0001
B220: E3 20       ADDD   $2,X
B222: ED 80       STD    $2,X
B224: BD 90 68    JSR    $B2EA
B227: B6 3E D6    LDA    $16FE
B22A: 84 97       ANDA   #$1F
B22C: 4A          DECA
B22D: 48          ASLA
B22E: 10 AE 26    LDY    $4,X
B231: EC 24       LDD    A,Y
B233: FD 35 25    STD    $1707
B236: E6 8B       LDB    $9,X
B238: 4F          CLRA
B239: F3 9F 8F    ADDD   $1707
B23C: BD 99 19    JSR    $B191
B23F: E6 24       LDB    $6,X
B241: E7 85       STB    $7,X
B243: 7E 93 9D    JMP    $B1BF
B246: CC 32 E3    LDD    #$B0CB
B249: FD 9E 48    STD    $16C0
B24C: CE 98 43    LDU    #$B0CB
B24F: B6 35 2E    LDA    $170C
B252: 27 8E       BEQ    $B260
B254: 81 02       CMPA   #$20
B256: 27 86       BEQ    $B25C
B258: 7F 3E 4F    CLR    $16C7
B25B: 39          RTS
B25C: 7F 3E 4E    CLR    $16C6
B25F: 39          RTS
B260: B6 34 7F    LDA    $16FD
B263: 81 26       CMPA   #$04
B265: 27 83       BEQ    $B268
B267: 39          RTS
B268: F6 3D 13    LDB    $159B
B26B: CB A2       ADDB   #$8A
B26D: F7 9E 40    STB    $16C8
B270: 7E 92 7C    JMP    $B0FE
B273: BD 90 C8    JSR    $B2EA
B276: EC 80       LDD    $2,X
B278: C3 28 89    ADDD   #$0001
B27B: ED 2A       STD    $2,X
B27D: 5F          CLRB
B27E: 20 49       BRA    $B241
B280: EC 20       LDD    $2,X
B282: C3 82 23    ADDD   #$0001
B285: ED 80       STD    $2,X
B287: F6 3E D6    LDB    $16FE
B28A: C4 68       ANDB   #$E0
B28C: 54          LSRB
B28D: 54          LSRB
B28E: 54          LSRB
B28F: 54          LSRB
B290: 10 8E 7F A7 LDY    #table_fd25
B294: A6 BA 80    LDA    [$02,X]
B297: 6E 9D       JMP    [B,Y]        ; [jump_table]
B299: 48          ASLA
B29A: 10 8E D5 4D LDY    #$FD65
B29E: EC 2E       LDD    A,Y
B2A0: ED 26       STD    $4,X
B2A2: CC 82 23    LDD    #$0001
B2A5: E3 80       ADDD   $2,X
B2A7: ED 2A       STD    $2,X
B2A9: 7E 3A 8F    JMP    $B207

B2AC: A7 29       STA    $1,X
B2AE: B7 9E DD    STA    $16FF
B2B1: 20 6D       BRA    $B2A2
B2B3: A7 24       STA    $6,X
B2B5: A7 85       STA    $7,X
B2B7: 20 C1       BRA    $B2A2
B2B9: A7 80       STA    $8,X
B2BB: 20 CD       BRA    $B2A2
B2BD: A7 81       STA    $9,X
B2BF: 20 C3       BRA    $B2A2
B2C1: 81 7D       CMPA   #$FF
B2C3: 27 2A       BEQ    $B2CD
B2C5: E6 88       LDB    $A,X
B2C7: 27 3B       BEQ    $B2DC
B2C9: 6A 82       DEC    $A,X
B2CB: 27 3B       BEQ    $B2E0
B2CD: CC 88 89    LDD    #$0001
B2D0: E3 20       ADDD   $2,X
B2D2: ED 80       STD    $2,X
B2D4: EC BA 80    LDD    [$02,X]
B2D7: ED 2A       STD    $2,X
B2D9: 7E 3A 8F    JMP    $B207
B2DC: A7 22       STA    $A,X
B2DE: 20 65       BRA    $B2CD
B2E0: CC 22 81    LDD    #$0003
B2E3: E3 20       ADDD   $2,X
B2E5: ED 80       STD    $2,X
B2E7: 7E 9A 2F    JMP    $B207
B2EA: F6 9E D6    LDB    $16FE
B2ED: C4 68       ANDB   #$E0
B2EF: 54          LSRB
B2F0: 54          LSRB
B2F1: 54          LSRB
B2F2: 54          LSRB
B2F3: 54          LSRB
B2F4: 86 23       LDA    #$01
B2F6: 20 83       BRA    $B2F9
B2F8: 48          ASLA
B2F9: 5A          DECB
B2FA: 26 74       BNE    $B2F8
B2FC: A7 AC       STA    ,X
B2FE: 39          RTS
B2FF: 7F 35 23    CLR    $1701
B302: 10 8E DF 17 LDY    #$FD35
B306: 8E 94 E4    LDX    #$16CC
B309: C6 B8       LDB    #$30
B30B: A6 88       LDA    ,Y+
B30D: A7 08       STA    ,X+
B30F: 5A          DECB
B310: 26 DB       BNE    $B30B
B312: B6 94 DF    LDA    $16FD
B315: 48          ASLA
B316: B7 94 D6    STA    $16FE
B319: 48          ASLA
B31A: BB 9E D6    ADDA   $16FE
B31D: 10 8E 71 8A LDY    #$F9A8
B321: 8E 94 4C    LDX    #$16CE
B324: 31 84       LEAY   A,Y
B326: EC 23       LDD    ,Y++
B328: ED AC       STD    ,X
B32A: 8E 9E F6    LDX    #$16DE
B32D: EC 29       LDD    ,Y++
B32F: ED A6       STD    ,X
B331: 8E 94 6C    LDX    #$16EE
B334: EC 86       LDD    ,Y
B336: ED 06       STD    ,X
B338: C6 B0       LDB    #$98
B33A: 7E 38 D6    JMP    $B0FE
B33D: BD 3A 77    JSR    $B2FF
B340: CE 91 CE    LDU    #$B34C
B343: 39          RTS
B344: CE 91 D0    LDU    #$B352
B347: 39          RTS
B348: CE 9B D0    LDU    #$B358
B34B: 39          RTS
B34C: 8E 3E 44    LDX    #$16CC
B34F: 7E 93 C0    JMP    $B1E2
B352: 8E 94 FE    LDX    #$16DC
B355: 7E 33 60    JMP    $B1E2
B358: 8E 3E 64    LDX    #$16EC
B35B: 7E 99 CA    JMP    $B1E2
B35E: CE 3B 5E    LDU    #$B37C
B361: CC 31 1B    LDD    #$B399
B364: FD 34 46    STD    $16C4
B367: 86 D7       LDA    #$FF
B369: B7 9E 4F    STA    $16C7
B36C: CC 18 86    LDD    #$300E
B36F: ED 86       STD    ,Y
B371: BD 33 36    JSR    $B1B4
B374: CC 22 83    LDD    #$0001
B377: ED 0A       STD    $2,Y
B379: 7E 39 FA    JMP    $B172
B37C: CC 28 8E    LDD    #$0006
B37F: E3 00       ADDD   $2,Y
B381: ED A0       STD    $2,Y
B383: 6A 86       DEC    ,Y
B385: 27 81       BEQ    $B38A
B387: 7E 99 5A    JMP    $B172
B38A: 86 90       LDA    #$18
B38C: A7 8C       STA    ,Y
B38E: 6A A9       DEC    $1,Y
B390: 10 2B 7C 30 LBMI   $B246
B394: E6 03       LDB    $1,Y
B396: 7E 33 9C    JMP    $B1B4
B399: CE 3B 27    LDU    #$B3AF
B39C: BD 87 1C    JSR    $AF94
B39F: CC E2 2F    LDD    #$C00D
B3A2: ED 26       STD    ,Y
B3A4: BD 93 52    JSR    $B1D0
B3A7: CC 28 35    LDD    #$001D
B3AA: E7 AA       STB    $2,Y
B3AC: 7E 99 19    JMP    $B191
B3AF: 6A 86       DEC    ,Y
B3B1: 27 8C       BEQ    $B3C1
B3B3: A6 86       LDA    ,Y
B3B5: 85 85       BITA   #$07
B3B7: 26 3A       BNE    $B3CB
B3B9: 6A AA       DEC    $2,Y
B3BB: E6 0A       LDB    $2,Y
B3BD: 4F          CLRA
B3BE: 7E 39 B3    JMP    $B191
B3C1: CC B2 99    LDD    #$301B
B3C4: A7 86       STA    ,Y
B3C6: E7 A0       STB    $2,Y
B3C8: CE 9B 44    LDU    #$B3CC
B3CB: 39          RTS
B3CC: 6A 8C       DEC    ,Y
B3CE: 27 86       BEQ    $B3DE
B3D0: A6 86       LDA    ,Y
B3D2: 85 A3       BITA   #$21
B3D4: 26 D7       BNE    $B3CB
B3D6: 6A A0       DEC    $2,Y
B3D8: E6 0A       LDB    $2,Y
B3DA: 4F          CLRA
B3DB: 7E 99 B9    JMP    $B191
B3DE: CC B8 39    LDD    #$301B
B3E1: A7 26       STA    ,Y
B3E3: E7 00       STB    $2,Y
B3E5: 6A A3       DEC    $1,Y
B3E7: 27 21       BEQ    $B3F2
B3E9: E6 A9       LDB    $1,Y
B3EB: C1 24       CMPB   #$0C
B3ED: 27 92       BEQ    $B409
B3EF: 7E 93 F2    JMP    $B1D0
B3F2: B6 97 B9    LDA    $159B
B3F5: 81 87       CMPA   #$05
B3F7: 10 26 D6 D9 LBNE   $B24C
B3FB: CE 91 B1    LDU    #$B999
B3FE: CC 31 29    LDD    #$B90B
B401: FD 94 40    STD    $16C2
B404: 86 DD       LDA    #$FF
B406: 7E 2D BE    JMP    play_sound_af96
B409: B6 9D 13    LDA    $159B
B40C: 81 2D       CMPA   #$05
B40E: 10 26 DF 9C LBNE   $B1D0
B412: C6 11       LDB    #$93
B414: 7E 92 7C    JMP    $B0FE
B417: CE 9C 1A    LDU    #$B432
B41A: 86 8B       LDA    #$03
B41C: A7 8C       STA    ,Y
B41E: CC 88 A2    LDD    #$0080
B421: ED A6       STD    $4,Y
B423: BD 93 50    JSR    $B172
B426: CC E2 2C    LDD    #$6004
B429: ED A9       STD    $1,Y
B42B: C6 26       LDB    #$0E
B42D: E7 AB       STB    $3,Y
B42F: 7E 93 96    JMP    $B1B4
B432: 6A A3       DEC    $1,Y
B434: 27 0C       BEQ    $B464
B436: A6 A3       LDA    $1,Y
B438: 85 29       BITA   #$01
B43A: 27 90       BEQ    $B454
B43C: 85 20       BITA   #$08
B43E: 27 82       BEQ    $B44A
B440: CC DD 7E    LDD    #$FFFC
B443: E3 06       ADDD   $4,Y
B445: ED A6       STD    $4,Y
B447: 7E 99 5A    JMP    $B172
B44A: CC 88 20    LDD    #$0008
B44D: E3 AC       ADDD   $4,Y
B44F: ED 06       STD    $4,Y
B451: 7E 33 F0    JMP    $B172
B454: 85 20       BITA   #$02
B456: 27 84       BEQ    $B45E
B458: CC 28 A8    LDD    #$0020
B45B: 7E 99 5A    JMP    $B172
B45E: CC 88 62    LDD    #$0040
B461: 7E 33 F0    JMP    $B172
B464: 6A 00       DEC    $2,Y
B466: 27 CF       BEQ    $B4B5
B468: A6 0A       LDA    $2,Y
B46A: E6 2C       LDB    ,Y
B46C: C1 29       CMPB   #$01
B46E: 26 95       BNE    $B48D
B470: 81 2C       CMPA   #$0E
B472: 22 9F       BHI    $B491
B474: 86 62       LDA    #$40
B476: A7 A3       STA    $1,Y
B478: CC 28 08    LDD    #$0080
B47B: ED 0C       STD    $4,Y
B47D: BD 39 FA    JSR    $B172
B480: A6 00       LDA    $2,Y
B482: 81 8C       CMPA   #$0E
B484: 26 2D       BNE    $B495
B486: C6 8D       LDB    #$0F
B488: E7 0B       STB    $3,Y
B48A: 7E 39 9C    JMP    $B1B4
B48D: 81 8A       CMPA   #$02
B48F: 23 29       BLS    $B49C
B491: 86 A2       LDA    #$20
B493: A7 03       STA    $1,Y
B495: 6A A1       DEC    $3,Y
B497: E6 0B       LDB    $3,Y
B499: 7E 39 3C    JMP    $B1B4
B49C: 86 38       LDA    #$10
B49E: A7 A9       STA    $1,Y
B4A0: CC 22 E2    LDD    #$0060
B4A3: ED 06       STD    $4,Y
B4A5: BD 33 F0    JSR    $B172
B4A8: A6 0A       LDA    $2,Y
B4AA: 81 8A       CMPA   #$02
B4AC: 26 CF       BNE    $B495
B4AE: C6 86       LDB    #$0E
B4B0: E7 01       STB    $3,Y
B4B2: 7E 33 96    JMP    $B1B4
B4B5: 6A 26       DEC    ,Y
B4B7: 10 27 D5 03 LBEQ   $B246
B4BB: A6 8C       LDA    ,Y
B4BD: 81 89       CMPA   #$01
B4BF: 10 26 DD D9 LBNE   $B41E
B4C3: CC 22 A2    LDD    #$0080
B4C6: ED A6       STD    $4,Y
B4C8: BD 99 FA    JSR    $B172
B4CB: CC A8 38    LDD    #$8010
B4CE: ED A9       STD    $1,Y
B4D0: C6 2D       LDB    #$0F
B4D2: E7 A1       STB    $3,Y
B4D4: 7E 93 36    JMP    $B1B4
B4D7: CE 9C C2    LDU    #$B4EA
B4DA: CC 85 2A    LDD    #$0D02
B4DD: ED 2C       STD    ,Y
B4DF: BD 93 9D    JSR    $B1BF
B4E2: CC 82 2A    LDD    #$0008
B4E5: E7 A0       STB    $2,Y
B4E7: 7E 99 B9    JMP    $B191
B4EA: 6A 2C       DEC    ,Y
B4EC: 27 26       BEQ    $B4FC
B4EE: A6 2C       LDA    ,Y
B4F0: 85 23       BITA   #$01
B4F2: 27 95       BEQ    $B50B
B4F4: 6C 00       INC    $2,Y
B4F6: 4F          CLRA
B4F7: E6 0A       LDB    $2,Y
B4F9: 7E 39 19    JMP    $B191
B4FC: 86 25       LDA    #$0D
B4FE: A7 2C       STA    ,Y
B500: 6C 03       INC    $1,Y
B502: E6 A3       LDB    $1,Y
B504: C1 29       CMPB   #$0B
B506: 2C 8B       BGE    $B511
B508: 7E 99 37    JMP    $B1BF
B50B: CC 28 68    LDD    #$0040
B50E: 7E 39 B3    JMP    $B191
B511: CE 37 97    LDU    #$B515
B514: 39          RTS
B515: 6C A0       INC    $2,Y
B517: E6 0A       LDB    $2,Y
B519: 4F          CLRA
B51A: BD 39 B9    JSR    $B191
B51D: 6A 2C       DEC    ,Y
B51F: 26 D1       BNE    $B514
B521: 86 8C       LDA    #$0E
B523: A7 86       STA    ,Y
B525: 6A A3       DEC    $1,Y
B527: 10 2B D5 A9 LBMI   $B24C
B52B: E6 09       LDB    $1,Y
B52D: 7E 39 37    JMP    $B1BF
B530: CE 97 C7    LDU    #$B545
B533: CC 23 22    LDD    #$0100
B536: BD 33 5A    JSR    $B172
B539: CC 98 A0    LDD    #$1028
B53C: ED 8C       STD    ,Y
B53E: C6 86       LDB    #$0E
B540: E7 00       STB    $2,Y
B542: 7E 33 96    JMP    $B1B4
B545: 6A 26       DEC    ,Y
B547: 27 26       BEQ    $B557
B549: A6 2C       LDA    ,Y
B54B: 8E 99 5A    LDX    #$B172
B54E: E6 0E       LDB    A,X
B550: C4 3D       ANDB   #$1F
B552: 86 83       LDA    #$01
B554: 7E 93 F0    JMP    $B172
B557: 6A 09       DEC    $1,Y
B559: 10 27 74 C1 LBEQ   $B246
B55D: 86 98       LDA    #$10
B55F: A7 86       STA    ,Y
B561: A6 A3       LDA    $1,Y
B563: 81 2A       CMPA   #$08
B565: 22 85       BHI    $B56E
B567: 6A 0A       DEC    $2,Y
B569: E6 AA       LDB    $2,Y
B56B: 7E 99 9C    JMP    $B1B4
B56E: 39          RTS
B56F: 7E 90 64    JMP    $B246
B572: CE 37 AC    LDU    #$B58E
B575: 86 86       LDA    #$04
B577: B7 3E EE    STA    $16C6
B57A: CC 88 3A    LDD    #$0012
B57D: ED AB       STD    $3,Y
B57F: BD 93 50    JSR    $B172
B582: CC B2 2C    LDD    #$300E
B585: ED 26       STD    ,Y
B587: C6 25       LDB    #$0D
B589: E7 AA       STB    $2,Y
B58B: 7E 99 9C    JMP    $B1B4
B58E: 6A 2C       DEC    ,Y
B590: 27 12       BEQ    $B5C2
B592: A6 26       LDA    ,Y
B594: 85 23       BITA   #$01
B596: 27 A6       BEQ    $B5BC
B598: E6 09       LDB    $1,Y
B59A: C1 86       CMPB   #$0E
B59C: 27 30       BEQ    $B5B6
B59E: 85 8C       BITA   #$04
B5A0: 27 28       BEQ    $B5AC
B5A2: CC 82 23    LDD    #$0001
B5A5: E3 A1       ADDD   $3,Y
B5A7: ED 0B       STD    $3,Y
B5A9: 7E 39 FA    JMP    $B172
B5AC: CC D7 77    LDD    #$FFFF
B5AF: E3 01       ADDD   $3,Y
B5B1: ED A1       STD    $3,Y
B5B3: 7E 93 50    JMP    $B172
B5B6: CC 82 3C    LDD    #$0014
B5B9: 7E 39 FA    JMP    $B172
B5BC: CC 28 98    LDD    #$0010
B5BF: 7E 93 50    JMP    $B172
B5C2: 6A A3       DEC    $1,Y
B5C4: 10 27 7E FC LBEQ   $B246
B5C8: 86 30       LDA    #$18
B5CA: A7 2C       STA    ,Y
B5CC: 6A 0A       DEC    $2,Y
B5CE: E6 AA       LDB    $2,Y
B5D0: 7E 93 36    JMP    $B1B4
B5D3: CC 32 29    LDD    #$100B
B5D6: ED 26       STD    ,Y
B5D8: CC 28 28    LDD    #$00A0
B5DB: ED 0B       STD    $3,Y
B5DD: BD 39 FA    JSR    $B172
B5E0: C6 28       LDB    #$0A
B5E2: E7 A0       STB    $2,Y
B5E4: CE 97 68    LDU    #$B5EA
B5E7: 7E 99 9C    JMP    $B1B4
B5EA: 6A 2C       DEC    ,Y
B5EC: 27 18       BEQ    $B61E
B5EE: A6 2C       LDA    ,Y
B5F0: 85 23       BITA   #$01
B5F2: 26 9A       BNE    $B60C
B5F4: 85 26       BITA   #$04
B5F6: 27 88       BEQ    $B602
B5F8: CC 28 8B    LDD    #$0003
B5FB: E3 0B       ADDD   $3,Y
B5FD: ED AB       STD    $3,Y
B5FF: 7E 93 50    JMP    $B172
B602: CC 7D DF    LDD    #$FFFD
B605: E3 A1       ADDD   $3,Y
B607: ED 0B       STD    $3,Y
B609: 7E 39 FA    JMP    $B172
B60C: A6 09       LDA    $1,Y
B60E: 81 82       CMPA   #$0A
B610: 25 24       BCS    $B618
B612: CC 82 32    LDD    #$0010
B615: 7E 33 F0    JMP    $B172
B618: CC 28 AA    LDD    #$0022
B61B: 7E 99 5A    JMP    $B172
B61E: 6A A9       DEC    $1,Y
B620: 10 27 7E A0 LBEQ   $B246
B624: A6 03       LDA    $1,Y
B626: 81 88       CMPA   #$0A
B628: 27 23       BEQ    $B635
B62A: 86 90       LDA    #$18
B62C: A7 8C       STA    ,Y
B62E: 6A AA       DEC    $2,Y
B630: E6 00       LDB    $2,Y
B632: 7E 33 96    JMP    $B1B4
B635: CC 82 9C    LDD    #$001E
B638: ED 0B       STD    $3,Y
B63A: 86 B8       LDA    #$30
B63C: A7 8C       STA    ,Y
B63E: 6A AA       DEC    $2,Y
B640: E6 00       LDB    $2,Y
B642: 7E 33 96    JMP    $B1B4
B645: CC D2 89    LDD    #$500B
B648: ED 8C       STD    ,Y
B64A: BD 39 9C    JSR    $B1B4
B64D: CE 3E D3    LDU    #$B65B
B650: FF 35 80    STU    $1702
B653: CC 22 23    LDD    #$0001
B656: ED A0       STD    $2,Y
B658: 7E 99 FA    JMP    $B172
B65B: CC 28 23    LDD    #$000B
B65E: E3 AA       ADDD   $2,Y
B660: ED 00       STD    $2,Y
B662: 6A 26       DEC    ,Y
B664: 27 21       BEQ    $B669
B666: 7E 33 5A    JMP    $B172
B669: CC 9E 82    LDD    #$160A
B66C: ED 8C       STD    ,Y
B66E: BD 39 96    JSR    $B1B4
B671: CE 34 02    LDU    #$B680
B674: CC 22 92    LDD    #$0010
B677: ED 0A       STD    $2,Y
B679: CC 88 98    LDD    #$0010
B67C: FD 3F 82    STD    $170A
B67F: 39          RTS
B680: EC 00       LDD    $2,Y
B682: C3 82 23    ADDD   #$0001
B685: ED A0       STD    $2,Y
B687: BD 99 F1    JSR    $B1D9
B68A: C4 97       ANDB   #$1F
B68C: 4F          CLRA
B68D: E3 AA       ADDD   $2,Y
B68F: 6A 86       DEC    ,Y
B691: 27 81       BEQ    $B696
B693: 7E 93 A3    JMP    $B181
B696: 86 94       LDA    #$16
B698: A7 8C       STA    ,Y
B69A: 6A A9       DEC    $1,Y
B69C: 10 2B 73 2E LBMI   $B246
B6A0: E6 03       LDB    $1,Y
B6A2: 7E 33 96    JMP    $B1B4
B6A5: CC B6 8E    LDD    #$340C
B6A8: ED 8C       STD    ,Y
B6AA: BD 39 97    JSR    $B1BF
B6AD: CE 3E 33    LDU    #$B6BB
B6B0: FF 35 80    STU    $1702
B6B3: CC 22 2E    LDD    #$000C
B6B6: ED A0       STD    $2,Y
B6B8: 7E 99 19    JMP    $B191
B6BB: CC 28 2D    LDD    #$0005
B6BE: E3 AA       ADDD   $2,Y
B6C0: ED 00       STD    $2,Y
B6C2: 6A 26       DEC    ,Y
B6C4: 27 21       BEQ    $B6C9
B6C6: 7E 33 B9    JMP    $B191
B6C9: CC 98 83    LDD    #$100B
B6CC: ED 8C       STD    ,Y
B6CE: BD 39 9D    JSR    $B1BF
B6D1: CE 34 58    LDU    #$B6DA
B6D4: CC 22 92    LDD    #$0010
B6D7: ED 0A       STD    $2,Y
B6D9: 39          RTS
B6DA: EC AA       LDD    $2,Y
B6DC: C3 28 89    ADDD   #$0001
B6DF: ED 00       STD    $2,Y
B6E1: BD 33 5B    JSR    $B1D9
B6E4: C4 3D       ANDB   #$1F
B6E6: 4F          CLRA
B6E7: E3 0A       ADDD   $2,Y
B6E9: 6A 2C       DEC    ,Y
B6EB: 27 2B       BEQ    $B6F0
B6ED: 7E 39 19    JMP    $B191
B6F0: 86 32       LDA    #$10
B6F2: A7 26       STA    ,Y
B6F4: 6A 03       DEC    $1,Y
B6F6: 10 2B D3 7A LBMI   $B24C
B6FA: E6 A9       LDB    $1,Y
B6FC: 7E 99 37    JMP    $B1BF
B6FF: CE 95 3B    LDU    #$B719
B702: CC C2 2E    LDD    #$400C
B705: ED 26       STD    ,Y
B707: BD 99 9C    JSR    $B1B4
B70A: CC 88 2C    LDD    #$0004
B70D: FD 9F 82    STD    $170A
B710: CC 20 D2    LDD    #$0250
B713: ED 00       STD    $2,Y
B715: 4F          CLRA
B716: 7E 33 5A    JMP    $B172
B719: 6A AB       DEC    $3,Y
B71B: E6 0B       LDB    $3,Y
B71D: 4F          CLRA
B71E: BD 39 50    JSR    $B172
B721: 6A 26       DEC    ,Y
B723: 26 29       BNE    $B730
B725: 6A A0       DEC    $2,Y
B727: 27 20       BEQ    $B731
B729: CC C8 D8    LDD    #$4050
B72C: A7 8C       STA    ,Y
B72E: E7 AB       STB    $3,Y
B730: 39          RTS
B731: CE 35 C7    LDU    #$B745
B734: CC 2A A2    LDD    #$0820
B737: A7 8C       STA    ,Y
B739: E7 AB       STB    $3,Y
B73B: CC 2F 26    LDD    #$070E
B73E: A7 AA       STA    $2,Y
B740: E7 03       STB    $1,Y
B742: 7E 33 96    JMP    $B1B4
B745: 6C A1       INC    $3,Y
B747: E6 0B       LDB    $3,Y
B749: 4F          CLRA
B74A: BD 39 5A    JSR    $B172
B74D: 6A 2C       DEC    ,Y
B74F: 26 FD       BNE    $B730
B751: 86 8A       LDA    #$08
B753: A7 86       STA    ,Y
B755: 6A A3       DEC    $1,Y
B757: 6A 0A       DEC    $2,Y
B759: 27 81       BEQ    $B764
B75B: E6 09       LDB    $1,Y
B75D: 10 2B 72 C7 LBMI   $B246
B761: 7E 33 36    JMP    $B1B4
B764: C6 25       LDB    #$07
B766: E7 A0       STB    $2,Y
B768: C6 2C       LDB    #$04
B76A: EB A9       ADDB   $1,Y
B76C: E7 09       STB    $1,Y
B76E: 86 A8       LDA    #$20
B770: A7 01       STA    $3,Y
B772: 39          RTS
B773: CC 22 23    LDD    #$0001
B776: ED A0       STD    $2,Y
B778: BD 87 1C    JSR    $AF94
B77B: CC 2C 28    LDD    #$0400
B77E: ED 2C       STD    ,Y
B780: CE 95 0D    LDU    #$B78F
B783: FF 35 20    STU    $1702
B786: BD 33 F8    JSR    $B1D0
B789: CC 88 98    LDD    #$0010
B78C: 7E 99 19    JMP    $B191
B78F: 6A 86       DEC    ,Y
B791: 26 9F       BNE    $B7B0
B793: 86 26       LDA    #$04
B795: A7 26       STA    ,Y
B797: 6C 09       INC    $1,Y
B799: E6 A9       LDB    $1,Y
B79B: C1 25       CMPB   #$0D
B79D: 2C 8B       BGE    $B7A2
B79F: 7E 93 F2    JMP    $B1D0
B7A2: 5F          CLRB
B7A3: BD 93 F2    JSR    $B1D0
B7A6: CE 35 99    LDU    #$B7B1
B7A9: 86 B8       LDA    #$30
B7AB: A7 8C       STA    ,Y
B7AD: 7E 39 37    JMP    $B1BF
B7B0: 39          RTS
B7B1: EC A0       LDD    $2,Y
B7B3: C3 22 32    ADDD   #$0010
B7B6: ED A0       STD    $2,Y
B7B8: 6A 8C       DEC    ,Y
B7BA: 27 8B       BEQ    $B7BF
B7BC: 7E 99 19    JMP    $B191
B7BF: 86 2E       LDA    #$0C
B7C1: A7 26       STA    ,Y
B7C3: 6A 03       DEC    $1,Y
B7C5: 10 2B 78 AB LBMI   $B24C
B7C9: E6 A9       LDB    $1,Y
B7CB: 7E 99 97    JMP    $B1BF
B7CE: CE 3F C7    LDU    #$B7E5
B7D1: CC 82 42    LDD    #$00C0
B7D4: ED 01       STD    $3,Y
B7D6: BD 33 5A    JSR    $B172
B7D9: CC A8 87    LDD    #$200F
B7DC: ED 8C       STD    ,Y
B7DE: C6 86       LDB    #$0E
B7E0: E7 00       STB    $2,Y
B7E2: 7E 33 96    JMP    $B1B4
B7E5: 6A 26       DEC    ,Y
B7E7: 27 02       BEQ    $B813
B7E9: A6 2C       LDA    ,Y
B7EB: 85 29       BITA   #$01
B7ED: 27 96       BEQ    $B80D
B7EF: 85 2A       BITA   #$08
B7F1: 27 88       BEQ    $B7FD
B7F3: CC DD DD    LDD    #$FFFF
B7F6: E3 A1       ADDD   $3,Y
B7F8: ED 0B       STD    $3,Y
B7FA: 7E 39 5A    JMP    $B172
B7FD: A6 A9       LDA    $1,Y
B7FF: 81 2F       CMPA   #$0D
B801: 22 87       BHI    $B808
B803: CC 22 20    LDD    #$0002
B806: 20 6C       BRA    $B7F6
B808: CC 28 89    LDD    #$0001
B80B: 20 C1       BRA    $B7F6
B80D: CC 88 98    LDD    #$0010
B810: 7E 93 F0    JMP    $B172
B813: 6A 03       DEC    $1,Y
B815: 10 27 78 05 LBEQ   $B246
B819: 86 A8       LDA    #$20
B81B: A7 8C       STA    ,Y
B81D: A6 A9       LDA    $1,Y
B81F: 81 2F       CMPA   #$0D
B821: 27 8F       BEQ    $B830
B823: 84 23       ANDA   #$01
B825: 27 92       BEQ    $B837
B827: 6A 0A       DEC    $2,Y
B829: 6A AA       DEC    $2,Y
B82B: E6 0A       LDB    $2,Y
B82D: 7E 39 3C    JMP    $B1B4
B830: C6 2C       LDB    #$0E
B832: E7 A0       STB    $2,Y
B834: BD 93 36    JSR    $B1B4
B837: CC 28 A8    LDD    #$0080
B83A: ED AB       STD    $3,Y
B83C: 7E 99 FA    JMP    $B172
B83F: CE 9A 77    LDU    #$B855
B842: FF 95 20    STU    $1702
B845: CC 82 92    LDD    #$0010
B848: ED 0A       STD    $2,Y
B84A: BD 39 5A    JSR    $B172
B84D: CC B8 84    LDD    #$300C
B850: A7 86       STA    ,Y
B852: 7E 33 96    JMP    $B1B4
B855: EC A0       LDD    $2,Y
B857: C3 28 20    ADDD   #$0008
B85A: ED AA       STD    $2,Y
B85C: BD 99 FA    JSR    $B172
B85F: 6A 86       DEC    ,Y
B861: 27 83       BEQ    $B864
B863: 39          RTS
B864: 86 2D       LDA    #$0F
B866: A7 26       STA    ,Y
B868: 6A 09       DEC    $1,Y
B86A: CE 30 54    LDU    #$B87C
B86D: CC 88 08    LDD    #$0080
B870: ED 00       STD    $2,Y
B872: BD 33 50    JSR    $B172
B875: C6 89       LDB    #$0B
B877: E7 09       STB    $1,Y
B879: 7E 39 3C    JMP    $B1B4
B87C: CC D7 77    LDD    #$FFFF
B87F: E3 00       ADDD   $2,Y
B881: ED A0       STD    $2,Y
B883: BD 93 FB    JSR    $B1D9
B886: C4 9D       ANDB   #$1F
B888: 4F          CLRA
B889: E3 AA       ADDD   $2,Y
B88B: BD 99 5A    JSR    $B172
B88E: 6A 2C       DEC    ,Y
B890: 26 F3       BNE    $B863
B892: 86 8D       LDA    #$0F
B894: A7 86       STA    ,Y
B896: 6A A3       DEC    $1,Y
B898: 10 2B 71 22 LBMI   $B246
B89C: E6 09       LDB    $1,Y
B89E: 7E 39 96    JMP    $B1B4
B8A1: CE 3A 3E    LDU    #$B8BC
B8A4: CC 23 C2    LDD    #$0140
B8A7: BD 99 B9    JSR    $B191
B8AA: 6F 2C       CLR    ,Y
B8AC: CC 2C A0    LDD    #$0428
B8AF: ED 03       STD    $1,Y
B8B1: CC 82 85    LDD    #$0007
B8B4: ED 01       STD    $3,Y
B8B6: F7 95 21    STB    $1709
B8B9: 7E 39 37    JMP    $B1BF
B8BC: 6A 0A       DEC    $2,Y
B8BE: 27 A2       BEQ    $B8EA
B8C0: A6 86       LDA    ,Y
B8C2: 85 83       BITA   #$01
B8C4: 26 2C       BNE    $B8D4
B8C6: 6A A3       DEC    $1,Y
B8C8: 26 15       BNE    $B907
B8CA: 86 8F       LDA    #$07
B8CC: A7 09       STA    $1,Y
B8CE: 6C 2C       INC    ,Y
B8D0: 5F          CLRB
B8D1: 7E 33 3D    JMP    $B1BF
B8D4: 6A 03       DEC    $1,Y
B8D6: 26 AD       BNE    $B907
B8D8: 86 2C       LDA    #$04
B8DA: A7 A9       STA    $1,Y
B8DC: 6A 8C       DEC    ,Y
B8DE: B6 9F 2B    LDA    $1709
B8E1: 10 27 7B 45 LBEQ   $B24C
B8E5: E6 A6       LDB    $4,Y
B8E7: 7E 99 97    JMP    $B1BF
B8EA: 86 A0       LDA    #$28
B8EC: A7 0A       STA    $2,Y
B8EE: 6C AB       INC    $3,Y
B8F0: A6 01       LDA    $3,Y
B8F2: 81 85       CMPA   #$07
B8F4: 24 25       BCC    $B8FD
B8F6: 6C A6       INC    $4,Y
B8F8: E6 0C       LDB    $4,Y
B8FA: 7E 39 97    JMP    $B1BF
B8FD: 81 9C       CMPA   #$14
B8FF: 25 24       BCS    $B907
B901: 6A A6       DEC    $4,Y
B903: 10 2B DB C7 LBMI   $B24C
B907: 39          RTS
B908: 7E 9A C4    JMP    $B24C
B90B: CE 91 05    LDU    #$B92D
B90E: CC 31 BB    LDD    #$B999
B911: FD 94 46    STD    $16C4
B914: CC 22 86    LDD    #$0004
B917: FD 3F 22    STD    $170A
B91A: CC 9B 28    LDD    #$1300
B91D: B7 9E 4E    STA    $16C6
B920: E7 03       STB    $1,Y
B922: BD 33 96    JSR    $B1B4
B925: CC 82 F1    LDD    #$0073
B928: E7 8C       STB    ,Y
B92A: 7E 39 A9    JMP    $B181
B92D: 6A 2C       DEC    ,Y
B92F: E6 86       LDB    ,Y
B931: C1 94       CMPB   #$16
B933: 2F 26       BLE    $B939
B935: 4F          CLRA
B936: 7E 33 A9    JMP    $B181
B939: 6C A9       INC    $1,Y
B93B: E6 09       LDB    $1,Y
B93D: CE 31 CF    LDU    #$B947
B940: C1 28       CMPB   #$0A
B942: 24 AA       BCC    $B96C
B944: 7E 93 36    JMP    $B1B4
B947: 6C 8C       INC    ,Y
B949: E6 2C       LDB    ,Y
B94B: C1 5B       CMPB   #$73
B94D: 24 8C       BCC    $B953
B94F: 4F          CLRA
B950: 7E 93 03    JMP    $B181
B953: CE 9B 0F    LDU    #$B92D
B956: 6C A3       INC    $1,Y
B958: E6 09       LDB    $1,Y
B95A: C1 82       CMPB   #$0A
B95C: 24 2B       BCC    $B961
B95E: 7E 39 96    JMP    $B1B4
B961: C1 9A       CMPB   #$18
B963: 25 7D       BCS    $B9C4
B965: 86 88       LDA    #$0A
B967: A7 09       STA    $1,Y
B969: CE 31 E5    LDU    #$B96D
B96C: 39          RTS
B96D: 6A 2C       DEC    ,Y
B96F: E6 86       LDB    ,Y
B971: C1 94       CMPB   #$16
B973: 2E F8       BGT    $B94F
B975: 6A A3       DEC    $1,Y
B977: 6A 09       DEC    $1,Y
B979: E6 A9       LDB    $1,Y
B97B: CE 91 A9    LDU    #$B981
B97E: 7E 39 96    JMP    $B1B4
B981: 6C 26       INC    ,Y
B983: E6 86       LDB    ,Y
B985: C1 F1       CMPB   #$73
B987: 25 EE       BCS    $B94F
B989: CE 31 E5    LDU    #$B96D
B98C: 6A 09       DEC    $1,Y
B98E: 6A A9       DEC    $1,Y
B990: 10 2B 7A 30 LBMI   $B246
B994: E6 03       LDB    $1,Y
B996: 7E 33 9C    JMP    $B1B4
B999: CE 31 2D    LDU    #$B9A5
B99C: CC 5B C8    LDD    #$7340
B99F: ED 86       STD    ,Y
B9A1: 5F          CLRB
B9A2: 7E 33 9D    JMP    $B1BF
B9A5: 6A A3       DEC    $1,Y
B9A7: 26 3A       BNE    $B9BB
B9A9: C6 8A       LDB    #$02
B9AB: E7 09       STB    $1,Y
B9AD: CE 31 3B    LDU    #$B9B3
B9B0: 7E 93 3D    JMP    $B1BF
B9B3: 6A 86       DEC    ,Y
B9B5: E6 26       LDB    ,Y
B9B7: C1 3E       CMPB   #$16
B9B9: 2F 8C       BLE    $B9BF
B9BB: 4F          CLRA
B9BC: 7E 99 19    JMP    $B191
B9BF: CE 9B E7    LDU    #$B9C5
B9C2: 6C A3       INC    $1,Y
B9C4: 39          RTS
B9C5: 6C 26       INC    ,Y
B9C7: E6 8C       LDB    ,Y
B9C9: C1 FB       CMPB   #$73
B9CB: 25 C6       BCS    $B9BB
B9CD: CE 31 3B    LDU    #$B9B3
B9D0: 6C 03       INC    $1,Y
B9D2: E6 A3       LDB    $1,Y
B9D4: C1 29       CMPB   #$0B
B9D6: 10 25 DF CD LBCS   $B1BF
B9DA: C1 90       CMPB   #$18
B9DC: 25 CE       BCS    $B9C4
B9DE: CE 31 C4    LDU    #$B9E6
B9E1: 86 89       LDA    #$0B
B9E3: A7 03       STA    $1,Y
B9E5: 39          RTS
B9E6: 6A 26       DEC    ,Y
B9E8: E6 8C       LDB    ,Y
B9EA: C1 9E       CMPB   #$16
B9EC: 2E E5       BGT    $B9BB
B9EE: CE 31 D4    LDU    #$B9F6
B9F1: 6A A3       DEC    $1,Y
B9F3: 6A 03       DEC    $1,Y
B9F5: 39          RTS
B9F6: 6C 26       INC    ,Y
B9F8: E6 8C       LDB    ,Y
B9FA: C1 FB       CMPB   #$73
B9FC: 25 95       BCS    $B9BB
B9FE: CE 31 C4    LDU    #$B9E6
BA01: 6A A3       DEC    $1,Y
BA03: 6A 03       DEC    $1,Y
BA05: 10 2B 7A 6B LBMI   $B24C
BA09: E6 A9       LDB    $1,Y
BA0B: 7E 99 97    JMP    $B1BF
BA0E: CE 32 07    LDU    #$BA25
BA11: CC AA 8C    LDD    #$280E
BA14: ED 86       STD    ,Y
BA16: BD 33 9C    JSR    $B1B4
BA19: 86 8E       LDA    #$06
BA1B: A7 0A       STA    $2,Y
BA1D: CC 88 B8    LDD    #$0030
BA20: ED 01       STD    $3,Y
BA22: 7E 33 50    JMP    $B172
BA25: 6A A6       DEC    $4,Y
BA27: 6A 8C       DEC    ,Y
BA29: 27 83       BEQ    $BA36
BA2B: A6 8C       LDA    ,Y
BA2D: 85 8B       BITA   #$03
BA2F: 26 2F       BNE    $BA3E
BA31: EC A1       LDD    $3,Y
BA33: 7E 93 50    JMP    $B172
BA36: 86 AA       LDA    #$28
BA38: A7 8C       STA    ,Y
BA3A: CE 32 6E    LDU    #$BA46
BA3D: 39          RTS
BA3E: CC 88 28    LDD    #$000A
BA41: E3 A1       ADDD   $3,Y
BA43: 7E 93 50    JMP    $B172
BA46: 6A 26       DEC    ,Y
BA48: 26 DB       BNE    $BA3D
BA4A: 86 8F       LDA    #$07
BA4C: A7 8C       STA    ,Y
BA4E: 6A AA       DEC    $2,Y
BA50: 27 29       BEQ    $BA5D
BA52: 6A A3       DEC    $1,Y
BA54: 10 2B 75 6C LBMI   $B246
BA58: E6 09       LDB    $1,Y
BA5A: 7E 39 9C    JMP    $B1B4
BA5D: 86 8E       LDA    #$06
BA5F: A7 00       STA    $2,Y
BA61: E6 A3       LDB    $1,Y
BA63: CB 26       ADDB   #$04
BA65: E7 A3       STB    $1,Y
BA67: 7E 99 9C    JMP    $B1B4
BA6A: CE 32 55    LDU    #$BA7D
BA6D: CC A8 86    LDD    #$200E
BA70: ED 86       STD    ,Y
BA72: BD 33 9D    JSR    $B1BF
BA75: CC 82 B2    LDD    #$0030
BA78: ED 0A       STD    $2,Y
BA7A: 7E 39 B9    JMP    $B191
BA7D: 6C AA       INC    $2,Y
BA7F: 6C 00       INC    $2,Y
BA81: E6 A0       LDB    $2,Y
BA83: C1 7A       CMPB   #$58
BA85: 24 A3       BCC    $BAA8
BA87: 6A 8C       DEC    ,Y
BA89: 27 84       BEQ    $BA97
BA8B: A6 8C       LDA    ,Y
BA8D: 85 89       BITA   #$01
BA8F: 27 20       BEQ    $BA93
BA91: C6 B2       LDB    #$30
BA93: 4F          CLRA
BA94: 7E 93 13    JMP    $B191
BA97: 86 08       LDA    #$20
BA99: A7 2C       STA    ,Y
BA9B: 6A 09       DEC    $1,Y
BA9D: E6 A9       LDB    $1,Y
BA9F: C1 2A       CMPB   #$08
BAA1: 10 25 75 85 LBCS   $B24C
BAA5: 7E 33 3D    JMP    $B1BF
BAA8: CE 92 24    LDU    #$BAAC
BAAB: 39          RTS
BAAC: 6A 0A       DEC    $2,Y
BAAE: 6A AA       DEC    $2,Y
BAB0: E6 00       LDB    $2,Y
BAB2: C1 8A       CMPB   #$08
BAB4: 24 F3       BCC    $BA87
BAB6: CE 38 55    LDU    #$BA7D
BAB9: 39          RTS
BABA: CE 32 F9    LDU    #$BAD1
BABD: CC 88 8B    LDD    #$0003
BAC0: FD 35 88    STD    $170A
BAC3: CC 62 B2    LDD    #$4090
BAC6: ED 26       STD    ,Y
BAC8: 4F          CLRA
BAC9: BD 39 09    JSR    $B181
BACC: C6 25       LDB    #$0D
BACE: 7E 39 96    JMP    $B1B4
BAD1: 6A 26       DEC    ,Y
BAD3: 27 2A       BEQ    $BADD
BAD5: 6A A3       DEC    $1,Y
BAD7: E6 09       LDB    $1,Y
BAD9: 4F          CLRA
BADA: 7E 39 A9    JMP    $B181
BADD: 86 C8       LDA    #$40
BADF: A7 86       STA    ,Y
BAE1: 86 A4       LDA    #$26
BAE3: AB 03       ADDA   $1,Y
BAE5: A7 A3       STA    $1,Y
BAE7: 81 78       CMPA   #$50
BAE9: 10 23 7F 71 LBLS   $B246
BAED: 39          RTS

BAEE: CE 33 23    LDU    #$BB01
BAF1: CC 83 02    LDD    #$0180
BAF4: BD 93 F0    JSR    $B172
BAF7: CC 2A 2B    LDD    #$0203
BAFA: ED 2C       STD    ,Y
BAFC: C6 24       LDB    #$0C
BAFE: 7E 39 96    JMP    $B1B4
BB01: 6A 26       DEC    ,Y
BB03: 27 23       BEQ    $BB06
BB05: 39          RTS
BB06: 6A A3       DEC    $1,Y
BB08: 10 27 7F B2 LBEQ   $B246
BB0C: A6 09       LDA    $1,Y
BB0E: 81 8A       CMPA   #$02
BB10: 27 2C       BEQ    $BB20
BB12: CC 80 2E    LDD    #$020C
BB15: A7 26       STA    ,Y
BB17: BD 99 9C    JSR    $B1B4
BB1A: CC 89 A8    LDD    #$0180
BB1D: 7E 39 FA    JMP    $B172
BB20: CC 42 82    LDD    #speech_6000
BB23: A7 86       STA    ,Y
BB25: 7E 33 36    JMP    $B1B4
BB28: 7E 9A CE    JMP    $B246
BB2B: CE 93 6A    LDU    #$BB42
BB2E: CC 90 33    LDD    #$1811
BB31: ED 26       STD    ,Y
BB33: CC 22 A2    LDD    #$0080
BB36: ED A1       STD    $3,Y
BB38: BD 99 FA    JSR    $B172
BB3B: C6 25       LDB    #$0D
BB3D: E7 AA       STB    $2,Y
BB3F: 7E 93 96    JMP    $B1B4
BB42: 6A 26       DEC    ,Y
BB44: 27 04       BEQ    $BB6C
BB46: A6 26       LDA    ,Y
BB48: 84 29       ANDA   #$01
BB4A: 26 92       BNE    $BB66
BB4C: A6 8C       LDA    ,Y
BB4E: 85 80       BITA   #$08
BB50: 26 28       BNE    $BB5C
BB52: CC 82 26    LDD    #$0004
BB55: E3 A1       ADDD   $3,Y
BB57: ED 0B       STD    $3,Y
BB59: 7E 39 FA    JMP    $B172
BB5C: CC D7 74    LDD    #$FFFC
BB5F: E3 01       ADDD   $3,Y
BB61: ED A1       STD    $3,Y
BB63: 7E 93 50    JMP    $B172
BB66: CC 82 38    LDD    #$0010
BB69: 7E 39 FA    JMP    $B172
BB6C: 6A 09       DEC    $1,Y
BB6E: 10 27 D4 F6 LBEQ   $B246
BB72: 86 9A       LDA    #$18
BB74: A7 86       STA    ,Y
BB76: A6 A3       LDA    $1,Y
BB78: 81 26       CMPA   #$0E
BB7A: 27 3F       BEQ    $BB33
BB7C: 6A 0A       DEC    $2,Y
BB7E: E6 AA       LDB    $2,Y
BB80: 7E 93 36    JMP    $B1B4
BB83: CE 99 B8    LDU    #$BB9A
BB86: CC 82 E8    LDD    #$00C0
BB89: ED AB       STD    $3,Y
BB8B: BD 99 5A    JSR    $B172
BB8E: CC C8 30    LDD    #$4012
BB91: ED 26       STD    ,Y
BB93: C6 2D       LDB    #$0F
BB95: E7 A0       STB    $2,Y
BB97: 7E 99 9C    JMP    $B1B4
BB9A: 6A 2C       DEC    ,Y
BB9C: 27 0C       BEQ    $BBC2
BB9E: A6 2C       LDA    ,Y
BBA0: 85 23       BITA   #$01
BBA2: 27 9A       BEQ    $BBBC
BBA4: 85 2A       BITA   #$08
BBA6: 27 88       BEQ    $BBB2
BBA8: CC D7 74    LDD    #$FFFC
BBAB: E3 0B       ADDD   $3,Y
BBAD: ED AB       STD    $3,Y
BBAF: 7E 93 50    JMP    $B172
BBB2: CC 82 2A    LDD    #$0008
BBB5: E3 A1       ADDD   $3,Y
BBB7: ED 0B       STD    $3,Y
BBB9: 7E 39 FA    JMP    $B172
BBBC: CC 28 A8    LDD    #$0020
BBBF: 7E 93 50    JMP    $B172
BBC2: 6A A3       DEC    $1,Y
BBC4: 10 27 74 FC LBEQ   $B246
BBC8: A6 09       LDA    $1,Y
BBCA: 81 98       CMPA   #$10
BBCC: 22 08       BHI    $BBEE
BBCE: 81 82       CMPA   #$0A
BBD0: 26 21       BNE    $BBD5
BBD2: 7F 94 E4    CLR    $16C6
BBD5: 86 C2       LDA    #$40
BBD7: A7 8C       STA    ,Y
BBD9: CC 88 08    LDD    #$0080
BBDC: ED 0B       STD    $3,Y
BBDE: BD 39 50    JSR    $B172
BBE1: A6 A3       LDA    $1,Y
BBE3: 81 32       CMPA   #$10
BBE5: 26 89       BNE    $BBF2
BBE7: C6 27       LDB    #$0F
BBE9: E7 AA       STB    $2,Y
BBEB: 7E 99 9C    JMP    $B1B4
BBEE: 86 A8       LDA    #$20
BBF0: A7 86       STA    ,Y
BBF2: 6A A0       DEC    $2,Y
BBF4: E6 00       LDB    $2,Y
BBF6: 7E 33 9C    JMP    $B1B4
BBF9: CE 34 95    LDU    #$BC1D
BBFC: FF 3F 8A    STU    $1702
BBFF: CC 62 2D    LDD    #$400F
BC02: ED 26       STD    ,Y
BC04: 5A          DECB
BC05: BD 33 36    JSR    $B1B4
BC08: 86 29       LDA    #$01
BC0A: A7 AA       STA    $2,Y
BC0C: CC 98 43    LDD    #$B0CB
BC0F: FD 34 E6    STD    $16C4
BC12: CC 82 2A    LDD    #$0008
BC15: BD 33 F0    JSR    $B172
BC18: C6 B0       LDB    #$98
BC1A: 7E 38 D6    JMP    $B0FE
BC1D: 6C AA       INC    $2,Y
BC1F: 6C 00       INC    $2,Y
BC21: 6A 26       DEC    ,Y
BC23: 27 2C       BEQ    $BC33
BC25: E6 A0       LDB    $2,Y
BC27: C5 2A       BITB   #$02
BC29: 26 89       BNE    $BC2C
BC2B: 50          NEGB
BC2C: 4F          CLRA
BC2D: C3 88 80    ADDD   #$0008
BC30: 7E 93 F0    JMP    $B172
BC33: 86 3A       LDA    #$18
BC35: A7 26       STA    ,Y
BC37: CE 94 69    LDU    #$BC41
BC3A: CC 88 38    LDD    #$0010
BC3D: 7E 39 FA    JMP    $B172
BC40: 39          RTS
BC41: 6A 26       DEC    ,Y
BC43: 27 33       BEQ    $BC56
BC45: A6 26       LDA    ,Y
BC47: 85 2B       BITA   #$03
BC49: 26 7D       BNE    $BC40
BC4B: BD 99 F1    JSR    $B1D9
BC4E: C4 8F       ANDB   #$07
BC50: CB 24       ADDB   #$06
BC52: 4F          CLRA
BC53: 7E 93 50    JMP    $B172
BC56: 86 9A       LDA    #$18
BC58: A7 8C       STA    ,Y
BC5A: 6A A9       DEC    $1,Y
BC5C: 10 2B 7D 6E LBMI   $B246
BC60: E6 03       LDB    $1,Y
BC62: 7E 33 96    JMP    $B1B4
BC65: BD 30 C4    JSR    $B246
BC68: C6 B9       LDB    #$91
BC6A: F7 9E E0    STB    $16C8
BC6D: 7E 38 76    JMP    $B0FE
BC70: CE 9E 0B    LDU    #$BC89
BC73: CC 26 24    LDD    #$0406
BC76: ED 26       STD    ,Y
BC78: BD 99 3C    JSR    $B1B4
BC7B: CC D7 DD    LDD    #$FFF5
BC7E: FD 9F 28    STD    $170A
BC81: CC 82 12    LDD    #$0090
BC84: E7 00       STB    $2,Y
BC86: 7E 33 A9    JMP    $B181
BC89: 6A 2C       DEC    ,Y
BC8B: 26 4A       BNE    $BCEF
BC8D: 86 8C       LDA    #$04
BC8F: A7 86       STA    ,Y
BC91: 6A A0       DEC    $2,Y
BC93: E6 00       LDB    $2,Y
BC95: C1 C3       CMPB   #$41
BC97: 25 3B       BCS    $BCAC
BC99: C5 8F       BITB   #$07
BC9B: 27 2C       BEQ    $BCA1
BC9D: 4F          CLRA
BC9E: 7E 39 A3    JMP    $B181
BCA1: 6C A3       INC    $1,Y
BCA3: E6 03       LDB    $1,Y
BCA5: C1 8C       CMPB   #$0E
BCA7: 24 6E       BCC    $BCEF
BCA9: 7E 39 3C    JMP    $B1B4
BCAC: CE 94 5A    LDU    #$BCD2
BCAF: CC 1E 30    LDD    #$3C12
BCB2: A7 26       STA    ,Y
BCB4: E7 01       STB    $3,Y
BCB6: 39          RTS
BCB7: 6A 8C       DEC    ,Y
BCB9: 26 BC       BNE    $BCEF
BCBB: 86 2E       LDA    #$06
BCBD: A7 2C       STA    ,Y
BCBF: 6C 00       INC    $2,Y
BCC1: E6 A0       LDB    $2,Y
BCC3: C1 92       CMPB   #$B0
BCC5: 22 1C       BHI    $BC65
BCC7: C5 2F       BITB   #$07
BCC9: 26 5A       BNE    $BC9D
BCCB: 6A 09       DEC    $1,Y
BCCD: E6 A9       LDB    $1,Y
BCCF: 7E 93 96    JMP    $B1B4
BCD2: 6A 26       DEC    ,Y
BCD4: 26 3B       BNE    $BCEF
BCD6: C6 BE       LDB    #$3C
BCD8: E7 8C       STB    ,Y
BCDA: E6 AA       LDB    $2,Y
BCDC: C8 29       EORB   #$01
BCDE: E7 AA       STB    $2,Y
BCE0: 4F          CLRA
BCE1: 6A A1       DEC    $3,Y
BCE3: 10 26 D6 28 LBNE   $B191
BCE7: CE 94 9F    LDU    #$BCB7
BCEA: CC 8E 26    LDD    #$060E
BCED: ED 2C       STD    ,Y
BCEF: 39          RTS

event_table_bd14:
	dc.w	$82da	; $bd14
	dc.w	$8327	; $bd16
	dc.w	$8344	; $bd18
	dc.w	$843f	; $bd1a
	dc.w	$85e2	; $bd1c
	dc.w	$8602	; $bd1e

table_c1be:
	dc.w	$86b3	; $c1be
	dc.w	$86d4	; $c1c0
	dc.w	$86e3	; $c1c2
	dc.w	$86e9	; $c1c4
	dc.w	$871e	; $c1c6
	dc.w	$8741	; $c1c8
	dc.w	$878e	; $c1ca
	dc.w	highscore_name_entry_87a4	; $c1cc	highscore
	dc.w	$87dd	; $c1ce
table_c244:
	dc.w	$8c00	; $c244
	dc.w	$8d0d	; $c246
	dc.w	$8e05	; $c248
	dc.w	$82da	; $c24a
table_c24c:
	dc.w	$8c08	; $c24c
	dc.w	$8c1c	; $c24e
	dc.w	$8c08	; $c250
	dc.w	$8c92	; $c252
	dc.w	$8c08	; $c254
	dc.w	$8ca7	; $c256
	dc.w	$8c08	; $c258
table_c3f6:
	dc.w	$8d28	; $c3f6
	dc.w	$8d2d	; $c3f8
	dc.w	$8d5b	; $c3fa
	dc.w	$8d72	; $c3fc
	dc.w	$8d7b	; $c3fe
table_c400:
	dc.w	$8e0d	; $c400
	dc.w	$8e13	; $c402
	dc.w	$8e3d	; $c404
	dc.w	$8f29	; $c406
	dc.w	$8f59	; $c408
	dc.w	$8e10	; $c40a
	dc.w	$8f77	; $c40c
	dc.w	$8fea	; $c40e
	dc.w	$8ff6	; $c410
table_c412:
	dc.w	$8e45	; $c412
	dc.w	$8e59	; $c414
	dc.w	$8e73	; $c416
	dc.w	$8e8a	; $c418
	dc.w	$8ea0	; $c41a
	dc.w	$8e50	; $c41c
	dc.w	$8e50	; $c41e
	dc.w	$8e50	; $c420
	dc.w	$8e50	; $c422
	dc.w	$8e50	; $c424
	dc.w	$8929	; $c426
table_c428:
	dc.w	$902d	; $c428
	dc.w	$9081	; $c42a
	dc.w	$908d	; $c42c
	dc.w	$9090	; $c42e
	dc.w	$90b1	; $c430
table_e7ac:
	dc.w	$9323	; $e7ac
	dc.w	$930f	; $e7ae
	dc.w	$9327	; $e7b0
	dc.w	$980c	; $e7b2
	dc.w	$980c	; $e7b4
	dc.w	$97da	; $e7b6
table_e67b:
	dc.w	$9794	; $e67b
	dc.w	$97b1	; $e67d
	dc.w	$97ba	; $e67f
	dc.w	$97a7	; $e681
table_e7b2:
	dc.w	$980c	; $e7b2
	dc.w	$980c	; $e7b4
	dc.w	$97da	; $e7b6
table_e832:
	dc.w	$9bb4	; $e832
	dc.w	$9bbd	; $e834
	dc.w	$9bb4	; $e836
	dc.w	$9bbd	; $e838

table_e9b2:
	dc.w	$a08d	; $e9b2
	dc.w	$a02c	; $e9b4
	dc.w	$a08d	; $e9b6
	dc.w	$a08d	; $e9b8
	dc.w	$a089	; $e9ba
	dc.w	$a075	; $e9bc
	dc.w	$a08d	; $e9be
	dc.w	$a093	; $e9c0
	dc.w	$a093	; $e9c2
	dc.w	$a071	; $e9c4
	dc.w	$a06d	; $e9c6
	dc.w	$a08d	; $e9c8
	dc.w	$a062	; $e9ca
	dc.w	$a062	; $e9cc
	dc.w	$a05d	; $e9ce
	dc.w	$a05d	; $e9d0
	dc.w	$a049	; $e9d2
	dc.w	$a049	; $e9d4
	dc.w	$a0a0	; $e9d6
	dc.w	$a0a0	; $e9d8
	dc.w	$a0a3	; $e9da
	dc.w	$a086	; $e9dc
	dc.w	$a081	; $e9de
	dc.w	$a030	; $e9e0
	dc.w	$a058	; $e9e2
	dc.w	$a058	; $e9e4
	dc.w	$a058	; $e9e6
	dc.w	$a01e	; $e9e8
	dc.w	$a01e	; $e9ea
	dc.w	$a01e	; $e9ec
	dc.w	$a01e	; $e9ee
	dc.w	$a011	; $e9f0
table_eb98:
	dc.w	$a298	; $eb98
	dc.w	$a29e	; $eb9a
	dc.w	$a2a4	; $eb9c
	dc.w	$a29c	; $eb9e
table_eba0:
	dc.w	$a522	; $eba0
	dc.w	$a54e	; $eba2
	dc.w	$a58d	; $eba4

table_ebe5:
	dc.w	$a811	; $ebe5
	dc.w	$a811	; $ebe7
	dc.w	$a949	; $ebe9
	dc.w	$a852	; $ebeb
	dc.w	$a811	; $ebed
	dc.w	$a9af	; $ebef
	dc.w	$aa47	; $ebf1
	dc.w	$aaee	; $ebf3
	dc.w	$a9af	; $ebf5
	dc.w	$aaee	; $ebf7
	dc.w	$a930	; $ebf9
	dc.w	$a930	; $ebfb
	dc.w	$aae5	; $ebfd
	dc.w	$aad5	; $ebff
	dc.w	$a842	; $ec01
	dc.w	$ab0d	; $ec03
	dc.w	$aa47	; $ec05
	dc.w	$ab12	; $ec07
	dc.w	$aa5c	; $ec09
	dc.w	$a94f	; $ec0b
	dc.w	$a94f	; $ec0d
	dc.w	$a94f	; $ec0f
	dc.w	$a8fc	; $ec11
	dc.w	$a8f1	; $ec13
	dc.w	$ab21	; $ec15
	dc.w	$abda	; $ec17
	dc.w	$a922	; $ec19
	dc.w	$a909	; $ec1b
	dc.w	$a922	; $ec1d
	dc.w	$a909	; $ec1f
	dc.w	$abfb	; $ec21
	dc.w	$a7e6	; $ec23
	dc.w	$a94f	; $ec25
	dc.w	$a9f1	; $ec27
	dc.w	$a9fe	; $ec29
	dc.w	$aa0c	; $ec2b
	dc.w	$aa1c	; $ec2d
	dc.w	$aa2a	; $ec2f
table_ec31:
	dc.w	$aa83	; $ec31
	dc.w	$aa92	; $ec33
	dc.w	$aaa3	; $ec35
	dc.w	$aab3	; $ec37
	dc.w	$aac3	; $ec39
table_ec3b:
	dc.w	$ab97	; $ec3b
	dc.w	$ab58	; $ec3d
	dc.w	$ab6d	; $ec3f
	dc.w	$ab79	; $ec41
	dc.w	$ab84	; $ec43
	dc.w	$ab98	; $ec45
	dc.w	$abad	; $ec47
	dc.w	$abb9	; $ec49
	dc.w	$abca	; $ec4b

table_ec5d:
	dc.w	$accd	; $ec5d
	dc.w	$ac47	; $ec5f
	dc.w	$ac5a	; $ec61
	dc.w	$ac6b	; $ec63
	dc.w	$ac7b	; $ec65
	dc.w	$ac8b	; $ec67
	dc.w	$ac9c	; $ec69
	dc.w	$acab	; $ec6b
	dc.w	$acbc	; $ec6d
	dc.w	$acdf	; $ec6f
	dc.w	$acf1	; $ec71
	dc.w	$ad07	; $ec73
table_ec75:
	dc.w	$ad37	; $ec75
	dc.w	$ad3c	; $ec77
	dc.w	$ad41	; $ec79
	dc.w	$ad45	; $ec7b
table_f955:
	dc.w	$b0fe	; $f955
	dc.w	$b0fe	; $f957
	dc.w	$b0fe	; $f959
	dc.w	$b125	; $f95b
	dc.w	$b0fe	; $f95d
	dc.w	$b0fe	; $f95f
	dc.w	$b141	; $f961
	dc.w	$b141	; $f963
	dc.w	$b0fe	; $f965
	dc.w	$b0fe	; $f967
	dc.w	$b0fe	; $f969
	dc.w	$b0fe	; $f96b
	dc.w	$b0fe	; $f96d
	dc.w	$b0fe	; $f96f
	dc.w	$b0fe	; $f971
	dc.w	$b0fe	; $f973
	dc.w	$b0fe	; $f975
	dc.w	$b0fe	; $f977
	dc.w	$b0fe	; $f979
	dc.w	$b0fe	; $f97b
	dc.w	$b135	; $f97d
	dc.w	$b0fe	; $f97f
	dc.w	$b0fe	; $f981
	dc.w	$b0fe	; $f983
	dc.w	$b0fe	; $f985

table_fd25:
	dc.w	$b299	; $fd25
	dc.w	$b2ac	; $fd27
	dc.w	$b2b3	; $fd29
	dc.w	$b2b9	; $fd2b
	dc.w	$b2bd	; $fd2d
	dc.w	$b2c1	; $fd2f
	dc.w	$b2b1	; $fd31
	dc.w	$b24c	; $fd33
