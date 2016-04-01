                             '*******************************************************************************
'
'                            ILI9325 LCD Test
'
'                            resolution 240x320
'
'*******************************************************************************
$regfile = "m32def.dat"
$crystal = 16000000
$hwstack = 250
$swstack = 250
$framesize = 500



Mcucr.7 = 1                                                 'Turn OFF JTAG
Mcucr.7 = 1
Mcucr.7 = 1

 Enable Interrupts

'------------------------ Display Pin Configuration ----------------------------
'Data_disp Alias Portc : Config Data_disp = Output           'Data Port
Config Portc = Output : Data_disp_high Alias Portc          'DB8 - DB15
Config Porta = Output : Data_disp_low Alias Porta           'DB0 - DB7
'Data_disp Alias Porta : Config Data_disp = Output           'Data Port
Rs_disp Alias Portb.0 : Config Rs_disp = Output             'Command/Data pin
Wr_disp Alias Portb.2 : Config Wr_disp = Output             'Write pin

Cs_disp Alias Portb.1 : Config Cs_disp = Output             'Chip Select
Cs_disp = 0

Res_disp Alias Portd.7 : Config Res_disp = Output           'Reset pin
Res_disp = 1

'-------------------------------- Library --------------------------------------
Const Portrait = 1                                          '0=Landscape, 1=Portrait
Const Rotate180 = 1                                         '0=Normal, 1=Rotate 180°

Config Submode = New : $include "LGDP4535 16bit library.inc"       'Include library
'Config Submode = New : $include "ILI9325 library.inc"       'Include library
'Config Submode = New : $include "ILI9325 16bit library.inc" 'Include library
'Config Submode = New : $include "ILI9325 library.inc"       'Include library
'Config Submode = New : $include "S6D1121 8bit library.inc"  'Include library

'---------------------------- Fonts and Pictures -------------------------------
' You need to include Fonts and Pictures below the "End"
'-------------------------------------------------------------------------------
'
' For load Pictures from SPI-ROM you must configure SPI:

 Portb.4 = 1


'================================ Test Program =================================

Config Portd.2 = Output :
Led Alias Portd.2
Led = 1


Dim Count As Word , N As Word , M As Word , B As Byte
Dim Touch_flag As Bit
Dim Touchx As Word , Touchy As Word
Dim X_dout As Byte : X_dout = 208
Dim Y_dout As Byte : Y_dout = 144
Declare Sub Touchpad
                                       'Include touchscreen library
'================================ Test Program =================================

Dim Text As String * 6
Enable Interrupts

Display_init                                                ' Initialize Display
Lcd_clear Green
Restore Font12x16
Wait 1
Lcd_text "240x320 LCD " , 25 , 50 , Black , Green
Print "Start test"
Wait 1


Do
Lcd_clear Green1
Lcd_text "240x320 LCD " , 25 , 50 , Black , Green1
Wait 1

Lcd_clear Black
Lcd_text "240x320 LCD " , 25 , 50 , White , Black
Wait 1
Lcd_clear Blue
Lcd_text "240x320 LCD " , 25 , 50 , White , Blue
Wait 1
Lcd_clear Red
'Lcd_text "240x320 LCD to LGPD4535" , 1 , 50 , Black , Red

Lcd_set_pixel 120 , 160 , Black
Lcd_text "240x320 LCD " , 25 , 50 , Black , Red

Wait 1
Restore Font12x16
 Wait 1
Lcd_clear White
Restore Font12x16
Lcd_text "Игры разума продакшн" , 1 , 25 , Purple , White   '****** Text
'Restore Font25x32
Lcd_text "240x320 LCD " , 25 , 50 , Black , White
Restore Font36x56 : Digit_font = 1
For Count = 20 To 30
   Text = Str(count)
   Lcd_text Text , 70 , 110 , Blue , White
   Wait 1
Next Count
Digit_font = 0

Restore Font12x16
'Restore Font25x32
Lcd_text "Негатив " , 60 , 180 , Black , White              '****** Negative
Lcd_negative 1
Restore Font36x56 : Digit_font = 1
For Count = 31 To 40
 Text = Str(count)
 Lcd_text Text , 70 , 110 , Blue , White
 Wait 1
Next Count
Digit_font = 0
Restore Font12x16
Lcd_text "Позитив " , 60 , 180 , Black , White              '****** Negative
Lcd_negative 0


Wait 2
Lcd_clear Black
Lcd_text "Пиксили" , 70 , 10 , White , Black                '****** Set Pixel
Waitms 500
For Count = 10 To 310 Step 32
   For N = 20 To 230 Step 32
      Lcd_set_pixel Count , N , White
   Next N
Next Count
Waitms 500
For Count = 26 To 310 Step 16
   For N = 66 To 230 Step 16
      Lcd_set_pixel Count , N , White
   Next N
Next Count
Waitms 500
For Count = 18 To 310 Step 8
   For N = 58 To 230 Step 8
      Lcd_set_pixel Count , N , White
   Next N
Next Count
Waitms 500
For Count = 14 To 310 Step 4
   For N = 54 To 230 Step 4
      Lcd_set_pixel Count , N , White
   Next N
Next Count
Wait 2


Lcd_clear White                                             '****** Line
Lcd_text "Линия" , 70 , 10 , Green1 , White
For Count = 1 To 4
   For N = 60 To 180 Step 4
      Lcd_line 120 , 220 , N , 80 , Black
      Lcd_line 120 , 220 , N , 80 , White
   Next N
   For N = 179 To 61 Step - 4
      Lcd_line 120 , 220 , N , 80 , Black
      Lcd_line 120 , 220 , N , 80 , White
   Next N
Next Count

Loop

End                                                         'end program
'-------------------------------------------------------------------------------
$include "Font12x16.font"
$include "Font36x56.font"
'---------------- Touch Interrupt