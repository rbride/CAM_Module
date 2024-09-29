# make sim      <- creates a executable to run the simulated hardware using verilator and drops
#			       it in the main directory under the name simv 

TESTBENCH = sys_defs.svh		\
			test.sv			\

SYTHN_SRC = cam.sv			\

OBJ_DIR = obj_dir


VERILATOR = verilator -sv --cc --exe --trace --trace-structs --build --timing --main \
			 --Wno-"WIDTHEXPAND" --Wno-"CASEINCOMPLETE" --Wno-WIDTHTRUNC


#Rule to build the verilated module and compile the C++ test
sim: $(SYTHN_SRC)  $(TESTBENCH) 
	$(VERILATOR) $(SYTHN_SRC) $(TESTBENCH) 
	mv $(OBJ_DIR)/Vcam ./simv 

clean:
	rm -rf $(OBJ_DIR) $(OUTPUT) 
	rm -rf simv
#	rm -rf *.out   IDK maybe not needed 