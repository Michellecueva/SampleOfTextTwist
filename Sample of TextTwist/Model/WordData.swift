//
//  WordData.swift
//  Sample of TextTwist
//
//  Created by Michelle Cueva on 8/6/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation
import UIKit

class WordData {
    static let allInfo: [TestTwistInfo] = [
        TestTwistInfo(wordCount: 27,
                      letters: "cdenno",
                      words: ["conned", "coden","coned", "donne", "nonce","code","coed","cone","conn","deco","done","neon","node","none","once", "cod","con","den","doc","doe","don","end","eon","nod","ode","one"]),
        TestTwistInfo(wordCount: 18,
                      letters: "ehhssu",
                      words: ["hushes", "shush", "hehs","hues","hush","shes","sues","uses", "ess","heh","hes","hue","huh","she","shh","sue","use"]),
        TestTwistInfo(wordCount: 14,
                      letters: "hisswy",
                      words: ["swishy", "hissy","swish", "hiss","whys","wish","wiss","ywis", "his","shy","sis","why","wis"])
    ]
    
    static func getGameInfo() -> TestTwistInfo {
        return WordData.allInfo.randomElement()!// to not force unwrap I can make the return an optional but in this case we want to make sure we are definitely returning a testTwistInfo so we don't have the control dealing with that logic 
    }
    
    
    
}
