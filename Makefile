IVERILOG := iverilog
VVP      := vvp
GTKWAVE  := gtkwave

DIR ?= .

SRC := $(filter-out $(DIR)/tb.v,$(wildcard $(DIR)/*.v))
TB  := $(DIR)/tb.v
OUT := $(DIR)/sim

.PHONY: run wave schematic clean

run:
	@$(IVERILOG) -g2012 -o $(OUT) $(SRC) $(TB)
	@cd $(DIR) && $(VVP) sim

wave: run
	@nohup $(GTKWAVE) $(DIR)/dump.vcd >/dev/null 2>&1 &

clean:
	@rm -f $(OUT) $(DIR)/dump.vcd
