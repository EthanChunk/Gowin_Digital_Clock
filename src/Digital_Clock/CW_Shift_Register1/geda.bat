

set iverilog_path=C:\iverilog\bin;
set gtkwave_path=C:\iverilog\gtkwave\bin;
set path=%iverilog_path%%gtkwave_path%%path%

set source_module=%1
set testbentch_module=%1_TB


iverilog -o "%testbentch_module%.vvp"  ./lib/*.v %testbentch_module%.v %source_module%.v
vvp -n "%testbentch_module%.vvp"

set gtkw_file="%testbentch_module%.gtkw"
if exist %gtkw_file% (gtkwave %gtkw_file%) else (gtkwave "%testbentch_module%.vcd")

pause