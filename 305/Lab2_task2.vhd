library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity bcd_counter is
  port (Clk, Direction, Enable, Init : in std_logic;
		Q : out std_logic_vector(3 downto 0));
end entity bcd_counter;

architecture behaviour of bcd_counter is
        signal output : std_logic_vector(3 downto 0);
 begin
    process (Clk, Init)
    begin
        if(Clk'event and Clk = '1') then
		if(Init = '1') then
			if(Direction = '1') then
				output <= "1001";
			else
				output <= "0000";
			end if;
		elsif(Enable = '1') then
			if(Direction = '1') then
				if(output = "0000") then
					output <= "1001";
				else
					output <= output - 1;
				end if;
			else
				if(output = "1001") then
					output <= "0000";
				else
					output <= output + 1;
				end if;
			end if;
		end if;
	end if;
    end process;
	Q <= output;
end architecture behaviour;