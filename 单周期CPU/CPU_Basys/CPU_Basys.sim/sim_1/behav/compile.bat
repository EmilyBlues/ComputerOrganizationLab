@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;I:/vivado_setup/Vivado/2014.2/ids_lite/ISE/bin/nt64;I:/vivado_setup/Vivado/2014.2/ids_lite/ISE/lib/nt64;I:/vivado_setup/Vivado/2014.2/bin;%PATH%
set XILINX_PLANAHEAD=I:/vivado_setup/Vivado/2014.2

xelab -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot SingleCPU_behav --prj D:/Vivado_Project/CPU_Basys/CPU_Basys.sim/sim_1/behav/SingleCPU.prj   xil_defaultlib.SingleCPU   xil_defaultlib.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
