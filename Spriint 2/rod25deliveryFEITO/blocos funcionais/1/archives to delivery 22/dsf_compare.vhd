
library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;


entity dsf_compare is

  port (
    -- Controle das saídas
    enable  :  in      bit;
	
	-- Dados de entrada na base decimal.
    dataa   :  in      integer range (2**4 - 1) downto 0;
    datab   :  in      integer range (2**4 - 1) downto 0;
	
	-- Entradas das comparações de cascateamento.
    gtin    :  in      bit;
    ltin    :  in      bit;
    eqin    :  in      bit;

    -- Saídas das comparações de cascateamento.
    gtout   :  buffer  bit;
    ltout   :  buffer  bit;
    eqout   :  buffer  bit
  );

end dsf_compare;


architecture compare_a of dsf_compare is  

  -- Buffers do código de cascateamento.
  signal  glein   :  bit_vector(2 downto 0);
  signal  gleout  :  bit_vector(2 downto 0);

begin

  -- OP1. Concatenação das entradas e saídas.
  glein <= gtin & ltin & eqin;
  gtout <= gleout(2);
  ltout <= gleout(1);
  eqout <= gleout(0);
  
  -- OP2. Resultado da comparação.
  gleout <= compare(dataa, datab, glein) when (enable = '1') else
            (others => '0');
  -- Obs.: A função compare é definida no pacote dsf_pack.vhd

end compare_a;
