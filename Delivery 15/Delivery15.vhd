-- by: @Thiago Rodrigo Monteiro Salgado (SM) 
-- 21954456 - Eng. da Computaçao
-- Equipe 6;
------------------------------------------

use work.dsf_std.all; --pacote disponibilizado pelo professor


-- Minha Entity
entity downcounter is
	port(
		-- Controles Assíncronos
		enable: in bit; 
		areset: in bit; 
		
		-- Controles Síncronoss
		count_en: in bit; 
		clk: in bit;
	--resultado do q vai ser a contagem
		q: buffer integer range (2**4 - 1) downto 0 := 9
	);
end entity downcounter;

-- minha architecture
architecture downcounter_a of downcounter is
	constant len_module: integer := 10;
	constant max_count: integer := q'high;
	constant max_module: integer := len_module-1;

	-- reset para a contagem quando enable for '0' bit
	function reset_q (enable: bit; q: integer) return integer is
		variable cnt: integer range max_module downto 1 := max_module;
	begin
		-- atribuindo o maximo valor.
		if (enable = '0') 
			then	
				cnt := max_module;
			
		-- armazenando 
		else
			cnt := q; 
		end if;

		return cnt;
	end reset_q;
	
	-- funçao igual a do delivery 14 para a ativaçao do decremento  
	function decre_q (enable, count_en: bit; q: integer) return integer is
		variable cnt: integer range max_count downto 0;

	begin
		-- decrescendo
		if (enable = '1') and (count_en = '1') then
			cnt := decrement(q, max_module);

		else
			cnt := q;
		end if;

		
		return cnt;
	end decre_q;

begin
	q <= reset_q(enable, q) when areset='1' 
		else
		  decre_q(enable, count_en, q) when low2high(clk);
	
end architecture downcounter_a;