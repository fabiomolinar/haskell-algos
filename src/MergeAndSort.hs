{-|
Module      :   MergeAndSort
Description :   Merge and sort algorithm.
Copyright   :   (c) Fabio Thomaz Molinar, 2021
Maintainer  :   fabiomolinar@gmail.com
Stability   :   experimental

Implementation of the merge and sort algorithm. It takes an
unordered list as an input and returns an ordered list.

Algorithm description [reference](https://isaaccomputerscience.org/concepts/dsa_search_merge)
A merge sort is a sorting algorithm that starts by splitting 
an unordered list of items into two halves called sublists. 
Then the algorithm repeatedly splits the sublists into smaller 
sublists until it reaches sublists of single elements. These 
single element sublists are then merged in pairs to form sublists 
of two items. In the process of merging the items are ordered. 
This process is repeated until, in the final step, the two ordered 
halves are merged together to form a single ordered list. 
As a result, the whole list is sorted.

I'll divide this algorithm into the following steps:

    (1) Split
    2.  Merge
-}

module MergeAndSort where

split :: [a] -> ([a], [a])
split [] = ([],[])
split xs = (take l xs, drop l xs)
    where l = length xs `div` 2

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y     = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

mergeAndSort :: Ord a => [a] -> [a]
mergeAndSort [] = []
mergeAndSort [a] = [a]
mergeAndSort xs = merge (mergeAndSort $ fst splited) (mergeAndSort $ snd splited)
    where splited = split xs