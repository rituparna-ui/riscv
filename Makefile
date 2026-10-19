MOD ?= adder32
RTL = $(wildcard rtl/*.v rtl/*/*.v)
TB = $(firstword $(wildcard tb/tb_$(MOD).v tb/*/*/tb_$(MOD).v tb/*/tb_$(MOD).v))

.PHONY: run lint clean
run:
	verilator --binary -Wall --top-module tb_$(MOD) $(RTL) $(TB) -o sim_$(MOD)
	./obj_dir/sim_$(MOD)

lint:
	verilator --lint-only -Wall $(firstword $(wildcard rtl/$(MOD).v rtl/*/*.v))

clean:
	rm -rf obj_dir sim_* *.vcd
