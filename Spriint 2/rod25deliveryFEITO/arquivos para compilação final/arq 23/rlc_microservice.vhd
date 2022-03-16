
-- Thiago Rodrigo (SCRUM MASTER)
library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;

entity rlc_microservice is

  port (

    enable     :    in        bit;
    areset     :    in        bit;
    pulse      :    in        bit;
    clk        :    in        bit;
    reset_o    :    buffer    bit  :=  '0';
    store_o     :   buffer    bit  :=  '0';
    windows_o    :  buffer    bit  :=  '0';
    state      :    buffer    integer range 7 downto 0  :=  0

  );
  
end rlc_microservice;



architecture rlc_microservice_a of rlc_microservice is

  -- --------------------------------------------------------------------------
  -- @detail           CONSTANTES E TIPOS GLOBAIS DA ARQUITETURA             --
  -- --------------------------------------------------------------------------

  -- Limite de estados do microsserviço.
  constant  MAX_STATE  :  integer  :=  state'high;

  -- Estados do microsserviço.
  type  state_t is (rst_on,
						  wait4pulse_s, -- 0, Espera o sinal pulse ser ativado.
                    reset_s,      -- 2, Operação limpa o contador e registrador.
                    store_s,       -- 3, Operação de carga do registrador.
                    windows_s     -- 4, Operação de incremento do contador.
--					error_s,      -- 5, Sinalização de erro.
--					noise_s
					);     


  -- --------------------------------------------------------------------------
  -- @detail                FUNÇÕES GLOBAIS DA ARQUITETURA                   --
  -- --------------------------------------------------------------------------

function next_state (reset : bit; signal clk : bit; pulse : bit; state : state_t) return state_t is

    -- Próximo estado da máquina: modo memória.
	variable  nx_state    :  state_t  :=  state;

begin

	if (reset = '1') then
	  
      -- Modo reset.
		nx_state := rst_on;

	elsif high2low(clk) then
	  
      -- Encontra o próximo estado.
		case state is
			when rst_on       => -- reset do microservice
										nx_state := wait4pulse_s;

			when wait4pulse_s => -- Modo espera o início da partida.
										if (pulse = '1') then
										  -- Modo partindo.
											nx_state := reset_s;
										end if;

			when reset_s      =>   -- Modo conta.
										nx_state := windows_s;

			when store_s      =>   -- Modo conta.
										nx_state := wait4pulse_s;

			when windows_s    =>   -- Modo carga.
										if (pulse = '0') then
											nx_state := store_s;
										end if;

			when others       =>   -- Estado de erro devido a ruído.
								 	   nx_state := wait4pulse_s;

		end case;
	end if;  -- reset & clk.
	return nx_state;
end next_state;


function get_out (reset : bit; target, current : state_t) return bit is
    -- Próxima saída: modo memória.
	variable  nx_out  :  bit;

begin
	if (reset = '1') then
      -- Modo limpa.
      nx_out := '0';	  

	else
		if (current = target) then
        -- Modo ativado.
        nx_out := '1';

      else
        -- Modo desativado.
        nx_out := '0';

		end if;
	end if;
	return nx_out;
end get_out;



function get_state (current : state_t) return integer is

	-- Número do estado do microsserviço.
	variable   state  :  integer range  MAX_STATE downto 0;

begin

    -- Encontra o próximo estado.
	case current is
 
		when rst_on => state := 0;

		-- Espera ativação do sinal pulse.
		when wait4pulse_s => state := 1;

		-- Operação limpa do contador e registrador da lógica.
		when reset_s => state := 2;

		-- Operação carga do registrador da lógica
		when store_s => state := 3;

		-- Operação incremento do contador da lógica.
		when windows_s => state := 4;
	 
		-- Sinalização de erro.
		when others => state := 5;

	end case;
	return state;

end get_state;



  -- --------------------------------------------------------------------------
  -- @detail                BUFFERS LOCAIS DA ARQUITETURA                    --
  -- --------------------------------------------------------------------------

  -- Estado simbólico do microsserviço.
	signal   current   :   state_t   :=   wait4pulse_s;

begin

  --Próximo estado
  current <= next_state(areset, clk, pulse, current) when (enable = '1');

  --Operação limpa
  reset_o <= get_out(areset, reset_s, current) when (enable = '1');

  --Operação carga.
  store_o  <= get_out(areset, store_s, current) when (enable = '1');

  --Operação conta
  windows_o <= get_out(areset, windows_s, current) when (enable = '1');

  --Estado corrente
  state   <= get_state(current);

end rlc_microservice_a;








