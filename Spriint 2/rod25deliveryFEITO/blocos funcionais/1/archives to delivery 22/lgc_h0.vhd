-- codigo @Rodrigo Salgado (scrum master)

entity lgc_h0 is
	port(
		enable: in bit;
		gt: in bit;
		lt: in bit;
		
		lgc_out: out bit
	);
end lgc_h0;

architecture lgc_a of lgc_h0 is

begin

	lgc_out <= '1' when (gt = '0' and lt = '0' and enable = '1') else
					'0';
					-- red = '1' ativa
					-- veerde = '1' ativa
					-- azul entre 5 e 7 ativa

end lgc_a;