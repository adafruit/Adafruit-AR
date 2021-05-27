//
//  Constants.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 11/21/20.
//  Copyright © 2020 Adafruit. All rights reserved.
//

import Foundation
import ARKit

struct ARScenes {

    static let minervaScene = SCNScene(named: "art.scnassets/Minerva.scn")!
    
    static let circuitPlaygroundLabelScene = SCNScene(named: "art.scnassets/CPX_Displays.scn")!
    static let blmLabelScene = SCNScene(named: "art.scnassets/BLM_Display.scn")!

    //MARK:- Tarot Cards
    
    static let temperanceCardScene = SCNScene(named: "art.scnassets/temperanceCard.scn")!
    static let starCardScene = SCNScene(named: "art.scnassets/starCard.scn")!
    static let WOFCardScene = SCNScene(named: "art.scnassets/WOFCard.scn")!
    static let judgementCardScene = SCNScene(named: "art.scnassets/judgementCard.scn")!
    static let deathCardScene = SCNScene(named: "art.scnassets/deathCard.scn")!
    static let hermitCardScene = SCNScene(named: "art.scnassets/hermitCard.scn")!
    static let pentacleCardScene = SCNScene(named: "art.scnassets/pentacleCard.scn")!
    
    // MARK:- Update 1.10.1
    
    static let thmCardScene = SCNScene(named: "art.scnassets/Cards1.10/thmCard.scn")!
    static let devilCardScene = SCNScene(named: "art.scnassets/Cards1.10/devilCard.scn")!
    static let justiceCardScene = SCNScene(named: "art.scnassets/Cards1.10/justiceCard.scn")!
    static let loversCardScene = SCNScene(named: "art.scnassets/Cards1.10/loversCard.scn")!
    static let moonCardScene = SCNScene(named: "art.scnassets/Cards1.10/moonCard.scn")!
    static let sunCardScene = SCNScene(named: "art.scnassets/Cards1.10/sunCard.scn")!
    static let towerCardScene = SCNScene(named: "art.scnassets/Cards1.10/towerCard.scn")!
    static let worldCardScene = SCNScene(named: "art.scnassets/Cards1.10/worldCard.scn")!
    
    
    
    static let minervaText = SCNScene(named: "art.scnassets/textMinerva.scn")!
}
