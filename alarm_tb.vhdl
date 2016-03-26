-------------------------------------------------
-- Author: Gabriel Luis G. Borjal
-- Std-num: 2010-24697
-------------------------------------------------
library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alarm_tb is
end;

architecture alarm_tb of alarm_tb is
	signal a,b,c :std_logic;
	component alarm is
		port(a,b,c,d,e,f: in std_logic; z:out std_logic);
	end component;
	
	begin
		uut:component alarm port map(a,b,c,e,f,z);
		process
			variable error_count: integer:=0;
			variable inputs:      unsigned(1 downto 0);
			variable output:     std_logic;			
			begin
				inputs := B"000000";
				for count in 0 to 63 loop
					a <= inputs(0);
					b <= inputs(1);
					c <= inputs(2);
					d <= inputs(3);
					e <= inputs(4);
					f <= inputs(5);
					wait for 10 ns;
					output := 0 or 1;
					
					assert(output=z) report "OR design ERR!"
						severity error;
					if(output /= z) then 
						error_count:=error_count+1;
					end if;
					inputs := inputs+1;
				end loop;
				report "Done with test. Errors: " &	integer'image(error_count);
				wait;
			end process;
	end architecture;

