library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_light_tb is 
end entity;

architecture traffic_light_tb_behavior of traffic_light_tb is
	constant ClockFrequencyHz : integer := 100; -- 100 Hz
   	constant ClockPeriod      : time := 1000 ms / ClockFrequencyHz;
	
	signal Clk     : std_logic := '1';
    signal nRst    : std_logic := '0';
    signal milliseconds : integer;
    signal seconds : integer;
begin
 
    -- The Device Under Test (DUT)
    i_Timer : entity work.counter
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        Clk     => Clk,
        nRst    => nRst,
        milliseconds => milliseconds,
        seconds => seconds);
 
    -- Process for generating the clock
    Clk <= not Clk after ClockPeriod / 2;
 
    -- Testbench sequence
    process is
    begin
        wait until rising_edge(Clk);
 
        -- Take the DUT out of reset
        nRst <= '1';
 
        wait;
    end process;
 
end architecture;