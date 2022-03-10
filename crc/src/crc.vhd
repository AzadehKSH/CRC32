-------------------------------------------------------------------------------
--
-- Title       : \crc 32 bit\
-- Design      : crc 32 bit
-- Author      : Azadeh kooshesh
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\crc_32_bit\crc 32 bit\src\crc 32 bit.vhd
-- Generated   : Thu Jan  7 18:36:52 2016
-- From        : 
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : VHDL coding method for Cyclic Reduntancy Check(CRC)
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {\crc 32 bit\} architecture {arch}}
library ieee; 
use ieee.std_logic_1164.all;
--*********************************************************************************************
entity CRC is 
  port (
          data_in : in std_logic_vector (3 downto 0);
          rst, clk : in std_logic;
          crc_out : out std_logic_vector (3 downto 0));
end CRC;
--********************************************************************************************
architecture cond of CRC is	
  signal lfsr_reg: std_logic_vector (31 downto 0);	
  signal lfsr_out: std_logic_vector (31 downto 0);	
begin															   
    lfsr_out(0) <= lfsr_reg(28) xor data_in(0);
    lfsr_out(1) <= lfsr_reg(28) xor lfsr_reg(29) xor data_in(0) xor data_in(1);
    lfsr_out(2) <= lfsr_reg(28) xor lfsr_reg(29) xor lfsr_reg(30) xor data_in(0) xor data_in(1) xor data_in(2);
    lfsr_out(3) <= lfsr_reg(29) xor lfsr_reg(30) xor lfsr_reg(31) xor data_in(1) xor data_in(2) xor data_in(3);
    lfsr_out(4) <= lfsr_reg(0) xor lfsr_reg(28) xor lfsr_reg(30) xor lfsr_reg(31) xor data_in(0) xor data_in(2) xor data_in(3);
    lfsr_out(5) <= lfsr_reg(1) xor lfsr_reg(28) xor lfsr_reg(29) xor lfsr_reg(31) xor data_in(0) xor data_in(1) xor data_in(3);
    lfsr_out(6) <= lfsr_reg(2) xor lfsr_reg(29) xor lfsr_reg(30) xor data_in(1) xor data_in(2);
    lfsr_out(7) <= lfsr_reg(3) xor lfsr_reg(28) xor lfsr_reg(30) xor lfsr_reg(31) xor data_in(0) xor data_in(2) xor data_in(3);
    lfsr_out(8) <= lfsr_reg(4) xor lfsr_reg(28) xor lfsr_reg(29) xor lfsr_reg(31) xor data_in(0) xor data_in(1) xor data_in(3);
    lfsr_out(9) <= lfsr_reg(5) xor lfsr_reg(29) xor lfsr_reg(30) xor data_in(1) xor data_in(2);
    lfsr_out(10) <= lfsr_reg(6) xor lfsr_reg(28) xor lfsr_reg(30) xor lfsr_reg(31) xor data_in(0) xor data_in(2) xor data_in(3);
    lfsr_out(11) <= lfsr_reg(7) xor lfsr_reg(28) xor lfsr_reg(29) xor lfsr_reg(31) xor data_in(0) xor data_in(1) xor data_in(3);
    lfsr_out(12) <= lfsr_reg(8) xor lfsr_reg(28) xor lfsr_reg(29) xor lfsr_reg(30) xor data_in(0) xor data_in(1) xor data_in(2);
    lfsr_out(13) <= lfsr_reg(9) xor lfsr_reg(29) xor lfsr_reg(30) xor lfsr_reg(31) xor data_in(1) xor data_in(2) xor data_in(3);
    lfsr_out(14) <= lfsr_reg(10) xor lfsr_reg(30) xor lfsr_reg(31) xor data_in(2) xor data_in(3);
    lfsr_out(15) <= lfsr_reg(11) xor lfsr_reg(31) xor data_in(3);
    lfsr_out(16) <= lfsr_reg(12) xor lfsr_reg(28) xor data_in(0);
    lfsr_out(17) <= lfsr_reg(13) xor lfsr_reg(29) xor data_in(1);
    lfsr_out(18) <= lfsr_reg(14) xor lfsr_reg(30) xor data_in(2);
    lfsr_out(19) <= lfsr_reg(15) xor lfsr_reg(31) xor data_in(3);
    lfsr_out(20) <= lfsr_reg(16);
    lfsr_out(21) <= lfsr_reg(17);
    lfsr_out(22) <= lfsr_reg(18) xor lfsr_reg(28) xor data_in(0);
    lfsr_out(23) <= lfsr_reg(19) xor lfsr_reg(28) xor lfsr_reg(29) xor data_in(0) xor data_in(1);
    lfsr_out(24) <= lfsr_reg(20) xor lfsr_reg(29) xor lfsr_reg(30) xor data_in(1) xor data_in(2);
    lfsr_out(25) <= lfsr_reg(21) xor lfsr_reg(30) xor lfsr_reg(31) xor data_in(2) xor data_in(3);
    lfsr_out(26) <= lfsr_reg(22) xor lfsr_reg(28) xor lfsr_reg(31) xor data_in(0) xor data_in(3);
    lfsr_out(27) <= lfsr_reg(23) xor lfsr_reg(29) xor data_in(1);
    lfsr_out(28) <= lfsr_reg(24) xor lfsr_reg(30) xor data_in(2);
    lfsr_out(29) <= lfsr_reg(25) xor lfsr_reg(31) xor data_in(3);
    lfsr_out(30) <= lfsr_reg(26);
    lfsr_out(31) <= lfsr_reg(27);
--*************************************************************************************************************
	  
   

    process (clk,rst) begin  
      if (rst = '1') then 
        lfsr_reg <= (others=>'0');
      elsif (clk'event and clk = '1') then  
          lfsr_reg <= lfsr_out; 
		  else
			 lfsr_reg <= lfsr_reg(27 downto 0) & X"F";
        end if;  
    end process;
--********************************************************************************************************************
	 crc_out <=( lfsr_reg(31) & lfsr_reg(30) & lfsr_reg(29) & lfsr_reg(28));
end architecture cond;
--******************************************************************************************************************