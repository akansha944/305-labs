entity wgen2 is
  port (Enable : in bit; 
  X : in bit_vector (2 downto 0);
  A, B, C, Z : out bit);
end entity wgen2;

 architecture behaviour of wgen2 is
	signal A1, B1, C1: bit;
 begin
	process
	begin
		
	end process;
	--Assign values
	
 	process (X, A1, B1, C1)
	begin
	case X is 
		when "000" => Z <= A1 or B1;
		when "001" => Z <= B1 and C1;
		when "010" => Z <= A1 or B1 or C1;
		when "011" => Z <= (A1 and B1) or C1;
		when "100" => Z <= '0';
		when "101" => Z <= A1;
		when "110" => Z <= A1;
		when "111" => Z <= '1';
		when others => null;
	end case;	
    end process;

	A <= A1 and Enable;
	B <= B1 and Enable;
	C <= C1 and Enable;
end architecture behaviour;

