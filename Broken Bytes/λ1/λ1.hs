import Data.Bits (xor)
import Data.Char (chr, ord)
import Data.Function (on)

f :: Integer -> Integer
f 1 = 2
f n = f (n - 1) + f (n - 1)
-- Solution: 
-- f n = 2 ^ n

g :: String -> Integer -> String
g s n = zipWith (fmap chr . xor `on` ord) s $ show n

h :: String
h = "BPF_IF_PW^^VSNXAPCZL^XKM"

main :: IO ()
main = putStrLn . g h $ f 120
        
