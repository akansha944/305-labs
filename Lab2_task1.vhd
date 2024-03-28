library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity lab2 is
  port (Mode : in std_logic_vector (1 downto 0); 
  Clk, Reset, Enable : in std_logic;
  Q : out std_logic_vector(3 downto 0));
end entity lab2;

 architecture behaviour of lab2 is
	signal Q1: std_logic_vector(3 downto 0);
	begin
 	process (Clk, Reset)
	variable currentMode : std_logic_vector (1 downto 0);
	begin
	if (Reset = '1') then
		currentMode := Mode;
		case Mode is 
			when "00" => Q1 <= "1011";
			when "01" => Q1 <= "1010";
			when "10" => Q1 <= "0000";
			when "11" => Q1 <= "1111";
			when others => null;
		end case;
	elsif (Clk'event and Clk = '1') then
		if (Enable = '1') then
			if (currentMode /= Mode) then
			currentMode := Mode;
			case Mode is 
				when "00" => Q1 <= "1011";
				when "01" => Q1 <= "1010";
				when "10" => Q1 <= "0000";
				when "11" => Q1 <= "1111";
				when others => null;
			end case;
			else
			case Mode is 
				when "00" => 
					if (Q1 > 1) then
						Q1 <= Q1 - 2;
					else
						Q1 <= "1011";
					end if;
				when "01" => 
					if(Q1 = "1010") then -- 10
						Q1 <= "0101"; -- 5
					elsif(Q1 = "0101") then -- 5
						Q1 <= "1000"; -- 8
					elsif(Q1 = "1000") then -- 8
						Q1 <= "0011"; -- 3
					elsif(Q1 = "0011") then -- 3
						Q1 <= "0111"; -- 7
					elsif(Q1 = "0111") then -- 7
						Q1 <= "0110"; -- 6
					elsif(Q1 = "0110") then -- 6
						Q1 <= "1100"; -- 12	
					else
						Q1 <= "1010"; -- 10
					end if;	
				when "10" => 
					if(Q1 /= 13) then
						Q1 <= Q1 + 1;
					else 
						Q1 <= "0000";
					end if;
				when "11" => Q1 <= "1111";
				when others => null;
			end case;
			end if;	
		end if;
	end if;
    end process;
	Q <= Q1;	
end architecture behaviour;
