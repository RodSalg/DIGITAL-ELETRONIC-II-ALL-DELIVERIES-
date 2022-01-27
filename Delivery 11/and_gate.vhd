library ieee;
use ieee.std_logic_1164.all; -- para operadores lógicos;
use ieee.std_logic_arith.all; -- para operadores aritméticos;

-- by: @Thiago Rodrigo Monteiro Salgado - 21954456 - Eng. da Computaçao

/*
	vamos vidir a estrutura em duas partes: entity e architecture;
	entity serve para declarações mais explicitas de entradas, saidasm buffers, etc;
*/

entity bin2gray is --definindo o nome da entity e declarando posteriormente
	port(
	
	bin : in std_logic_vector (2 downto 0); --entradas
	gray : out std_logic_vector(2 downto 0) -- saídas (downto de (2...0) ); 
	
	);
	
end entity bin2gray; -- fim da entity


 -- inicio da arquitetura ( aqui e onde definiremos como elas se posicionam, a ordem, se vai ser sequencial ou concorrente);
 
architecture bin2gray_Arch of bin2gray is --mesmo nome porem com o sufixo arch de architecture para diferenciar a entity da architecture;
begin 

	process(bin) --usaremos o process pois ele possui uma parte com comandos sequencias que é o que queremos
		variable x_buf : std_logic_vector(2 downto 0); --declaraçao das variáveis no process fica apos o variable;
	begin
		case bin is --aqui começa a parte sequencial onde é a apenas uma redigitalização da imagem do Delivery 1;
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
	end process; --fim do processo;
end architecture bin2gray_Arch; --fim da architecture;
			