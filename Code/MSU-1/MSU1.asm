LOROM
org $808F27
                       JSR.W $CD90
org $80CD90
                       PHP                                  
                       REP #$30                             
                       PHA                                  
                       PHX                                  
                       PHY                                  
                       PHB                                  
                       SEP #$30                             
                       LDA.B #$80                           
                       PHA                                  
                       PLB                                  
                       LDA.W $2002                          
                       CMP.B #$53                           
                       BNE CODE_80CE0D                      
                       LDA.W $063D                          
                       AND.B #$7F                           
                       BEQ CODE_80CE05                      
                       CMP.B #$04                           
                       BEQ CODE_80CE0D                      
                       CMP.W $064C                          
                       BEQ CODE_80CDFD                      
                       CMP.B #$05                           
                       BMI CODE_80CDDA                      
                       SEC                                  
                       SBC.B #$05                           
                       TAY                                  
                       LDA.W $07F3                          
                       LDX.B #$00                           
                       SEC                                  
                                                            
          CODE_80CDC2: SBC.B #$03                           
                       BCC CODE_80CDC9                      
                       INX                                  
                       BNE CODE_80CDC2                      
                                                            
          CODE_80CDC9: TXA                                  
                       ASL A                                
                       TAX                                  
                       REP #$20                             
                       LDA.L PTR16_80CE18,X                 
                       STA.B $00                            
                       SEP #$20                             
                       LDA.B ($00),Y                        
                       BEQ CODE_80CE0D                      
                                                            
          CODE_80CDDA: TAY                                  
                       STA.W $2004                          
                       STZ.W $2005                          
                                                            
          CODE_80CDE1: LDA.W $2000                          
                       AND.B #$40                           
                       BNE CODE_80CDE1                      
                       LDA.W $2000                          
                       AND.B #$08                           
                       BNE CODE_80CE05                      
                       JSR.W CODE_80CE73                    
                       STA.W $2007                          
                       LDA.B #$FF                           
                       STA.W $2006                          
                       STZ.W $2140                          
                                                            
          CODE_80CDFD: REP #$30                             
                       PLB                                  
                       PLY                                  
                       PLX                                  
                       PLA                                  
                       PLP                                  
                       RTS                                  
                                                            
                                                            
          CODE_80CE05: LDA.W #$8D00                         
                       ORA.B [$20]                          
                       STA.W $2006                          
                                                            
          CODE_80CE0D: REP #$30                             
                       PLB                                  
                       PLY                                  
                       PLX                                  
                       PLA                                  
                       PLP                                  
                       STA.W $2140                          
                       RTS                                  
                                                            
                                                            
         PTR16_80CE18: dw DATA8_80CE4A                      
                       dw DATA8_80CE4C                      
                       dw DATA8_80CE4E                      
                       dw DATA8_80CE51                      
                       dw DATA8_80CE53                      
                       dw DATA8_80CE54                      
                       dw DATA8_80CE55                      
                       dw DATA8_80CE56                      
                       dw DATA8_80CE57                      
                       dw DATA8_80CE58                      
                       dw DATA8_80CE5A                      
                       dw DATA8_80CE5C                      
                                                            
                       dw DATA8_80CE5D                      
                       dw DATA8_80CE60                      
                                                            
                       dw DATA8_80CE62                      
                       dw DATA8_80CE63                      
                       dw DATA8_80CE66                      
                       dw DATA8_80CE68                      
                       dw DATA8_80CE6B                      
                       dw DATA8_80CE6C                      
                                                            
                       dw DATA8_80CE6D                      
                       dw DATA8_80CE6E                      
                       dw DATA8_80CE6F                      
                       dw DATA8_80CE70                      
                       dw DATA8_80CE72                      
                                                            
         DATA8_80CE4A: db $04,$05                           
                                                            
         DATA8_80CE4C: db $04,$05                           
                                                            
         DATA8_80CE4E: db $06,$00,$07                       
                                                            
         DATA8_80CE51: db $08,$09                           
                                                            
         DATA8_80CE53: db $0A                               
                                                            
         DATA8_80CE54: db $0B                               
                                                            
         DATA8_80CE55: db $0C                               
                                                            
         DATA8_80CE56: db $0D                               
                                                            
         DATA8_80CE57: db $0E                               
                                                            
         DATA8_80CE58: db $0F,$10                           
                                                            
         DATA8_80CE5A: db $11,$00                           
                                                            
         DATA8_80CE5C: db $12                               
                                                            
         DATA8_80CE5D: db $13,$15,$14                       
                                                            
         DATA8_80CE60: db $16,$17                           
                                                            
         DATA8_80CE62: db $18                               
                                                            
         DATA8_80CE63: db $00,$19,$00                       
                                                            
         DATA8_80CE66: db $1A,$1B                           
                                                            
         DATA8_80CE68: db $00,$00,$00                       
                                                            
         DATA8_80CE6B: db $1C                               
                                                            
         DATA8_80CE6C: db $1D                               
                                                            
         DATA8_80CE6D: db $1E                               
                                                            
         DATA8_80CE6E: db $00                               
                                                            
         DATA8_80CE6F: db $00                               
                                                            
         DATA8_80CE70: db $16,$17                           
                                                            
         DATA8_80CE72: db $0A                               
                                                            
          CODE_80CE73: CPY.B #$01                           
                       BEQ CODE_80CE86                      
                       CPY.B #$02                           
                       BEQ CODE_80CE86                      
                       CPY.B #$1D                           
                       BEQ CODE_80CE86                      
                       CPY.B #$1E                           
                       BEQ CODE_80CE86                      
                       LDA.B #$03                           
                       RTS                                  
                                                            
                                                            
          CODE_80CE86: LDA.B #$01                           
                       RTS                                  