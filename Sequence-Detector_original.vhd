----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:21 11/20/2012 
-- Design Name: 
-- Module Name:    original - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use const.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity original is port(
	clock: in std_logic;
	reset: in std_logic;
	input: std_logic_vector(2 downto 0);
	digit1: out std_logic_vector(6 downto 0);
	digit2: out std_logic_vector(6 downto 0);
	digit3: out std_logic_vector(6 downto 0);
	digit4: out std_logic_vector(6 downto 0));
end original;

architecture Behavioral of original is
   	
		type state_type is (
    	   q0,
    	   q1,
    	   q2,
    	   q3,
    	   q4,
    	   q5,
    	   q6);
	
	signal state: state_type := q0;
	
begin

process(reset, clock, input)
begin
	--circuit selection on digit1
	--input symbols on digit2
	--states on digit3
	--outputs on digit4
	digit1 <= s_char_1;
	
	if(reset='1') then
		state <= q0;
		digit2 <= s_char_blank;
		digit3 <= s_char_0;
		digit4 <= s_char_blank;
		
	elsif(clock'event and clock='1') then
		
		case input is
			when IN_A => 
				digit2 <= s_char_a;
			when IN_B => 
				digit2 <= s_char_b;
			when IN_C =>
				digit2 <= s_char_c;
			when IN_OPEN => 
				digit2 <= s_char_open;
			when IN_CLOSE => 
				digit2 <= s_char_close;
			when others => 
				digit2 <= s_char_blank;
		end case;			
		
		case state is
		
			when q0 => 
			    case input is
			        when IN_OPEN => 
			            digit4 <= s_char_open;
			            state <= q2;
							digit3 <= s_char_2;
			        when others => 
			            
			    end case;
			when q1 => 
			    case input is
			        when IN_A => 
			            digit4 <= s_char_a;
			            state <= q1;
							digit3 <= s_char_1;
			        when IN_B => 
			            digit4 <= s_char_b;
			            state <= q1;
							digit3 <= s_char_1;
			        when IN_CLOSE => 
			            digit4 <= s_char_close;
			            state <= q6;
							digit3 <= s_char_6;
			        when others => 
			              
			    end case;
			when q2 => 
			    case input is
			        when IN_A => 
			            digit4 <= s_char_a;
			            state <= q1;
							digit3 <= s_char_1;
			        when IN_B => 
			            digit4 <= s_char_b;
			            state <= q3;
							digit3 <= s_char_3;
			        when IN_CLOSE => 
			            digit4 <= s_char_close;
			            state <= q6;
							digit3 <= s_char_6;
			        when others => 
			               
			    end case;
			when q3 => 
			    case input is
			        when IN_A => 
			            digit4 <= s_char_a;
			            state <= q4;
							digit3 <= s_char_4;
			        when IN_B => 
			            digit4 <= s_char_b;
			            state <= q1;
							digit3 <= s_char_1;
			        when IN_CLOSE => 
			            digit4 <= s_char_close;
			            state <= q6;
							digit3 <= s_char_6;
			        when others => 
			               
			    end case;
			when q4 => 
			    case input is
			        when IN_A => 
			            digit4 <= s_char_a;
			            state <= q1;
							digit3 <= s_char_1;
			        when IN_B => 
			            digit4 <= s_char_b;
			            state <= q5;
							digit3 <= s_char_5;
			        when IN_C => 
			            digit4 <= s_char_c;
			            state <= q4;
							digit3 <= s_char_4;
			        when IN_CLOSE => 
			            digit4 <= s_char_close;
			            state <= q6;
							digit3 <= s_char_6;
			        when others => 
			                
			    end case;
			when q5 => 
			    case input is
			        when IN_A => 
			            digit4 <= s_char_a;
			            state <= q4;
							digit3 <= s_char_4;
			        when IN_B => 
			            digit4 <= s_char_b;
			            state <= q5;
							digit3 <= s_char_5;
			        when IN_C => 
			            digit4 <= s_char_c;
			            state <= q4;
							digit3 <= s_char_4;
			        when IN_CLOSE => 
			            digit4 <= s_char_close;
			            state <= q6;
							digit3 <= s_char_6;
			        when others => 
			               
			    end case;
			when q6 =>			
				 			
			    state <= q6; 
				 digit3 <= s_char_6;
			when others => 
				 
				
		end case;
	end if;
end process;

end Behavioral;

