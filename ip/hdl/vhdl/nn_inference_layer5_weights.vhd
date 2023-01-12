-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_layer5_weights_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 7; 
             MEM_SIZE    : integer := 128
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of nn_inference_layer5_weights_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111101111001000010011010001010", 
    1 => "10111101101110101110011101001111", 
    2 => "10111110101000100110110011100111", 
    3 => "10111110110110000001010111010011", 
    4 => "10111110110110100001011010010011", 
    5 => "10111101110010010100100010110000", 
    6 => "00111101101010111110110111001101", 
    7 => "10111110100010101110111111101000", 
    8 => "00111110000111110101011111100111", 
    9 => "10111110110010111101001111001100", 
    10 => "00111110110111100011000011000100", 
    11 => "00111101101010011000110111000000", 
    12 => "10111101101111000011001000010000", 
    13 => "10111101011100010001011010100000", 
    14 => "00111110100101010000011100001101", 
    15 => "10111111010000100000101010110010", 
    16 => "00111110100100010111010000000110", 
    17 => "10111111000010110001000111011111", 
    18 => "00111110110110011111010110001011", 
    19 => "10111101011001010010001001111111", 
    20 => "00111110101011011011111000000000", 
    21 => "00111100000100001111011110011001", 
    22 => "00111110101111111001111011001010", 
    23 => "00111111000011110000101011101010", 
    24 => "10111111001111101000100100100100", 
    25 => "10111110011000010001011101001111", 
    26 => "10111110011101101011000110101111", 
    27 => "10111110100000101111111010001011", 
    28 => "00111110110101011000010010000100", 
    29 => "10111100001111101011100010000000", 
    30 => "00111111000010011111001001111100", 
    31 => "10111110000011110101111110010011", 
    32 => "00111110011000100011110100010100", 
    33 => "00111110110111001101011000000010", 
    34 => "10111111000000000000110010001010", 
    35 => "10111101110110101100011000100101", 
    36 => "10111101110110010101000000101001", 
    37 => "00111101001001000001010101011110", 
    38 => "00111111000011001101111011111100", 
    39 => "10111100110100110111001101100100", 
    40 => "10111110101101011011111110111100", 
    41 => "10111110100011001001001011010100", 
    42 => "10111110110010100110110001001000", 
    43 => "00111110111001011000001111100100", 
    44 => "10111110101110001110101000001100", 
    45 => "00111110111010001110010001111100", 
    46 => "00111110111110101010001010101100", 
    47 => "10111110101110000001101110010100", 
    48 => "00111100101100110111010001101111", 
    49 => "00111110001111110101110100001111", 
    50 => "10111110100110111100100010101100", 
    51 => "00111110101111100001001010110000", 
    52 => "00111110110111011000001100011001", 
    53 => "10111110101011111111000100001111", 
    54 => "10111101000101010101000101010010", 
    55 => "00111101111010110111000100000010", 
    56 => "10111110000110000011110000100100", 
    57 => "00111111000000110111010110010001", 
    58 => "00111110001111111100000111101010", 
    59 => "00111110010010100110000001001000", 
    60 => "10111110101011000100000100010000", 
    61 => "10111110001011010011001101111010", 
    62 => "10111110101000101011111011101011", 
    63 => "00111110110001011101011101100011", 
    64 => "10111110011010101111101000000000", 
    65 => "10111110010110111110111101001000", 
    66 => "10111110111111110101111001101100", 
    67 => "00111101101111110110001111100000", 
    68 => "00111101100010111110011010000000", 
    69 => "10111110010010001101000100110000", 
    70 => "10111110101100011100010010111100", 
    71 => "00111110100111100010001110100000", 
    72 => "10111110101110010011000001100011", 
    73 => "10111111010010011011000110010110", 
    74 => "00111110101111011001111110000111", 
    75 => "10111110001100110101001011000010", 
    76 => "00111110001011111001111101001110", 
    77 => "10111110110010100000001100010010", 
    78 => "00111111000001110001101111111000", 
    79 => "00111110000110011111001000011001", 
    80 => "10111100000010100111101001111110", 
    81 => "00111110110101011110000100001011", 
    82 => "00111100010101000110010100000000", 
    83 => "10111110100000111011111101110000", 
    84 => "00111110101000110111011100011011", 
    85 => "00111100001101101101001110111101", 
    86 => "10111100001010000111110000100011", 
    87 => "10111110101010011100000111111000", 
    88 => "10111100101111111101101011101010", 
    89 => "10111110111100111100010011011100", 
    90 => "00111110100001001101111000110111", 
    91 => "10111110101010001011110010010000", 
    92 => "10111101110001011001100001100111", 
    93 => "10111110100001010110110001110100", 
    94 => "10111110011111110010101001000110", 
    95 => "00111110110110101010100010011111", 
    96 => "00111110000000110111010011010010", 
    97 => "10111111001001101010010110000110", 
    98 => "10111110101000100010000010001010", 
    99 => "00111110010101111111100001101001", 
    100 => "10111110001110011110011110011000", 
    101 => "00111101101001110010110111101011", 
    102 => "00111110110010110000110110000001", 
    103 => "00111100110011100110011010001010", 
    104 => "10111101100011000101101111101011", 
    105 => "10111110111010110010111111011101", 
    106 => "10111110001100110011011101001000", 
    107 => "10111110111011011001110110000100", 
    108 => "00111110110111001100100100110100", 
    109 => "00111110100010111101000110011000", 
    110 => "00111110101110001101000111111101", 
    111 => "00111110101100010000000111110111", 
    112 => "00111110101101101100101001010010", 
    113 => "10111110101000000110111110101110", 
    114 => "10111110110001111010000100010100", 
    115 => "00111101101011000010001000000000", 
    116 => "00111110101110100111010010101010", 
    117 => "00111110001101100010000010001000", 
    118 => "00111111000000010011110001111000", 
    119 => "10111110100000010001100001110100", 
    120 => "00111110001111101010011110111000", 
    121 => "00111110101011101010010101100100", 
    122 => "10111101110111000001010000000000", 
    123 => "00111110100011100110101111100100", 
    124 => "10111110110011011011000110100000", 
    125 => "10111110010110111010101000001000", 
    126 => "10111110010111000110000111110000", 
    127 => "00111110110011001110010010100000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity nn_inference_layer5_weights is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 128;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of nn_inference_layer5_weights is
    component nn_inference_layer5_weights_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_layer5_weights_rom_U :  component nn_inference_layer5_weights_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

