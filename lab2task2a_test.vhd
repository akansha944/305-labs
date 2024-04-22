library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab2task2a_test is
end entity lab2task2a_test;

architecture test of lab2task2a_test is
    -- clk period = 1/clk frq so 1/100x10^6 = 10x10^-9
    signal t_clk, t_init, t_dir, t_enable : std_logic;
    signal t_Q : std_logic_vector(3 downto 0);

    component lab2task2a is
        port (Clk, Init, Dir, Enable  : in  std_logic;
            Q : out std_logic_vector(3 downto 0));
    end component lab2task2a;

begin
    -- Instantiate the DUT
    DUT: lab2task2a port map (Clk => t_clk, Init => t_init, Dir => t_dir, Enable => t_enable, Q => t_Q);

    -- clk
    clk: process
    begin
        wait for 5 ns; -- clk period divided by 2
        t_clk <= '1'; 
        wait for 5 ns;
        t_clk <= '0';
    end process clk;

    -- testing
    testing: process 
    begin
        -- reset, test enable on and up counter
        t_init <= '1';
        wait for 10 ns;
        t_init <= '0';
        wait for 10 ns;
        t_dir <= '0';
        t_enable <= '1';
        wait for 200 ns;
        
        -- change to down counter
        t_dir <= '1';
        wait for 200 ns;
        
        -- change to enable off
        t_enable <= '0';
        wait for 281 ns;
    end process testing;
end architecture test;