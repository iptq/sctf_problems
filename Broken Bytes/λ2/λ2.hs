import Data.Bits (xor)
import Data.Char (chr, ord)
import Data.Function (on)

f :: Integer -> Integer -> Integer
f _ 0 = 1
f n k 
 | n == k = 1
 | otherwise = f (n - 1) (k - 1) + f (n - 1) k

-- Solution:
-- f _ _ = 1538856934150604268232070485560186266135556504

g :: String -> Integer -> String
g s n = zipWith (fmap chr . xor `on` ord) s $ show n

h :: String
h = "BVG^C\\YOVFE]EX[]FK"

main :: IO ()
main = putStrLn . g h $ f 3274 17
        
