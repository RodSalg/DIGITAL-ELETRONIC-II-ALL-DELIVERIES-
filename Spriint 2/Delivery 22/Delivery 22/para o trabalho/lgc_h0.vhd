-- codigo @Rodrigo Salgado (scrum master)

entity lgc_h0 is
	port(
		gt: in bit;
		lt: in bit;
		lgc_out: out bit
	);
end lgc_h0;

architecture lgc_a of lgc_h0 is

begin
	lgc_out <= '1' when gt = '1' else
	'0';

end lgc_a;