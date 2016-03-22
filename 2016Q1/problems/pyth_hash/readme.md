# Pythagoras' hash

A really bad hash function brewed in an hour.

    fn hash(data: &[u8]) -> [u8; 8] {
        use std::mem;
        fn b2f64(data: &[u8]) -> f64 {
            let mut buf = [0u8; 8];
            for (i, &x) in data.iter().enumerate().take(8) {
                buf[i] = x;
            }
            (unsafe { mem::transmute::<_, u64>(buf) }) as f64
        }
        
        let r = {
            fn work(data: &[u8]) -> u64 {
                let (one, two) = {
                    let mut chunks = data.chunks(8);
                    let first = chunks.next();
                    (b2f64(first.unwrap_or(&[])), b2f64(chunks.next().unwrap_or(first.unwrap_or(&[]))))
                };
                one.hypot(two) as u64
            }
            
            (0..data.len()).fold(0u64, |x, y| x ^ (work(&data[y..]) as u64))
        };
        
        unsafe { mem::transmute(r) }
    }

## Hints given in the problem text

* "Pythagoras' hash"
* "Sliding window"
* The inclusion of the `b2f64` function not used anywhere except `work`

## The flag

    hash("the flag the flag the flag the flag the flag the flag the flag the game") = 85a893e7a21e7658

Thus the flag is `sctf{85a893e7a21e7658}`.