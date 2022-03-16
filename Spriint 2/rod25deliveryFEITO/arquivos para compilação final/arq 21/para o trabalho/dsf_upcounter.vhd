library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;

entity dsf_upcounter is
  port (
  
    -- Controles assíncronos.
    enable    :  in      bit;
    areset    :  in      bit;

    -- Controles síncronos.
    count_en  :  in      bit;
    clk       :  in      bit;
	
    -- Resultado da contagem: 4 bits
    q         :  buffer  integer range (2**4 - 1) downto 0 := 0
	
  );
  
end dsf_upcounter;



architecture upcounter_a of dsf_upcounter is

  -- --------------------------------------------------------------------------
  --                   CONSTANTES GLOBAIS DA ARQUITETURA                     --
  -- --------------------------------------------------------------------------

  -- Parâmetro: Módulo de contagem do contador.
  constant  LEN_MODULE  :  integer  :=  10;
  
  -- Limites dos valores do contrador.
  constant  MAX_COUNT   :  integer  :=  q'high;  
  constant  MAX_MODULE  :  integer  :=  LEN_MODULE - 1;
  
  
  -- --------------------------------------------------------------------------
  --                     FUNÇÕES GLOBAIS DA ARQUITETURA                      --
  -- --------------------------------------------------------------------------

  function reset_q (enable : bit; q : integer) return integer is

    variable  cnt  :  integer range MAX_COUNT downto 0 := 0;

  begin

    if (enable = '1') then

      -- Modo limpa.
      cnt := 0;

    else
	
      -- Modo memória.
      cnt := q;
	  
	end if;

	return cnt;

  end reset_q;



  function inc_q (enable, count_en : bit; q : integer) return integer is

	variable  cnt  :  integer range MAX_COUNT downto 0;

  begin

    if (enable = '1') and (count_en = '1') then

      -- Modo contagem.
      cnt := increment(q, MAX_MODULE);

    else

      -- Modo memória.
      cnt := q;

    end if;

    return cnt;

  end inc_q;


begin

  -- OP1. Contagem crescente.
  q <= reset_q(enable, q) when (areset  = '1') else 
       inc_q(enable, count_en, q) when low2high(clk);

end upcounter_a;
