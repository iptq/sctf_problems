{-# LANGUAGE BangPatterns #-}

import Data.Bits (xor)
import Data.Char (chr, ord)
import Data.Function (on)
import Data.List (nub)
import Data.Numbers.Primes (primeFactors)
import Data.Ratio

cumulativePointSet :: (Integral a) => a -> a -> a
cumulativePointSet !a !m
  | a <= 2    = 0
  | otherwise = pow 2 (a + 1) m - (a^3 + 3 * a^2 + 8 * a + 12) `div` 6
{-# INLINE cumulativePointSet #-}

pointSet :: (Integral a) => a -> a -> a
pointSet !a !m
  | a <= 2    = 0
  | otherwise = pow 2 a m - (a^2 + a) `div` 2 - 1
{-# INLINE pointSet #-}
  
shortcat :: (Integral a) => a -> a -> a -> a -> a -> a
shortcat !a _ !x !n !m = pointSet (a + 1) m * (2 * (n + 1) - a * x)
{-# INLINE shortcat #-}

longcat :: (Integral a) => a -> a -> a -> a -> a -> a
longcat !a !b !x !n !m = (c * pointSet a m) + (d * cumulativePointSet (a - 1) m) + (e * shortcat a b x n m) + (f * shortcat (a - 1) b x n m)
    where
      !c = x * (b + 1) * 2
      !d = 2 * x^2
      !e = b + 1
      !f = x - b -1
{-# INLINE longcat #-}

initial :: (Integral a) => a -> a -> a
initial !n !m = (2 * b' * pointSet a m) + (4 * cumulativePointSet a'' m) + (b' * c * pointSet a' m) + (d * pointSet a m)
    where 
      !a = n `div` 2
      !b = n `rem` 2
      !c = n' - a
      !d = (1 - b) * (n' - a'')
      !n'  = n + 1
      !a'  = a + 1
      !a'' = a - 1
      !b'  = b + 1
      !b'' = b - 1
{-# INLINE initial #-}

powm :: (Integral a) => a -> a -> a -> a -> a
powm _ 0 _ !r = r
powm !b !e !m !r
  | e `mod` 2 == 1 = powm (b * b `mod` m) (e `div` 2) m (r * b `mod` m)
  | otherwise      = powm (b * b `mod` m) (e `div` 2) m r
{-# INLINE powm #-}

pow :: (Integral a) => a -> a -> a -> a
pow !b !e !m = powm b e m 1
{-# INLINE pow #-}

phi :: (Integral a) => a -> a
phi 1 = 1
phi n = numerator ratio `div` denominator ratio
    where ratio = foldl (\acc x -> acc * (1 - (1 % x))) (n % 1) $ nub (primeFactors n)
{-# INLINE phi #-}

f :: (Show a, Integral a) => a -> a -> a
f !n !m =
    let !r = loop i 3
        !q = pow 2 s m - 1 - s - (2 * n + 4) * pointSet (n + 1) m
        !s = (n + 1) ^ 2
        !i = u + cumulativePointSet n m
        !u = initial n m
        loop !t !k
          | k > (n `div` 2) = t
          | otherwise = loop (t + v) (k + 1)
            where
                !a = n `div` k
                !b = n `rem` k
                !p = flip div 2 $ phi k
                !v = p * longcat a b k n m
     in (q - 4 * r) `mod` m
{-# SPECIALIZE f :: Int -> Int -> Int #-}
{-# SPECIALIZE f :: Integer -> Integer -> Integer #-}

-- Solution:
-- f _ _ = 55859742

g :: String -> Integer -> String
g s n = zipWith (fmap chr . xor `on` ord) s $ show n

h :: String
h = "BSGVO_Q^TPWf[]R@PAK"

main :: IO ()
main = putStrLn . g h . (2^64 *) $ f (10^11) $ 10^8
        
