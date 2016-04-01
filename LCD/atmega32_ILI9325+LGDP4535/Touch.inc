
$nocompile
'===============================================================================
Sub Read_touch()
Touchx = 0 : Touchy = 0 : Clk_touch = 0 : Cs_touch = 0
Shiftout Dout_touch , Clk_touch , X_dout , 1 , 8 , 3        'X request
   Waitms 3
Shiftin Din_touch , Clk_touch , Touchy , 1 , 12 , 3         'X answer
Shiftout Dout_touch , Clk_touch , Y_dout , 1 , 8 , 3        'Y Request
   Waitms 3
Shiftin Din_touch , Clk_touch , Touchx , 1 , 12 , 3         'Y answer
Cs_touch = 1
If Touchy > 3500 Then Touchy = Touchy - 3500 Else Touchy = 0
Touchy = Touchy / 110
If Touchy > 239 Then Touchy = 239
If Touchx > 3500 Then Touchx = Touchx - 3500 Else Touchx = 0
Touchx = Touchx / 83
If Touchx > 319 Then Touchx = 319
Touchx = 319 - touchx
Touch_flag = 0
End Sub