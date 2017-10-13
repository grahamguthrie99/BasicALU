library  ieee;
	use  ieee.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;
entity vhdlALU is
     port (A,B: in std_logic_vector(7 downto 0);
			  S0,S1,Cin: in std_logic;
           F: out std_logic_vector(7 downto 0);
			  Cout: out std_logic);
     end vhdlALU;

architecture behavior of vhdlALU is
	signal SUM: std_logic_vector(8 downto 0);
	signal abCOMP, abNAND, abEQU: std_logic_vector(7 downto 0);
	begin
		abCOMP <= not A;
		abNAND <= (A nand B);
		abEQU <= "00000001" when A=B else
					"00000000";
		SUM<= ('0' & A) + ('0' & B) + ("00000000" + Cin);
		
		F <= abCOMP when S1 = '0' and S0 = '0' else
				abNAND when S1 = '0' and S0 = '1' else
				abEQU when S1 = '1' and S0 = '0' else
				SUM(7 downto 0);
		
		Cout <= SUM(8) when S1 = '1' and S0 = '1' else
					'0';
					
end behavior;