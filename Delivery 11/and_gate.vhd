library ieee;
use ieee.std_logic_1164.all; -- para operadores lógicos;
use ieee.std_logic_arith.all; -- para operadores aritméticos;


entity bin2gray is
	port(
	
	bin : in std_logic_vector;
	gray : out std_logic_vector(2 downto 0) 
	
	);
	
end entity bin2gray;

architecture bin2gray_Arch of bin2gray is
begin 

	process(bin)
		variable x_buf : std_logic_vector(2 downto 0);
	begin
		case bin is
			when "000" => x_buf := "000";
			when "001" => x_buf := "001";
			when "010" => x_buf := "011";
			when "011" => x_buf := "010";
			when "100" => x_buf := "110";
			when "101" => x_buf := "111";
			when "110" => x_buf := "101";
			when "111" => x_buf := "100";
		end case;
		gray <= x_buf;
	end process;
end architecture bin2gray_Arch;
			