entity bcd_counter is
  port (Clk, Direction, Enable, Init : in bit;
  Q : out bit);
end entity bcd_counter;

architecture behaviour of bcd_counter is
 begin
    process (Clk)
        variable output : integer;
    begin
        if(Enable = '1') then
		if(Init = '1') then
			output := 0;
			if(Direction = '0') then
				if(output /= 9) then
					output := output + 1;
				else
					output := 0;
				end if;
			else
				if(output /= 0) then
					output := output - 1;
				else
					output := 9;
				end if;
			end if;
		end if;
	end if;
     end process;
end architecture behaviour;