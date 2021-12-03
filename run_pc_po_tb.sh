ghdl -a ./src/vhdl/pc_po_tb.vhdl
ghdl -e pc_po_tb
ghdl -r pc_po_tb --wave=./waves/pc_po_tb.ghw
gtkwave ./waves/pc_po_tb.ghw


