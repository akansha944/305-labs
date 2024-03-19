entity lab2 is
  port (Mode : in bit_vector (1 downto 0); 
Clk, Reset, Enable : in bit;
  Q : out bit);
end entity lab2;

 architecture behaviour of lab2 is
	variable counter: integer;

 	process (Clk, Mode)
	begin
	case Mode is 
		when "00" => Q <= 
			counter := 11;
			if (counter /= 1) then
				if ((counter mod 2) /= 0) then
					counter := counter - 2;
				end if;
			else
				counter := 11;
			end if;
		when "01" => Q <=
			
		when "10" => Q <=
			counter := 1;
			if(counter /= 13) then
				counter := counter + 1;
			else 
				counter := 1;
			end if;
		when "11" => Q <= "1111";
		when others => null;
	end case;	
    end process;
end architecture behaviour;
