-- by: @Thiago Rodrigo Monteiro Salgado (SM) 
-- 21954456 - Eng. da Computaçao
-- Equipe 6;


use work.dsf_std.all; -- pacote disponibilizado pelo professor

-- minha entidade
entity downcounter2 is
	port(
		-- Controles Assíncronos
		enable: in bit; 
		areset: in bit; 
		
		-- Controles Síncronoss
		count_en: in bit; 
		clk: in bit;

		-- contagem para modulo 15 
		q: buffer integer range (2**4 - 1) downto 0 := 10
	);
end entity downcounter2;

-- minha arquitetura 
architecture downcounter2_a of downcounter2 is
	-- todos em inteiro como solicitado pelo professor!
	constant len_module: integer := 11; --
	constant max_count: integer := q'high;
	constant max_module: integer := len_module-1;

	-- reset aplica contagem quando enable = '0' bit
	function reset_q (enable: bit; q: integer) return integer is
		variable cnt: integer range max_module downto 1 := max_module;
	begin
		-- pegando o max module
		if (enable = '0') then	
			cnt := max_module;
			
		-- na  memoria teremos
		else
			cnt := q; 
		end if;

		return cnt;
	end reset_q;
	
	
	-- decrementando de 2 em 2
	function decrement2 (count : integer; max : integer) return integer is
		variable  next_count  :  integer range max_count downto 0;
	begin

		-- condicao para realizar a contagem
		if (count = 0) then
			-- Caso base
			next_count := max;
				
		else
			-- Passo recorrente
			next_count := count - 2;
				
		end if;
			  
		return next_count;
	end decrement2;


	-- funçao que fará a contagem iniciar
	function decre_q (enable, count_en: bit; q: integer) return integer is
		variable cnt: integer range max_count downto 0;
	begin
		-- decrementando 
		if (enable = '1') and (count_en = '1') then
			cnt := decrement2(q, max_module);

		else
			cnt := q;
		end if;

		return cnt;
	end decre_q;

begin

	q <= reset_q(enable, q) when areset='1' else
		  decre_q(enable, count_en, q) when low2high(clk);
	
end architecture downcounter2_a;