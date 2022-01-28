{-|
Module      :   BreadthFirstSearch
Description :   Breadth-First Search (BFS) algorithm.
Copyright   :   (c) Fabio Thomaz Molinar, 2021
Maintainer  :   fabiomolinar@gmail.com
Stability   :   experimental

Implementation of the breadth first search algorithm. This algorithm 
runs on tree or graph data structures.

Algorithm description [reference](https://www.techiedelight.com/breadth-first-search/)
Breadth–first search (BFS) is an algorithm for traversing or searching 
tree or graph data structures. It starts at the tree root (or some 
arbitrary node of a graph, sometimes referred to as a ‘search key’) and 
explores the neighbor nodes first before moving to the next-level neighbors.
-}

module BreadthFirstSearch where

import Data.Tree

{- 
Tree data constructor for reference:
data Tree a = Node {
        rootLabel :: a,         -- ^ label value
        subForest :: [Tree a]   -- ^ zero or more child trees
    }
-}

breadthFirstSearch :: Eq a => a -> Tree a -> Tree Bool
breadthFirstSearch a t = undefined