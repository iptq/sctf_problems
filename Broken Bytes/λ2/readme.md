Gotta do some reversing here.
You need to find the user code (putStrLn is a good way to do it).
Then, you need to understand what's happening.
The encryption function is given away by the use of xor, ord, and chr (it's OTP).
All that's left is to figure out the algorithm and to implement it efficiently.

This one is an inefficient version of binomial coefficients (the addition-based definition).

