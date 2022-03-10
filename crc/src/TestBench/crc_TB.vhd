library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity crc_tb is
end crc_tb;

architecture TB_ARCHITECTURE of crc_tb is
	-- Component declaration of the tested unit
	component crc
	port(
		data_in : in STD_LOGIC_VECTOR(3 downto 0);
		rst : in STD_LOGIC;
		clk : in STD_LOGIC;
		crc_out : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal data_in : STD_LOGIC_VECTOR(3 downto 0);
	signal rst : STD_LOGIC;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal crc_out : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : crc
		port map (
			data_in => data_in,
			rst => rst,
			clk => clk,
			crc_out => crc_out
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_crc of crc_tb is
	for TB_ARCHITECTURE
		for UUT : crc
			use entity work.crc(cond);
		end for;
	end for;
end TESTBENCH_FOR_crc;

