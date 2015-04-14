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
## Filename:          C:\local\Jimmy\mk3\microblaze\spartan3\drivers\OPB_PWM_v1_00_a\data\OPB_PWM_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Tue Sep 20 14:41:27 2005 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "OPB_PWM" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" "C_PWM_INST" "C_PWM_WIDTH" "C_PWM_FREQ_DIV" 
}
