`include "defines.sv"

module rvc_top_sc (
    input logic Clock,
    input logic Rst
);
import param_pkg::*;  

//=========================================
//     Core - Memory interface
//=========================================
logic [31:0] Pc;             // I_MEM
logic [31:0] Instruction;    // I_MEM
logic [31:0] RegRdData2;     // D_MEM
logic [31:0] AluOut;         // D_MEM
logic [3:0]  CtrlDMemByteEn; // D_MEM
logic CtrlDMemWrEn;          // D_MEM
logic SelDMemWb;             // D_MEM
logic CtrlSignExt;           // D_MEM
logic [31:0] DMemRdData;     // D_MEM

// Instantiating the rvc_asap core
rvc_asap_sc rvc(
    .Clk            (Clock),
    .Rst            (Rst)
    //
    .Instruction    (Instruction),    // From I_MEM
    .Pc             (Pc),             // To I_MEM
    //
    .WrData         (RegRdData2),     // To D_MEM
    .WrEn           (CtrlDMemWrEn),         // To D_MEM
    .ByteEn         (CtrlDMemByteEn), // To D_MEM
    .ByteEn         (CtrlDMemByteEn), // To D_MEM
    .RdData         (DMemRdData),     // From D_MEM
);

// Instantiating the rvc_mem_wrap memory
rvc_mem_wrap_sc rvc_mem_wrap(
    .Clock          (Clock),
    .Pc             (Pc),             // I_MEM
    .Instruction    (Instruction),    // I_MEM
    .RegRdData2     (RegRdData2),     // D_MEM
    .AluOut         (AluOut),         // D_MEM
    .CtrlDMemByteEn (CtrlDMemByteEn), // D_MEM
    .CtrlDMemWrEn   (CtrlDMemWrEn),   // D_MEM
    .SelDMemWb      (1'b1),      // D_MEM
    .CtrlSignExt    ('0),    // D_MEM
    .DMemRdData     (DMemRdData),     // D_MEM
    .Rst            (Rst)
);

endmodule // module rvc_top_sc