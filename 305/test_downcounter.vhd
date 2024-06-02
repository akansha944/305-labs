library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench for the BCD_Counter. 
entity test_down_counter is
end entity test_down_counter;

architecture my_test of test_down_counter is 
    signal t_clk, t_reset, t_enable : std_logic;
    signal output : std_logic_vector(7 downto 0);

    component down_counter is 
        port (Clk, Enable, Reset : in std_logic;
		   BCD_out : out std_logic_vector(7 downto 0));
    end component down_counter;
    
begin
     DUT: down_counter port map (t_clk, t_enable, t_reset, output);
 
     -- Initialization process (code that executes only once).
     init: process
     begin 
       -- init pulse
       t_reset <= '1', '0' after 10 ns;
       -- enable signal
       t_enable <= '1', '0' after 255 ns, '1' after 610 ns;
       wait;
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