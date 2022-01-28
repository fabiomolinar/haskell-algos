{-|
Module      :   DepthFirstSearch
Description :   Depth-First Search (BFS) algorithm.
Copyright   :   (c) Fabio Thomaz Molinar, 2021
Maintainer  :   fabiomolinar@gmail.com
Stability   :   experimental

Implementation of the depth first search algorithm. This algorithm 
runs on tree or graph data structures.

Algorithm description [reference](https://www.techiedelight.com/depth-first-search/)
Depth–first search (BFS) is an algorithm for traversing or searching 
tree or graph data structures. It starts at the tree root (or some 
arbitrary node of a graph, sometimes referred to as a ‘search key’) and 
explores the neighbor nodes first before moving to the next-level neighbors.
-}

module DepthFirstSearch where

import Data.Tree
import Data.List (foldl')

{- 
Tree data constructor for reference:
data Tree a = Node {
        rootLabel :: a,         -- ^ label value
        subForest :: [Tree a]   -- ^ zero or more child trees
    }
-}

depthFirstSearch :: Eq a => a -> Tree a -> Tree Bool
depthFirstSearch a (Node b []) = Node (a == b) []
depthFirstSearch a (Node b fr) = Node (a == b) (map (depthFirstSearch a) fr)

depthFirstFound :: (Eq a) => a -> Tree a -> Bool
depthFirstFound a (Node b []) = if a == b then True else False
depthFirstFound a (Node b fr) = if a == b then True else foldl' (\acc t -> acc || depthFirstFound a t) False fr