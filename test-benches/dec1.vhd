library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec1 is
 Port ( number : in STD_LOGIC_VECTOR (3 downto 0);
 segments : out STD_LOGIC_VECTOR (6 downto 0));
end entity;


architecture dec1_arch of dec1 is
begin
 segments <= "1000000" when number = "0000" else
 "1111001" when number = "0001" else
 "0100100" when number = "0010" else
 "0110000" when number = "0011" else
 "0011001" when number = "0100" else
 "0010010" when number = "0101" else
 "0000011" when number = "0110" else
 "1111000" when number = "0111" else
 "0000000" when number = "1000" else
 "0011000" when number = "1001" else
 "0111111";
end architecture;