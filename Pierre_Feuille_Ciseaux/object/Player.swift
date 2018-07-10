//
//  Player.swift
//  Pierre_Feuille_Ciseaux
//
//  Created by Erwan seveno on 10/07/2018.
//  Copyright © 2018 Erwan seveno. All rights reserved.
//

import UIKit

enum Symbol {
    case pierre
    case feuille
    case ciseaux
    
}

class Player: NSObject {
    
    public var score : Int = 0
    public var isAI : Bool = false
    public var whatPlayed : Symbol?
    
    func AIrandplay() -> Symbol{
        let rand : Int = Int(arc4random_uniform(3))
        
        switch rand {
        case 0:
            return .pierre
        case 1:
            return .feuille
        default:
            return .ciseaux
        }
    }
    
}
