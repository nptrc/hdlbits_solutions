IVERILOG := iverilog
VVP      := vvp
GTKWAVE  := gtkwave
YOSYS    := yosys

DIR ?= .

SRC := $(filter-out $(DIR)/tb.v,$(wildcard $(DIR)/*.v))
TB  := $(DIR)/tb.v
OUT := $(DIR)/sim

.PHONY: run wave schematic clean

run:
	@$(IVERILOG) -g2012 -o $(OUT) $(SRC) $(TB)
	@$(VVP) $(OUT)

wave: run
	@nohup $(GTKWAVE) $(DIR)/dump.vcd >/dev/null 2>&1 &

schematic:
	@cd $(DIR) && \
	$(YOSYS) -p "read_verilog top_module.v; hierarchy -top top_module; proc; opt; show"

clean:
	@rm -f $(OUT) $(DIR)/dump.vcd
