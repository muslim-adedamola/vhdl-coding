library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity servo is
	port( inputs : in std_logic_vector(6 downto 0);
			clk : in std_logic;
			pwm_1703 : out std_logic);
end entity;

architecture servo_arch of servo is	
	signal counter, transition : integer range 0 to 1000000;
begin
	counter_0 : process(clk)
	begin
		if rising_edge(clk) then
			if counter >= 1000000 then counter <= 0;
			else counter <= counter + 1;
			end if;
		end if;
	end process;
	
	transition <= conv_integer(inputs) * (500000 - 250000) / 105 + 250000;
	
	pwm_1703 <= '1' when counter < transition else '0';

end architecture;