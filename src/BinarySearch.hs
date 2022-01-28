{-|
Module      :   BinarySearch
Description :   Binary search algorithm.
Copyright   :   (c) Fabio Thomaz Molinar, 2021
Maintainer  :   fabiomolinar@gmail.com
Stability   :   experimental

Implementation of the binary search algorithm. This algorithm considers 
that the input array is already sorted. For this module, I am going to 
output a `Maybe Index`, where index is the position of the searched
element on the array. Returns `Nothing` otherwise.

Algorithm description [reference](https://www.techiedelight.com/binary-search/)
The idea is to use binary search which is a Divide and Conquer algorithm. 
Like all divide-and-conquer algorithms, binary search first divides a large
array into two smaller subarrays and then recursively (or iteratively) 
operate the subarrays. But instead of working on both subarrays, 
it discards one subarray and continues on the second subarray. 
This decision of discarding one subarray is made in just one comparison.

So binary search reduces the search space to half at each step. By search 
space, we mean a subarray of the given array where the target value is 
located (if present in the array). Initially, the search space is the entire 
array, and binary search redefines the search space at every step of the 
algorithm by using the property of the array that it is sorted. It does 
so by comparing the mid-value in the search space to the target value. 
If the target value matches the middle element, its position in the array 
is returned; otherwise, it discards half of the search space based on the 
comparison result.
-}

module BinarySearch where

binarySearch :: (Eq a, Ord a) => a -> [a] -> Maybe Int
binarySearch el [] = Nothing
binarySearch el [a] = if el == a then Just 0 else Nothing
binarySearch el xs
    | el == l   = Just $ m - 1
    | el < l    = fmap (m-) (binarySearch el $ init lh)
    | otherwise = fmap (m+) (binarySearch el uh) 
    where
        m = length xs `div` 2
        lh = take m xs
        uh = drop m xs
        l = last lh
    
