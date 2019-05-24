#!/bin/bash

verilator -Wall -Wno-fatal --cc Comp.v --exe TestComp.cpp
make -C obj_dir/ -f VComp.mk