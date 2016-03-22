// compile: rustc -O oracle.rs
#![crate_name = "oracle"]
#![crate_type = "dylib"]

use std::slice;

#[no_mangle]
pub unsafe extern "C" fn hash(data_ptr: *const u8, data_size: u32) -> u64 {
    hash_impl(slice::from_raw_parts(data_ptr, data_size as usize))
}

fn hash_impl(data: &[u8]) -> u64 {
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