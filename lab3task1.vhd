library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab3task1 is
    port (Clk, Reset, Start : in std_logic;
	Data_In : in std_logic_vector(9 downto 0);
        Time_Out: out std_logic;
	SevenSeg_sec1, SevenSeg_sec2, SevenSeg_min : out std_logic_vector(6 downto 0));
end entity lab3task1;

architecture behaviour of lab3task1 is

 component bcd_counter is 
   port (Clk, Direction, Enable, Init : in std_logic;
      Q : out std_logic_vector(3 downto 0));
 end component bcd_counter;

  signal timer_done : std_logic := '0';
  signal timer_running : std_logic := '0';

-- Initalise components and signals
  signal Direction, Init : bit;
  signal ones_enable, tens_enable, mins_enable : std_logic;
  signal Q_ones, Q_tens : std_logic_vector (3 downto 0);
  signal Q_mins : std_logic_vector (3 downto 0);
  signal tens_counter : integer := 9;
 
begin
  -- Configure downcounter
  counter_ones : BCD_Counter
    port map(Clk => Clk, Init => Reset, Direction => '1', Enable => ones_enable, Q => Q_ones);
  counter_tens : BCD_Counter
    port map(Clk => Clk, Init => Reset, Direction => '1', Enable => tens_enable, Q => Q_tens);
  counter_mins : BCD_Counter
    port map(Clk => Clk, Init => Reset, Direction => '1', Enable => mins_enable, Q => Q_mins);
  
  -- Managing the tens placevalue and reset
  process(Q_tens, Reset)
  begin
		if (Clk'event and Clk = '1') then
			if (Reset = '1') then
				ones_enable <= '0';
				tens_enable <= '0';
				mins_enable <= '0';
				timer_running <= '0';
			elsif (Start = '1') then
				ones_enable <= '1';
				tens_enable <= '1';
				mins_enable <= '1';
				timer_running <= '1';

				if (Q_ones > "1001") then
					Q_ones <= "1001";
				end if;
				if (Q_tens > "0101") then
					Q_tens <= "0101";
				end if;
				if (Q_mins > "0011") then
					Q_mins <= "0011";
				end if;
			end if;
			
			if (timer_running = '1') then
				if (Q_mins = "0000" and Q_ones = "0000" and Q_tens = "0000") then
					timer_done <= '1';
				else
					timer_done <= '0';
				end if;
			end if;
		end if;
	Time_out <= timer_done;

	end process;
end architecture behaviour;
