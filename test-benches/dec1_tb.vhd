library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.std_logic_unsigned.all;

entity dec1_tb is
end entity;

architecture tb of dec1_tb is
	signal number : std_logic_vector(3 downto 0);
	signal segments_1703 : std_logic_vector(6 downto 0);
begin
	dut : entity work.dec1 port map(number => number, segments => segments_1703);
												--entity signal => local tb signal
	tb1 : process
		constant period : time := 256 ns;
		file stim_in : text is in "C:\Users\ALARAN ADEDAMOLA\Documents\CSCI502\tbdecoder1/stim_in.txt";
		variable l_in : line;
		variable data_segments : std_logic_vector(6 downto 0);
		variable data_number : std_logic_vector(3 downto 0);
		
	begin
		while not endfile(stim_in) loop
			readline(stim_in, l_in);
			read(l_in, data_number);
			read(l_in, data_segments);
			
			number <= data_number;
			
			wait for period;
			
			assert(segments_1703 = data_segments)
			report "failed for input number: " & integer'image(conv_integer(number)) 
			& " generated: " & integer'image(conv_integer(segments_1703)) & 
			" but output in file is: " & integer'image(conv_integer("0111110")) severity error;
			
		
		end loop;
		wait;
	end process;
	
end architecture;