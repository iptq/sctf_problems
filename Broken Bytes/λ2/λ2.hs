import Data.Bits (xor)
import Data.Char (chr, ord)
import Data.Function (on)

f :: Integer -> Integer -> Integer
f _ 0 = 1
f n k 
 | n == k = 1
 | otherwise = f (n - 1) (k - 1) + f (n - 1) k

-- Solution:
-- f _ 0 = 1
-- f n k = ((n + 1 + k) `div` k) * f n (k - 1)

g :: String -> Integer -> String
g s n = zipWith (fmap chr . xor `on` ord) s $ show n

h :: String
h = "BUGPC^WGWCM_B\\SXFL"

main :: IO ()
main = putStrLn . g h $ f 3274 17
        
