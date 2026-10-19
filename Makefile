MOD ?= half_adder
RTL = $(wildcard rtl/*.v)
TB = tb/tb_$(MOD).v

.PHONY: run lint clean
run:
	verilator --binary -Wall --top-module tb_$(MOD) $(RTL) $(TB) -o sim_$(MOD)
	./obj_dir/sim_$(MOD)

lint:
	verilator --lint-only -Wall rtl/$(MOD).v

clean:
	rm -rf obj_dir sim_* *.vcd
