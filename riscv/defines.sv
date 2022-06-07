//-----------------------------------------------------------------------------
// Title            : riscv playground
// Project          : rvc_playground
//-----------------------------------------------------------------------------
// File             : <TODO>
// Original Author  : Amichai Ben-David
// Code Owner       : 
// Created          : 6/2022
//-----------------------------------------------------------------------------
// Description : single Cycle RISCV core compatible with RV32I
//
//
//-----------------------------------------------------------------------------


`define  RVC_MSFF(q,i,clk)              \
         always_ff @(posedge clk)       \
            q<=i;

`define  RVC_EN_MSFF(q,i,clk,en)        \
         always_ff @(posedge clk)       \
            if(en) q<=i;

`define  RVC_RST_MSFF(q,i,clk,rst)      \
         always_ff @(posedge clk) begin \
            if (rst) q <='0;            \
            else     q <= i;            \
         end

`define  RVC_EN_RST_MSFF(q,i,clk,en,rst)\
         always_ff @(posedge clk)       \
            if (rst)    q <='0;         \
            else if(en) q <= i;
