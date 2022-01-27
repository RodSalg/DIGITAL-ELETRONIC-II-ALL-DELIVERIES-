-- by: @Thiago Rodrigo Monteiro Salgado (SM) 
-- 21954456 - Eng. da Computaçao
-- Equipe 6;

use work.dsf_std.all; --framework dado pelo professor para a execução

-------------------------------------------------------------
-------------------------------------------------------------

-- minha entity
entity downcounter is
	port(
		-- Controles Assíncronos
		enable: in bit; 
		areset: in bit; --importante
		
		-- Controles síncronoss
		count_en: in bit; 
		clk: in bit;

		-- em 4 bits teremos
		q: buffer integer range (2**4 - 1) downto 0 := 9
	);
end entity downcounter;

-------------------------------------------------------------
-------------------------------------------------------------

-- Minha architecture
architecture downcounter_a of downcounter is

	constant len_module: integer := 10;
	constant max_count: integer := q'high;
	constant max_module: integer := len_module-1;

	-- Reset para enable = '0'
	function reset_q (enable: bit; q: integer) return integer is
		variable cnt: integer range max_module downto 1 := max_module;
	begin
		-- Modo limpa e colocar o valor máximo.
		if (enable = '0') then	
			cnt := max_module;
			
	-- guardando.
		else
			cnt := q; 
		end if;

		return cnt;
	end reset_q;
	
	-- funçao para decrementa somente se:
	function decre_q (enable, count_en: bit; q: integer) return integer is
		variable cnt: integer range max_count downto 0; --max_count definido anteriormente

	begin
	-- decrementando 
		if (enable = '1') and (count_en = '1') 
			then
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