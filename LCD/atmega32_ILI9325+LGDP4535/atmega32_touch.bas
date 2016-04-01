$regfile = "m32def.dat"
$crystal = 16000000
$hwstack = 250
$swstack = 250
$framesize = 500




'$regfile = "usb1286.dat"
'$crystal = 8000000
'$hwstack = 64
'$swstack = 64
'$framesize = 64

Enable Urxc
'--------------------------- Pin Configuration ---------------------------------
Config Porta = Output : Data_disp_low Alias Porta           'DB0 - DB7
Config Portc = Output : Data_disp_high Alias Portc          'DB8 - DB15
'Data_disp Alias Porta : Config Data_disp = Output           'Data Port
Rs_disp Alias Portb.0 : Config Rs_disp = Output             'Command/Data pin
Wr_disp Alias Portb.2 : Config Wr_disp = Output             'Write pin

Cs_disp Alias Portb.1 : Config Cs_disp = Output             'Chip Select
Cs_disp = 0

Res_disp Alias Portd.7 : Config Res_disp = Output           'Reset pin
Res_disp = 1

'-------------------------------- Library --------------------------------------
Const Portrait = 0                                          '0=Landscape, 1=Portrait
Const Rotate180 = 0                                         '0=Normal, 1=Rotate 180°

Config Submode = New : $include "ILI9325 16bit library.inc" 'Include library
'Config Submode = New : $include "ILI9325 library.inc"       'Include library
'Config Submode = New : $include "S6D1121 16bit library.inc"  'Include library

'------------------------------- TouchScreen -----------------------------------
Clk_touch Alias Portb.3 : Config Clk_touch = Output         'XPT2046 Clock Pin
Cs_touch Alias Portd.6 : Config Cs_touch = Output           'XPT2046 CS Pin
Dout_touch Alias Portd.5 : Config Dout_touch = Output       'XPT2046 Din Pin
Din_touch Alias Pind.4 : Config Din_touch = Input           'XPT2046 Dout Pin

'---------------------------- Fonts and Pictures -------------------------------
' You need to include Fonts and Pictures below the "End"
'-------------------------------------------------------------------------------
'
' For load Pictures from SPI-ROM you must configure SPI:

Config Spi = Hard , Interrupt = Off , Data Order = Msb , Master = Yes , Polarity = High , Phase = 1 , Clockrate = 4 , Noss = 1
Spsr.0 = 1 : Spcr.0 = 0 : Spcr.1 = 0                        'F_spi = F_osc / 2
Ss_spi_rom Alias Portb.4 : Config Ss_spi_rom = Output : Ss_spi_rom = 1       'Chip Select pin
Spiinit

Cs_touch = 0

'Config Pind.3 = Input : Portd.3 = 1                         'Pen Interrupt
'Config Int1 = Falling
'On Int1 Touch_int
'Enable Int1


'Portb.4 = 1
Config Portd.2 = Output :
Led Alias Portd.2
Led = 1


Dim Count As Word , N As Word , M As Word , B As Byte
Dim Touch_flag As Byte
Dim Touch_flag2 As Bit
Dim Touchx As Word , Touchy As Word
Dim X_dout As Byte : X_dout = 208
Dim Y_dout As Byte : Y_dout = 144
'Declare Sub Touchpad
'Declare Sub Prog
'Declare Sub Touch_test

'$include "Touch.inc"                                        'Include touchscreen library
'================================ Test Program =================================

'Dim Text As String * 8
'Enable Interrupts

Display_init                                                ' Initialize Display
Lcd_clear White
'Restore Font12x16
Wait 1
'Lcd_text "240x320 LCD" , 23 , 50 , Darkgreen , White
'Print "Start test"


'Sub Touchpad
'Touch_flag = 0
'Gifr = 64
   Lcd_clear Blue
'   Read_touch
'   Text = Str(touchx) + "   "
'   Text = "Privet"
'   Lcd_text Text , 256 , 122 , Black , White
'   Print "Y=" ; Text
'   Text = Str(touchy) + "   "
'   Print "Test LCD ILI9325"
'   Lcd_text Text , 150 , 10 , Black , White
'   Lcd_fill_circle Touchy , Touchx , 5 , Black
'   Print "X=" ; Text
'    Waitms 200
'   Restore Font12x16


'  Exit Sub
'  End Sub


Do
Display_init
Lcd_clear Green1
Wait 1

Lcd_clear White
Wait 1
Lcd_clear Blue
Wait 1
Lcd_clear Red
Wait 1
'Lcd_set_pixel 10 , 50 , Black

'Lcd_text "240x320 LCD" , 50 , 50 , Darkgreen , Red
'Wait 1
'Lcd_clear White                                             '****** Line
'Lcd_text "Line" , 110 , 10 , Blue , White
'For Count = 1 To 4
'   For N = 100 To 220 Step 4
'      Lcd_line 160 , 220 , N , 80 , Black
'      Lcd_line 160 , 220 , N , 80 , White
'   Next N
'   For N = 219 To 101 Step - 4
'      Lcd_line 160 , 220 , N , 80 , Black
'      Lcd_line 160 , 220 , N , 80 , White
'   Next N
'Next Count
'
'Wait 1
'Restore Font12x16
'Lcd_clear Green1
'Lcd_text "Kotenok lubimaya" , 10 , 50 , Red , Green1
'Lcd_text "Ya tebya lublu!!!" , 10 , 80 , Red , Green1
'Lcd_text "Tvoy kotik." , 10 , 110 , Red , Green1
'Wait 2




'Lcd_clear Black
'Lcd_text "Pixels" , 70 , 10 , White , Black                 '****** Set Pixel
'Waitms 500
'For Count = 10 To 310 Step 32
'   For N = 50 To 230 Step 32
'      Lcd_set_pixel Count , N , White
'   Next N
'Next Count
'Waitms 500
'For Count = 26 To 310 Step 16
'   For N = 66 To 230 Step 16
'      Lcd_set_pixel Count , N , White
'   Next N
'Next Count
'Waitms 500
'For Count = 18 To 310 Step 8
'   For N = 58 To 230 Step 8
'      Lcd_set_pixel Count , N , White
'   Next N
'Next Count
'Waitms 500
'For Count = 14 To 310 Step 4
'   For N = 54 To 230 Step 4
'      Lcd_set_pixel Count , N , White
'   Next N
'Next Count
'Wait 2




'Loop

'End

Display_init                                                ' Initialize Display
'Lcd_clear White
'Restore Font12x16
'Restore Font25x32

'Lcd_clear White
'   Lcd_text "Тест!" , 20 , 50 , Red , White
'   Wait 3
'Restore Font12x16
'   Lcd_fill_circle 160 , 120 , 5 , Red
'   Lcd_text "Очистить" , 155 , 140 , Red , White
'   Lcd_circle 160 , 120 , 20 , Red
'   Wait 3
'   Lcd_clear White
'Restore Font25x32
'Lcd_text "LCD 2.4'" , 23 , 50 , Darkgreen , White
'Restore Font36x56 :
'Digit_font = 1
'Restore Font25x32
'For Count = 0 To 10
'   Text = Str(count)
'   Lcd_text Text , 80 , 110 , Blue , White
'   Wait 1
'Next Count
'Digit_font = 0
'Restore Font12x16
'Lcd_clear White
'   Lcd_fill_circle 160 , 120 , 5 , Red
'   Lcd_text "Очистить" , 155 , 140 , Red , White
'   Lcd_circle 160 , 120 , 20 , Red
'Restore Font12x16
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'Lcd_clear Blue
'Restore Button4
'Lcd_pic_sram 40 , 5 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 50 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 95 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 140 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 185 , 120 , 40
'Do

'If Touch_flag2 = 0 Then
'Restore Button4
'Lcd_pic_sram 40 , 5 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 50 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 95 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 140 , 120 , 40
'Restore Button4

'Lcd_pic_sram 40 , 185 , 120 , 40
'Touch_flag2 = 1
'Touch_flag = 0
'End If
'Lcd_box 20 , 20 , 140 , 140 , Red
'Wait 2
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'Restore Akb
'Lcd_pic_sram 80 , 80 , 25 , 25
'Restore Font12x16
'Lcd_text "Аккумулятор" , 110 , 85 , Red , Blue



'Restore Font12x16
'Lcd_text "Кнопка1" , 100 , 125 , Black , Green1
'Wait 3

'Lcd_fill_box 240 , 10 , 310 , 80 , Green
'Wait 2

'Lcd_fill_box 10 , 160 , 80 , 230 , Green1
'Wait 2

'Lcd_fill_box 240 , 160 , 310 , 230 , Greenyellow
'Wait 2
'Lcd_text "Очистить" , 155 , 140 , Red , White
'Lcd_circle 160 , 120 , 20 , Red

'Lcd_clear White
'Lcd_fill_box 0 , 80 , 320 , 160 , Blue
'Lcd_fill_box 0 , 160 , 320 , 240 , Red
'Wait 4

'Lcd_clear White                                             '****** Line
'Lcd_text "Линия" , 110 , 10 , Green1 , White
'For Count = 1 To 4
'   For N = 100 To 220 Step 4
'      Lcd_line 160 , 220 , N , 80 , Black
'      Lcd_line 160 , 220 , N , 80 , White
'   Next N
'   For N = 219 To 101 Step - 4
'      Lcd_line 160 , 220 , N , 80 , Black
'      Lcd_line 160 , 220 , N , 80 , White
'   Next N
'Next Count


Lcd_clear White
Wait 1
Lcd_pic_spi 0 , 0 , 320 , 240 , 0
Wait 1

Lcd_pic_spi 0 , 0 , 320 , 240 , 153600
Wait 1
Lcd_pic_spi 0 , 0 , 320 , 240 , 307200
Wait 1
Lcd_pic_spi 0 , 0 , 320 , 240 , 460800
Wait 1
Lcd_pic_spi 0 , 0 , 320 , 240 , 614400
Wait 1
Lcd_pic_spi 0 , 0 , 320 , 240 , 768000
Wait 1
Lcd_pic_spi 0 , 0 , 320 , 240 , 921600
Wait 1
Lcd_pic_spi 40 , 50 , 120 , 40 , 1075200
Wait 1
Lcd_pic_spi 40 , 95 , 120 , 40 , 1084800
Wait 1

Loop
'End
                                                         'end program
'-------------------------------------------------------------------------------
'$include "color8x8.font"
'$include "Font12x16.font"
'$include "Font25x32.font"
'$inc Akb , Nosize , "Akb.bin"
'$inc Akb , Nosize , "Akb2.bin"
'$inc Button1 , Nosize , "button1.bin"'25x120
'$inc Button2 , Nosize , "button2.bin"'25x120
'$inc Button3 , Nosize , "button3.bin"                       '40x120
'$inc Button4 , Nosize , "button4.bin"                       '40x120
'---------------- Touch Interrupt
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'Touch_int:
'Read_touch
' Touchx = 320 - Touchx
' Touch_flag2 = 1
' Restore Color8x8
'     Text = "X=" + Str(touchx) + "   "
'   Lcd_text_color Text , 190 , 0 , Black , Blue
'   Text = "Y=" + Str(touchy) + "   "
'   Lcd_text_color Text , 190 , 20 , Black , Blue
   'Lcd_fill_circle Touchx , Touchy , 5 , Black
   'Lcd_fill_circle Touchy , Touchx , 5 , Black
'Touch_test
'Waitms 400

'    Print "Toychpad"
'    Touchpad
'Gifr = 128

'Return


'Sub Touch_test
   'Text = "X=" + Str(touchx) + "   "
   'Lcd_text Text , 0 , 0 , Black , White
   'Text = "Y=" + Str(touchy) + "   "
    'Touchy = 320 - Touchy
   'Lcd_text Text , 0 , 20 , Black , White
   'If Touchx > 40 And Touchx < 160 Then
    '   If Touchy > 5 And Touchy < 30 Then
     '  Restore Button2
      ' Lcd_pic_sram 40 , 5 , 120 , 25
      'Lcd_clear White
   'Lcd_fill_circle 160 , 120 , 5 , Red
   'Lcd_text "Очистить" , 155 , 140 , Red , White
   'Lcd_circle 160 , 120 , 20 , Red

 '      End If
  '   End If
 ' Do

'    If Touch_flag2 = 1 Then
'
'        If Touchx > 40 And Touchx < 160 Then
'       If Touchy > 5 And Touchy < 45 Then

 '      Restore Button3
  '     Lcd_pic_sram 40 , 5 , 120 , 40
 '      Touch_flag = 1


  '     Restore Button4
   '    Lcd_pic_sram 40 , 50 , 120 , 40
 '


   '    Restore Button4
    '   Lcd_pic_sram 40 , 95 , 120 , 40



    '   Restore Button4
    '   Lcd_pic_sram 40 , 140 , 120 , 40



     '  Restore Button4
     '  Lcd_pic_sram 40 , 185 , 120 , 40




     '  End If
    ' End If
   '          If Touchx > 40 And Touchx < 160 Then
   '    If Touchy > 50 And Touchy < 90 Then

   '    Restore Button3
'       Lcd_pic_sram 40 , 50 , 120 , 40
'       Touch_flag = 2


'       Restore Button4
'       Lcd_pic_sram 40 , 5 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 95 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 140 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 185 , 120 , 40




'       End If
'     End If
'             If Touchx > 40 And Touchx < 160 Then
'       If Touchy > 95 And Touchy < 135 Then

'       Restore Button3
'       Lcd_pic_sram 40 , 95 , 120 , 40
'       Touch_flag = 3


'       Restore Button4
'       Lcd_pic_sram 40 , 5 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 50 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 140 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 185 , 120 , 40




'       End If
'     End If
'             If Touchx > 40 And Touchx < 160 Then
'       If Touchy > 140 And Touchy < 180 Then

'       Restore Button3
'       Lcd_pic_sram 40 , 140 , 120 , 40
'       Touch_flag = 4


'       Restore Button4
'       Lcd_pic_sram 40 , 5 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 50 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 95 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 185 , 120 , 40




'       End If
'     End If
'             If Touchx > 40 And Touchx < 160 Then
'       If Touchy > 185 And Touchy < 225 Then

'       Restore Button3
'       Lcd_pic_sram 40 , 185 , 120 , 40
'       Touch_flag = 5


'       Restore Button4
'       Lcd_pic_sram 40 , 5 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 50 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 95 , 120 , 40



'       Restore Button4
'       Lcd_pic_sram 40 , 140 , 120 , 40




'       End If
'     End If

'      Touch_flag2 = 0
'      Read_touch
'     Touchx = 320 - Touchx
'     End If


     'Waitms 400
'      Read_touch
'     Touchx = 320 - Touchx
'     If Touchx > 315 And Touchx = 320 Then
'       If Touchy = 0 And Touchy < 6 Then



'       Exit Do
'       End If
'  Else
 ' Waitms 400
'   Read_touch
'     Touchx = 320 - Touchx
'     Touch_flag2 = 1
'     Restore Color8x8
'     Text = "X=" + Str(touchx) + "   "
'   Lcd_text_color Text , 190 , 0 , Black , Blue
'   Text = "Y=" + Str(touchy) + "   "
'   Lcd_text_color Text , 190 , 20 , Black , Blue

'     End If


'   Loop
   'Lcd_text "Очистить" , 155 , 140 , Red , White
   'Lcd_circle 160 , 120 , 20 , Red


'   Return
'   End Sub