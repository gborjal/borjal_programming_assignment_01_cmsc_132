-------------------------------------------------
--used http://www.32x8.com/ as resource for kmapping and simplification
-- Author: Gabriel Luis G. Borjal
-- Std-num: 2010-24697
-------------------------------------------------

library IEEE; 
use IEEE.std_logic_1164.all;

entity alarm is 
	port(a,b,c,d,e,f: in std_logic; z:out std_logic);
end alarm;

architecture behav of alarm is
	begin
		z <= ((e and f)or(d and e)or(c and f)or(c and d)or(b and e)or(b and c)or(a and f)or(a and d)or(a and b));
	end architecture behav;
