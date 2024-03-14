entity counter is
  port (Clk, Reset : in bit;
    Q : out integer);
 end entity counter;

 architecture behaviour of counter is
 begin
    process (Clk)
        variable v_Q: integer; -- integere changed to integer
    begin
        if (Clk'event and Clk = '1') then -- 1 changed to '1'
           if (Reset = '1') then -- 1 changed to '1' and := changed to =
              v_Q := 24; -- := changed to = and number to 24
           elsif (v_Q /= 10) then -- checks if number is 10 or not
		if ((v_Q mod 2) = 0)
                  v_Q := v_Q - 2; -- 1 changed to '1'
		end if;
           else
                   v_Q := 24;
           end if;
        end if;
        Q <= v_Q; -- := changed to <=

     end process;
 end architecture behaviour;