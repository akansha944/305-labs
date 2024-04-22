-- lab2task2a
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab2task2a is
    port (Clk, Init, Dir, Enable : in std_logic;
        Q: out std_logic_vector(3 downto 0));
end entity lab2task2a;

architecture behaviour of lab2task2a is
    signal v_Q : std_logic_vector(3 downto 0) := "0000";
begin
    process(Clk, Init)
    begin
        if (Clk'event and Clk = '1') then
            if (Init = '1') then
                if (Dir = '1') then
                    v_Q <= "1001";
                else
                    v_Q <= "0000";
                end if;
            elsif (Enable = '1') then
                if (Dir = '1') then
                    if (v_Q = "0000") then
                        v_Q <= "1001";
                    else
                        v_Q <= std_logic_vector(unsigned(v_Q) - 1);
                    end if;
                else
                    if (v_Q = "1001") then
                        v_Q <= "0000";
                    else
                        v_Q <= std_logic_vector(unsigned(v_Q) + 1);
                    end if;
                end if;
            end if;
        end if;
    end process;
    Q <= v_Q;
end architecture behaviour;