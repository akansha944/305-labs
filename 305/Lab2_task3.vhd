library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity down_counter is
  port (Clk, Enable, Reset : in std_logic;
	BCD_out : out std_logic_vector(7 downto 0));
end entity down_counter;

architecture behaviour of down_counter is
	component bcd_counter is 
        port (Clk, Direction, Enable, Init : in std_logic;
		    Q : out std_logic_vector(3 downto 0));
    	end component bcd_counter;
	signal ones,tens : std_logic_vector(3 downto 0);
	signal tens_enable : std_logic;

 begin
	Q_ones: bcd_counter port map (Clk => Clk, Direction => '1', Enable => Enable, Init => Reset, Q => ones);
	Q_tens: bcd_counter port map (Clk => Clk, Direction => '1', Enable => Enable, Init => Reset, Q => tens);

	tens_enable <= tens;
	if(ones = "0000") then
		tens_enable = tens_enable - 1;
	
	BCD_out <= tens_enable & ones;
end architecture behaviour;