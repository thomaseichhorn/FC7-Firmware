-- Address decode logic for ipbus fabric
--
-- This file will be AUTOGENERATED from the address table - do not hand edit
--
-- We assume the synthesis tool is clever enough to recognise exclusive conditions
-- in the if statement.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.system_package.all;
use work.ipbus.all;

package ipbus_addr_decode is

  function ipbus_addr_sel(signal addr : in std_logic_vector(31 downto 0)) return integer;

end ipbus_addr_decode;

package body ipbus_addr_decode is

  function ipbus_addr_sel(signal addr : in std_logic_vector(31 downto 0)) return integer is
    variable sel : integer;
  begin
		if    std_match(addr, "000000000000000000000000--------") then sel := sys_regs; 	-- system registers 1024bytes-> 256 regs
		elsif std_match(addr, "00000000000000000000001000000000") then	sel := icap; 		-- icap							  
		elsif std_match(addr, "000000000000000000000100000000--") then	sel := uc;	 		-- uc		
		else	
			sel := 99;
		end if;
		return sel;
	end ipbus_addr_sel;
 
end ipbus_addr_decode;
