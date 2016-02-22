pizazz
------

The core of this problem is simple, there's a table:

```
uint8_t grid[16][16] = {
        { 137, 180,  75,  95, 190, 106, 208, 112,  61,  52, 225, 118, 109,  70,  91, 132},
        { 238, 234, 196,   8, 252,  57,  47,   0,  94, 189,  25, 249, 166, 247, 229, 186},
        { 213,  21, 239,  64,   9, 103,  90,  74, 242, 156,  26, 241, 113,  82,  72,  12},
        { 124,  45, 235,  27, 114, 230, 130, 216, 121,  98, 125, 133,  97,  93, 150, 111},
        { 131,  59, 157,  78, 210, 177, 220,  13,   5, 100, 102, 142,  54, 141,  30,  62},
        {  83, 134,  48,  66, 215,  37,  35,  65,  96,  80, 221,  51,  10, 232, 205,  53},
        {  18, 120,  89, 192, 167, 123, 139, 200, 243, 162, 164, 246, 126,  50,  76,  85},
        { 155, 224, 223,  31,   1,  86, 104,  34,  36, 145, 116, 244,  32, 237, 110,   3},
        {  14,  71, 231,  44,  33, 176,  40, 158, 228, 122, 128, 138, 214, 209, 174,  39},
        {  56, 143,  11, 185, 217, 144, 136, 201, 206, 165,  55, 219, 161,  79, 255,  23},
        {  58, 170, 171,  84,  73, 184, 211,  16, 218,  67, 187, 172,  46, 119, 169, 188},
        { 147, 227, 127,   4, 148, 163,  60,  68, 248, 160, 254, 108, 226, 135, 153,  28},
        { 250, 115, 203, 183,  63, 240, 173, 182, 140, 181, 117,  81,  49, 175,  88, 207},
        { 154, 212, 178,  19, 101,  43, 195,  77, 194,  69, 222,   7, 253,  42, 152,  99},
        { 191,  41, 193, 251, 151,  38,  17, 233, 204, 202, 146, 198, 179,  87, 245, 168},
        { 159,   2,  20,  24,   6, 107,  15, 197, 236, 129, 199,  92, 149, 105,  22,  29}
};
```

And for each character in the input, we use its even bits (0x2, 0x8, 0x20, 0x80) for the first index, and its odd bits (0x1, 0x4, 0x10, 0x40) for the second index. We print that number, then shift the row for the second index to the left by 1 (moving the first element to the end).

Side note: the lookup actually looks up the coordinate of the point with the distance of the ASCII value of the character along a Z-order curve.

The hard part of the problem comes from the fact that all the loops in the program have been converted into computed goto's. This makes it difficult for disassemblers to actually give people an idea of the program's operation.

To solve the problem, we find the lookup table in the program, copy it, and then find the character that corresponds to each value we are given. Then we make sure to shift the row to the left.
