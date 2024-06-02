library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Testbench for the BCD_Counter. 
entity test_bcd_counter is
end entity test_bcd_counter;

architecture my_test of test_bcd_counter is 
    signal t_clk, t_init, t_direction, t_enable : std_logic;
    signal t_Q : std_logic_vector(3 downto 0);

    component bcd_counter is 
        port (Clk, Direction, Enable, Init : in std_logic;
		    Q : out std_logic_vector(3 downto 0));
    end component bcd_counter;
    
begin
     DUT: bcd_counter port map (t_clk, t_direction, t_enable, t_init, t_Q);
 
     -- Initialization process (code that executes only once).
     init: process
     begin 
       -- init pulse
       t_init <= '1', '0' after 10 ns;
       -- enable signal
       t_enable <= '1', '0' after 255 ns, '1' after 610 ns;
       -- direction signal
       t_direction <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;
        wait for 610 ns;
     end process init;

     -- clock generation
     clk_gen: process
     begin
         wait for 5 ns;
         t_clk <= '1'; 
         wait for 5 ns;
         t_clk <= '0';
     end process clk_gen;  
end architecture my_test;