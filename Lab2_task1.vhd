library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity lab2 is
  port (Mode : in bit_vector (1 downto 0); 
Clk, Reset, Enable : in bit;
  Q : out std_logic_vector(3 downto 0));
end entity lab2;

 architecture behaviour of lab2 is
	signal Q1: integer;
	begin
 	process (Clk, Mode, Reset, Enable)
	begin
	--if (Reset = '1') then
		--Q1 <= 11;
	case Mode is 
		when "00" => 
			if (Q1 /= 1) then
				Q1 <= Q1 - 2;
			else
				Q1 <= 11;
			end if;
		when "01" => 
			if(Q1 = 10) then
				Q1 <= 5;
			elsif(Q1 = 5) then
				Q1 <= 8;
			elsif(Q1 = 8) then
				Q1 <= 3;
			elsif(Q1 = 3) then
				Q1 <= 7;
			elsif(Q1 = 7) then
				Q1 <= 6;
			elsif(Q1 = 6) then
				Q1 <= 12;	
			else
				Q1 <= 10;
			end if;	
		when "10" => 
			if(Q1 /= 13) then
				Q1 <= Q1 + 1;
			else 
				Q1 <= 1;
			end if;
		when "11" => Q1 <= 1111;
		when others => null;
	end case;
    end process;
	Q <= std_logic_vector(to_unsigned(Q1, Q'length));	
end architecture behaviour;
