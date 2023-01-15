-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_mat_mul_2_layer9_weights_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 256
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of nn_inference_mat_mul_2_layer9_weights_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111111110000010111110101111001", 
    1 => "00111111101000001100101100111000", 
    2 => "10111111101010011011000101011001", 
    3 => "10111111100000110110101100010011", 
    4 => "00111110101111101100001101010100", 
    5 => "10111110010110011000100001100001", 
    6 => "00111110111111111001011110011010", 
    7 => "00111111000111100100010001000000", 
    8 => "10111110100000011101110011110111", 
    9 => "00111110100110010001101000111100", 
    10 => "10111111110010110001011110101101", 
    11 => "00111110011111011010110101000001", 
    12 => "00111110111101000101001000010101", 
    13 => "10111101100011101100101011110000", 
    14 => "00111111001001000100010100101101", 
    15 => "10111110000001111000110001100001", 
    16 => "00111101111111011010100001100011", 
    17 => "00111111000110011100100101001111", 
    18 => "10111110110001010100100101000010", 
    19 => "00111110101110110000010101100110", 
    20 => "00111110100000100001000010001101", 
    21 => "10111110000110101110101011001010", 
    22 => "10111110100111011000101011100111", 
    23 => "10111101000000010101000101101001", 
    24 => "10111101010110101111100110011100", 
    25 => "10111110100011110000100001000111", 
    26 => "00111110100110101110010101000101", 
    27 => "10111110101010001000110010001011", 
    28 => "00111110010111111100010100010001", 
    29 => "10111101001110111100011111000110", 
    30 => "10111111001110011011011001001100", 
    31 => "00111101110100001111100101110000", 
    32 => "10111110101001001110110001011110", 
    33 => "10111111110011101010001100000000", 
    34 => "00111111100110001001010101010110", 
    35 => "10111110101001100001001010011111", 
    36 => "00111110101100000000100001101011", 
    37 => "00111111100011000101000111110111", 
    38 => "00111111000111111110101010010100", 
    39 => "10111110011101010100101101101110", 
    40 => "00111111000100011010001000011110", 
    41 => "00111110110100110011101011101100", 
    42 => "10111110110110111000110011001010", 
    43 => "00111110011000101101110101100111", 
    44 => "00111110101000110101100110110110", 
    45 => "00111110001101011101010001110111", 
    46 => "10111110010000001111101111010011", 
    47 => "00111110100001110100011110110010", 
    48 => "00111111000000001111000010101100", 
    49 => "10111111001000100100000110011110", 
    50 => "00111111001010111100101101111011", 
    51 => "10111110100001111100101011000000", 
    52 => "10111101101011011000100110101101", 
    53 => "10111110010001111011011011010011", 
    54 => "00111111001100010010100000100010", 
    55 => "00111110111100110010001010000101", 
    56 => "00111111000000000100111010100001", 
    57 => "00111110101011001000100000010111", 
    58 => "10111110100001100001110001100101", 
    59 => "00111110101010001011110000000111", 
    60 => "00111110111010010101111111101101", 
    61 => "00111110010001000001100100110110", 
    62 => "00111101011100011010010111111100", 
    63 => "00111110000000110111110001010011", 
    64 => "10111110101000011001011100101100", 
    65 => "10111111100101001100101111000001", 
    66 => "00111111100011110101000001110101", 
    67 => "10111111010111110011001101001010", 
    68 => "10111110010100100100000001010001", 
    69 => "00111111100110100100000000101010", 
    70 => "00111111000111001111011010110011", 
    71 => "10111110000100001111000101110100", 
    72 => "00111111001001001100000100001100", 
    73 => "00111110100110101010111110101101", 
    74 => "00111110001001000000100010110111", 
    75 => "00111110100010100111010111101011", 
    76 => "00111110101101111100000100000010", 
    77 => "00111110001110100110101101011100", 
    78 => "00111101110000010101111010111101", 
    79 => "10111110000001101000101101100110", 
    80 => "00111110110011010110000010100011", 
    81 => "10111110110010111000100101101001", 
    82 => "00111110010010111010100101010001", 
    83 => "00111110100100111100011111001101", 
    84 => "00111110101101111011001111110111", 
    85 => "10111110011111001010000011000111", 
    86 => "10111101101101010111100100100101", 
    87 => "00111110000001100000011100011110", 
    88 => "00111110010000101010110000011010", 
    89 => "00111110110011011000100000111000", 
    90 => "10111110011011001000101010110111", 
    91 => "00111110100000000111101000101110", 
    92 => "00111101100111111011001111011001", 
    93 => "00111110010111000000111111001110", 
    94 => "00111110010011111010111010011011", 
    95 => "00111110101000011111101011010001", 
    96 => "00111111011111101111111110101110", 
    97 => "10111111100110000100000011000111", 
    98 => "00111101001010010111011110011001", 
    99 => "00111110100100000101111101111110", 
    100 => "00111110100110011000111010000010", 
    101 => "10111110110101001111100111101001", 
    102 => "00111110000001110011010000000001", 
    103 => "00111101101000001001100110110011", 
    104 => "10111101110100111111010101101110", 
    105 => "00111101010101111000101111011100", 
    106 => "10111110101010000111001010101001", 
    107 => "00111110001011110010111101010110", 
    108 => "10111100000010100100110111101011", 
    109 => "10111111001101011011110100101100", 
    110 => "10111110000110000101111110100001", 
    111 => "10111110110011011111010010101001", 
    112 => "10111101111001011011110000010111", 
    113 => "10111111110010000100001111111010", 
    114 => "10111111100011110010001101011011", 
    115 => "10111111100010000000011111111000", 
    116 => "10111110101111010101100110000111", 
    117 => "00111101000001100011010001110111", 
    118 => "00111110110110001011011111100010", 
    119 => "00111110100010100011000110111011", 
    120 => "10111011000010011001011101000101", 
    121 => "00111111011001000001010010101000", 
    122 => "00111110100111010010001011000100", 
    123 => "10111110110010110010110001010111", 
    124 => "00111110111101010111001100100001", 
    125 => "00111111000111011011011110001011", 
    126 => "00111111011111111010100001010010", 
    127 => "10111110100100000100101111010110", 
    128 => "00111110100010101010111110100001", 
    129 => "10111110101001100001101011011000", 
    130 => "00111110011000010001101101000111", 
    131 => "10111110001111010010111110000011", 
    132 => "10111110011110100000101101110011", 
    133 => "10111110100110111000111110111111", 
    134 => "10111100110100101001001111101010", 
    135 => "10111110100010001111011000110100", 
    136 => "00111110000000101101100011100110", 
    137 => "10111110000000000000100010110001", 
    138 => "10111011111101110101100111000000", 
    139 => "10111110101011001100110100111110", 
    140 => "00111110100001111110110001101011", 
    141 => "10111110100000101001101100011110", 
    142 => "10111110100010011010111001010001", 
    143 => "10111110110000010001110001010111", 
    144 => "10111110011000001000111100001110", 
    145 => "10111101111111100110100111111100", 
    146 => "10111101000110101110001111101000", 
    147 => "00111100101101110010110100000100", 
    148 => "00111110010000010011100110110100", 
    149 => "10111110001011101000000000111100", 
    150 => "10111110101110111111110100110001", 
    151 => "10111110000101110000001101111000", 
    152 => "10111101011011101100100101101100", 
    153 => "10111110010100011101101110110010", 
    154 => "10111110011000010010101100010000", 
    155 => "10111101001001000010010110101011", 
    156 => "10111101110000110000100100000000", 
    157 => "10111101100011010010100010111011", 
    158 => "00111101100011111011111010100000", 
    159 => "10111100010000001110100000000000", 
    160 => "10111111110100101110111101010110", 
    161 => "00111111011010100111000011001101", 
    162 => "10111111001000001010101011111001", 
    163 => "11000000000011010011101011111011", 
    164 => "00111110101010100011001111110111", 
    165 => "10111111000001000011111011101110", 
    166 => "00111011100000100100100000010110", 
    167 => "00111111101011010110110010001001", 
    168 => "00111100010011000111010010110100", 
    169 => "00111111000011100100000011101101", 
    170 => "10111111001111101111111000010110", 
    171 => "00111110111001110111000011010110", 
    172 => "00111110001100011010000000101001", 
    173 => "00111111001000001100100010100100", 
    174 => "00111111001100000001000000010000", 
    175 => "00111111010100010011110011010011", 
    176 => "00111110011101001100011101110000", 
    177 => "00111111010010100010001011111110", 
    178 => "00111110110011000100010100010001", 
    179 => "00111111001101000101111000110001", 
    180 => "00111110010011111100110011111001", 
    181 => "00111110001011010011011000111001", 
    182 => "10111110001000000110010100110000", 
    183 => "00111100101110110001100001101100", 
    184 => "00111111000011010000010110111000", 
    185 => "10111111110110000101000101100010", 
    186 => "10111101011101101000101010010010", 
    187 => "00111100101001110011010010111001", 
    188 => "00111110100110011011001101100100", 
    189 => "00111101100101110001110001001000", 
    190 => "10111111101001100010110101100010", 
    191 => "00111111001111000011110010111101", 
    192 => "10111110010000110000101100101101", 
    193 => "00111110100011101111110000000111", 
    194 => "10111110110010100101011000100010", 
    195 => "00111101000000000110110111001010", 
    196 => "00111110100001100101101100100101", 
    197 => "10111101101101101010000010101010", 
    198 => "10111110101110100100101011100101", 
    199 => "10111110010101101010100010000110", 
    200 => "10111110101101011000101101101001", 
    201 => "10111101111111111101000001010100", 
    202 => "10111110101111010101101111101000", 
    203 => "10111101010111011111001000101111", 
    204 => "10111110001101011001101000100100", 
    205 => "10111101100101100011011101110101", 
    206 => "00111110010100010001001010011110", 
    207 => "00111110010000111110000001110001", 
    208 => "10111110000001110000111111000110", 
    209 => "00111110011100010110010100001001", 
    210 => "10111110101101101011010011001010", 
    211 => "10111110001110100110100001010011", 
    212 => "00111101101110101110111010001011", 
    213 => "10111110011010110011111100101101", 
    214 => "00111101001100000001000001100011", 
    215 => "00111100100000110000010100011011", 
    216 => "10111101000110001100101100100000", 
    217 => "10111110110101011101000100111100", 
    218 => "00111011101000110111110000100010", 
    219 => "00111110100000110000010010100101", 
    220 => "00111110001100110010010000110101", 
    221 => "10111101101101100011100001001010", 
    222 => "10111110101111010000000101010011", 
    223 => "10111110000000110010011000001011", 
    224 => "10111111110111100001101110000110", 
    225 => "10111111001010111101111111000011", 
    226 => "00111111011001111010111000000100", 
    227 => "10111111111111010010011101011101", 
    228 => "00111111000010001101011001101100", 
    229 => "00111111001000011101001011011011", 
    230 => "00111101101110110111001010010111", 
    231 => "00111110011100110010110000100011", 
    232 => "10111101111100010110101100110110", 
    233 => "00111110100100110101011111111011", 
    234 => "10111111011110110001110001000100", 
    235 => "00111110101110111001011010011110", 
    236 => "00111100011110101111010101001110", 
    237 => "00111110011010101001101100111001", 
    238 => "00111111001011001110100110101001", 
    239 => "00111111000010011100101000110101", 
    240 => "10111110011000110100000100000010", 
    241 => "00111110100100101011100100111110", 
    242 => "00111111000110000001010101000101", 
    243 => "00111111000101110100010111001111", 
    244 => "10111110000110000110111000000100", 
    245 => "00111011011011111010011000101100", 
    246 => "00111110110110101010100100011100", 
    247 => "00111110100000111010010110011111", 
    248 => "10111100101000010111110011110101", 
    249 => "10111111000110100100011100100110", 
    250 => "00111101110011111000000111111110", 
    251 => "00111110111101101001110010100000", 
    252 => "00111110111000101011100001100111", 
    253 => "00111110111111100101010010110111", 
    254 => "10111111010100110111011010011000", 
    255 => "00111111001001100110010010011110" );


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

entity nn_inference_mat_mul_2_layer9_weights is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 256;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of nn_inference_mat_mul_2_layer9_weights is
    component nn_inference_mat_mul_2_layer9_weights_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_mat_mul_2_layer9_weights_rom_U :  component nn_inference_mat_mul_2_layer9_weights_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

