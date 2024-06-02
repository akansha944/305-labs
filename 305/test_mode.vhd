library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Testbench for the lab 2 task 1. 
entity test_mode is
end entity test_mode;

architecture my_test of test_mode is 
    signal Mode : std_logic_vector (1 downto 0);
    signal t_clk, t_reset, t_enable : std_logic;
    signal Q : std_logic_vector(3 downto 0);

    component lab2 is 
        port (Mode : in std_logic_vector (1 downto 0);
	Clk, Reset, Enable : in std_logic;
        Q : out std_logic_vector(3 downto 0));
    end component lab2;

     begin
     DUT: lab2 port map (Mode, t_clk, t_reset, t_enable, Q);

     init: process
     begin
       -- reset pulse
       t_reset <= '0', '1' after 2 ns, '0' after 7 ns, '1' after 20 ns, '0' after 25 ns;
       -- enable signal
       t_enable <= '1', '0' after 255 ns, '1' after 610 ns;
       -- mode changing between modes
      	Mode <=  "00";
	wait for 500 ns;
	Mode <=  "01";
	wait for 500 ns;
	Mode <=  "10";
	wait for 500 ns;
	Mode <=  "11";
	wait for 500 ns;
	
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