library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity down_counter is
  port (Clk, Enable, Reset : in std_logic;
		Q_ones, Q_tens : out std_logic_vector(3 downto 0));
end entity down_counter;

architecture behaviour of bcd_counter is
        signal ones,tens : std_logic_vector(3 downto 0);
 begin
    process (Clk, Reset)
    begin
        if(rising_edge(Clk)) then
			if(Reset = '1') then
				ones <= "1001";
                tens <= "1001";
			elsif(Enable = '1') then
				if(ones = "0000") then
					tens <= tens - 1;
				end if;
                ones <= ones - 1;
			end if;
		end if;
    end process;
	Q <= output;
end architecture behaviour;