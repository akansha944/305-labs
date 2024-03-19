-- Testbench for the lab 2 task 1. 
entity test_lab2 is
end entity test_lab2;

architecture my_test of test_lab2 is 
    signal t_clk, t_reset : bit;
    signal counter : integer;

    component lab2 is 
        port (Clk, Reset, Enable : in bit;
              Q : out bit);
    end component lab2;
begin
     DUT: test_lab2 port map (t_clk, t_reset, counter);
 
     -- Initialization process (code that executes only once).
     init: process
     begin 
       -- reset pulse
       t_reset <= '0', '1' after 2 ns, '0' after 7 ns;
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