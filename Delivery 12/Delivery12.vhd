-- by: @Thiago Rodrigo Monteiro Salgado (SM) 
-- 21954456 - Eng. da Computaçao
-- Equipe 6;


-- entity: colocaremos entradas e saídas
entity Contador_Decrescente is
	port(
		clk: in bit; -- Clock de entrada;
		aset: in bit; -- Aset de entrada
		q: out integer range (2**4 - 1) downto 0
	
	);
	
end entity Contador_Decrescente; -- fim da minha entity

architecture contador_Decrescente_Arch of Contador_Decrescente is --architecture do contador_Decrescente
begin
	process(clk, aset) -- aqui usaremos o process para obter um código sequencial
		variable q_buf : integer range (2**4 - 1) downto 0 := 15; --variveis do process
	begin --inicio do process 
		if (aset = '1') then -- condicao para ele o q_buf mudar caso o aset seja '1' 
			q_buf := (2**4 - 1);
		else --caso contrario
			if clk' event and (clk = '1') then --se o clock for '1';
				if (q_buf = 0) then --outra condicao caso q_buf seja 0;
					q_buf := (2**4 - 1); -- = q_buf sera 15;
				else
					q_buf := q_buf - 1; -- caso contrario ele sera ele - 1, diminuindo o valor dele e assim fazendo um contador decrescente;
				end if;
			end if;
		end if;
		q <= q_buf; -- q recebe o sinal de saída de q_buff;
	end process; -- process se encerra;
end architecture contador_Decrescente_Arch; --contador_Decrescente_Arch se encerra;