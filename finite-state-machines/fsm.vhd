library ieee;
use ieee.std_logic_1164.all;

entity fsm1 is
	port( clk : in std_logic;
			rst : in std_logic;
			inputs : in std_logic;
			outputs_1703 : out std_logic);
end entity;


architecture fsm1_arch of fsm1 is
	type stateType is (s0, s1, s2, s3, s4, s5);
	signal sPresent, sNext : stateType;
begin
	transitions : process(clk,rst)
	begin
		if rst = '1' then sPresent <= s0;
		elsif rising_edge(clk) then sPresent <= sNext;
		end if;
	end process;
	
	sNext <= s0 when inputs = '0' and sPresent = s0 else
				s1 when inputs = '1' and spresent = s0 else
				s2 when inputs = '0' and sPresent = s1 else
				s1 when inputs = '1' and sPresent = s1 else
				s3 when inputs = '0' and sPresent = s2 else
				s1 when inputs = '1' and sPresent = s2 else
				s0 when inputs = '0' and sPresent = s3 else
				s4 when inputs = '1' and sPresent = s3 else
				s2 when inputs = '0' and sPresent = s4 else
				s5 when inputs = '1' and sPresent = s4 else
				s0 when inputs = '0' and sPresent = s5 else
				s1 when inputs = '1' and sPresent = s5 else
				s0;
				
	with sPresent select
	outputs_1703 <= '1' when s5,
						 '0' when others;
end architecture;
				
				
				