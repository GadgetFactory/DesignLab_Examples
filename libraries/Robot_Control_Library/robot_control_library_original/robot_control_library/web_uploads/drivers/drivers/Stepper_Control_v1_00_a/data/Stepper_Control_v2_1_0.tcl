##############################################################################
##
## ***************************************************************************
## **                                                                       **
## ** Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.            **
## **                                                                       **
## ** You may copy and modify these files for your own internal use solely  **
## ** with Xilinx programmable logic devices and Xilinx EDK system or       **
## ** create IP modules solely for Xilinx programmable logic devices and    **
## ** Xilinx EDK system. No rights are granted to distribute any files      **
## ** unless they are distributed in Xilinx programmable logic devices.     **
## **                                                                       **
## ***************************************************************************
##
##############################################################################
## Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\Stepper_Control_v1_00_a\data\Stepper_Control_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Tue Sep 20 08:23:35 2005 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "Stepper_Control" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" "C_SDC_RESOLUTION" "C_SDC_STEP_COUNT" "C_SDC_TYPE" "C_SDC_INST"
}
