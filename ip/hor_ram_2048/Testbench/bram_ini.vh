
function [255:0] bram_ini_table;
input integer index;//Mode type 
input integer val_; //Port A index, Port B Index, Number of Items in Loop, Port A Start, Port B Start, reserved 
case (index)
   0: bram_ini_table=
(val_== 0)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 1)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 2)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 3)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 4)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 5)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 6)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 7)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 8)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 9)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==10)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==11)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==12)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==13)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==14)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==15)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==16)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==17)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==18)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==19)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==20)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==21)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==22)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==23)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==24)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==25)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==26)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==27)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==28)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==29)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==30)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==31)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==32)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==33)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==34)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==35)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==36)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==37)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==38)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==39)?256'h0000000000000000000000000000000000000000000000000000000000000000:
0;
   1: bram_ini_table=
(val_== 0)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 1)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 2)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 3)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 4)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 5)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 6)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 7)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 8)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_== 9)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==10)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==11)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==12)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==13)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==14)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==15)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==16)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==17)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==18)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==19)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==20)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==21)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==22)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==23)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==24)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==25)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==26)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==27)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==28)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==29)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==30)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==31)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==32)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==33)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==34)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==35)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==36)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==37)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==38)?256'h0000000000000000000000000000000000000000000000000000000000000000:
(val_==39)?256'h0000000000000000000000000000000000000000000000000000000000000000:
0;
   endcase
endfunction  
