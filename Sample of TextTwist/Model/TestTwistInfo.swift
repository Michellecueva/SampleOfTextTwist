//
//  Data.swift
//  Sample of TextTwist
//
//  Created by Michelle Cueva on 8/6/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation
import  UIKit

struct TestTwistInfo {
    let wordCount: Int
    let letters: String
    let words: [String]
    
    func verifyGuess(guess: String) -> Bool {
        return words.contains(guess)
    }
    
    
    
}


