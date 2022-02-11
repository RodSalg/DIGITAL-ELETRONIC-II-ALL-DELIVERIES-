entity logic is
	port(
		gt: in bit;
		lt: in bit;
		logic_out: out bit
	);
end logic;

architecture logic_a of logic is
begin
	logic_out <= '1' when gt = '1' else
	             '0';

end logic_a;