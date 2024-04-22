library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab3task1_test is
end entity lab3task1_test;

architecture test of lab3task1_test is 
    signal t_clk, t_reset, t_start : std_logic;
    signal t_data_in : std_logic_vector(9 downto 0);
    signal t_time_out : std_logic;
    signal t_sevenseg_sec1, t_sevenseg_sec2, t_sevenseg_min : std_logic_vector(6 downto 0);

    component lab3task1 is
        port (Clk , Reset, Start : in std_logic;
            Data_In : in std_logic_vector(9 downto 0);
            Time_Out : out std_logic;
            SevenSeg_sec1, SevenSeg_sec2, SevenSeg_min : out std_logic_vector(6 downto 0));
    end component lab3task1;

begin
    -- Instatiate DUT
    DUT : lab3task1 port map (
        Clk => t_clk, Reset => t_reset, Start => t_start,
        Data_In => t_data_in,
        Time_Out => t_time_out,
        SevenSeg_sec1 => t_sevenseg_sec1, SevenSeg_sec2 => t_sevenseg_sec2, SevenSeg_min => t_sevenseg_min);
    
    -- clk, this isn't right it's just a placeholder before we make the actual component
    clk: process
    begin
        wait for 5 ns;
        t_clk <= '1';
        wait for 5 ns;
        t_clk <= '0';
    end process clk;

    -- testing to be developed
    testing: process
    begin 
        t_reset <= '1';
        wait for 10 ns;
        t_reset <= '0';
        wait for 10 ns;
        t_start <= '1';
        wait for 200 ns;
        t_data_in <= "0100100110"; -- 126 from the pdf
    end process testing;
end architecture test;