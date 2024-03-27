-- Testbench for the BCD_Counter. 
entity test_bcd_counter is
end entity test_bcd_counter;

architecture my_test of test_bcd_counter is 
    signal t_clk, t_init, t_direction, t_enable : bit;
    signal t_Q : integer;

    component bcd_counter is 
        port (Clk, Init, Direction, Enable : in bit;
 	Q : out integer);
    end component bcd_counter;
begin
     DUT: bcd_counter port map (t_clk, t_init, t_direction, t_enable, t_Q);
 
     -- Initialization process (code that executes only once).
     init: process
     begin 
       -- init pulse
       t_init <= '0', '1' after 2 ns, '0' after 7 ns;
       -- enable signal
       t_enable <= '1', '0' after 255 ns, '1' after 610 ns;
       -- direction signal
       t_direction <= '0', '1' after 100 ns, '0' after 100 ns, '1' after 100 ns;
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