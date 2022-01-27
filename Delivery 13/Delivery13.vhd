-- by: @Thiago Rodrigo Monteiro Salgado (SM) 
-- 21954456 - Eng. da Computaçao
-- Equipe 6;



-- minha entity
entity bcd2twofive is
	port(
		-- Entradas
		enable: in bit; 
		bcd: in integer range (2**4 - 1) downto 0;  ---- Entrada bcd sera um inteiro de 0 à 9
		-- saidas
		activ: out bit; -- valida somente de 0 à 9
		twofive: out bit_vector(4 downto 0) --  conversor  do twofive
	);
	
end entity bcd2twofive;

-- minha architecture
architecture bcd2twofive_a of bcd2twofive is
	
	--funcao do programa para que haja a conversao  do integer para bit_vector
	function bcd2twofive_function (bcd : integer) return bit_vector is
		variable  twofive_buf  :  bit_vector (4 downto 0);
	begin
		case bcd is 
			when 0 => twofive_buf := "00011";
			when 1 => twofive_buf := "00101";
			when 2 => twofive_buf := "00110";
			when 3 => twofive_buf := "01001";
			when 4 => twofive_buf := "01010";
			when 5 => twofive_buf := "01100";
			when 6 => twofive_buf := "10001";
			when 7 => twofive_buf := "10010";
			when 8 => twofive_buf := "10100";
			when 9 => twofive_buf := "11000";
			when others => twofive_buf := "00000" ; 
			
		end case;

		return twofive_buf;
	end bcd2twofive_function;
  
  
	-- Verificando se esta tudo de 0 à 9
	function is_range (data : integer; min, max : integer) return bit is 
		variable  alt  :  bit;
	begin
		if (data >= min) and (data <= max) then
      -- o valor esta entre 0 e 9
			alt := '1';
		else 
	  -- é incorreto afirmar que está entre 0 e 9 esta fora 
			alt := '0';
		end if;
 
		return alt;
	end is_range;
  
begin

	twofive <= bcd2twofive_function(bcd) when (enable = '1') else "00000";
					
	activ <= is_range(bcd, 0, 9);
	
end architecture bcd2twofive_a;

