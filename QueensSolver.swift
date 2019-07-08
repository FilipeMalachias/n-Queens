//
//  QueensSolver.swift
//  SwiftAlgorithms
//
//  Created by Filipe Malachias Resende on 2019-07-04.
//  Copyright © 2019 malachias. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
@discardableResult
func solveQueens(board: inout Board, col: Int) -> Bool {
    // base case(no choice)
    count += 1
    if col >= board.size
    {
        // stop! no more choices to make
        print(board)
        print(count)
        return true
    } else
    {
        // recursive case
        for row in 0..<board.size
        {
            if board.isSafe(row: row, col: col)
            {
                // choose one
                board.place(row: row, col: col)
                // explore
                if solveQueens(board: &board, col: col + 1)
                {
                    return true
                }
                // unchoose
                board.remove(row: row, col: col)
            }
        }
        return false
    }
}
