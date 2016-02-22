ceebeecee
---------

Here we have an bad implementation of a CBC mode block cipher. Normally, in CBC, we xor the plaintext of the previous block with the current block to get the ciphertext (the first block gets xored with our IV). Here, however, we accidentally xor the ciphertext of the previous block with the current block. This makes it trivial to get all but the first character of the flag by xoring adjacent blocks together. Additionally, we've chosen an block size of 1 byte, which is bad in and of itself.
