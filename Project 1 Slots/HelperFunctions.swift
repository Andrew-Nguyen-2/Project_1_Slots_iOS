//
//  HelperFunctions.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/7/22.
//

import SwiftUI

func getRandomValues() -> Array<Int> {
    return [Int.random(in: 0..<Constants.NUMB_FLOWERS),
            Int.random(in: 0..<Constants.NUMB_FLOWERS),
            Int.random(in: 0..<Constants.NUMB_FLOWERS)]
}

func checkMatchingFlowers(flowerIndexList: Array<Int>) -> Int {
    var flower1 = 0
    var flower2 = 0
    var flower3 = 0
    
    for flower in flowerIndexList {
        if flower == 0 {
            flower1 += 1
        }
        else if flower == 1 {
            flower2 += 1
        }
        else {
            flower3 += 1
        }
    }
    
    if flower1 == 2 || flower2 == 2 || flower3 == 2 {
        return Constants.MATCH_2
    }
    else if flower1 == 3 || flower2 == 3 || flower3 == 3 {
        return Constants.MATCH_3
    }
    
    return Constants.MATCH_0
}
