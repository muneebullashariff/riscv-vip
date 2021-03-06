// ############################################################################
//
// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//
// ############################################################################ 

`ifndef _RISCV_VIP_REGFILE_IF_INCLUDED_
`define _RISCV_VIP_REGFILE_IF_INCLUDED_

import riscv_vip_pkg::*;

//-----------------------------------------------------------------------------
// Interface: riscv_vip_regfile_if
// This is a white box interface into the values of the register file.  Making this
// more transactional to use a rd/wr type memory i/f was considered but
// different risc-v implementations may do it differently. Some may not even use
// a regifile but simply use flip flops. The most flexible and simplist route for 
// now is to go with the raw values of the register values. At some point there
// may be a need for a strobe or something to know when a given register is 
// read or written.
//
// Parameters:
//  clk - Input clock
//  rstn - Input reset
//-----------------------------------------------------------------------------
interface riscv_vip_regfile_if (input clk, input rstn);

  //NOTE regfile is 1-31 and index 0 is not included since it's always zero
  riscv_vip_pkg::x_regfile_array_t x;
  
  //-------------------------------------------------------
  // Clocking block
  //-------------------------------------------------------
  clocking mon_cb @(posedge clk);
      default input #1;
      
      input   x;
  endclocking: mon_cb
  
  //-------------------------------------------------------
  // Declaring the modports
  //-------------------------------------------------------
  modport MON (clocking mon_cb, input rstn);

endinterface: riscv_vip_regfile_if

`endif
