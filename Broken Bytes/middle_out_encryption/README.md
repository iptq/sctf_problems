Middle-out Encryption
---------------------

For each byte in the input, we simply take the middle two bits (`00011000`), and move them to the end (`11000000`), while moving the three bits at the end (`11100000`) to the middle (`00111000`). We can easily do this process in reverse and get our flag.
