//
//  GameScene.swift
//  Snake?Snake?!SNAAAAAAKE!!!
//
//  Created by Kaelen Cook on 4/15/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameLogo: SKLabelNode!
    var bestScore: SKLabelNode!
    var playButton: SKShapeNode!
    

    override func didMove(to view: SKView) {
        initializeMenu()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func initializeMenu() {
        gameLogo = SKLabelNode(fontNamed: "ComicSans")
        gameLogo.zPosition = 1
        gameLogo.position = CGPoint(x: 0, y: (frame.size.height / 2) - 200)
        gameLogo.fontSize = 60
        gameLogo.text = "SNAKE"
        gameLogo.fontColor = SKColor.red
        self.addChild(gameLogo)
        
        bestScore = SKLabelNode(fontNamed: "ComicSans")
        bestScore.zPosition = 1
        bestScore.position = CGPoint(x: 0, y: gameLogo.position.y - 50)
        bestScore.fontSize = 40
        bestScore.text = "Best Score: 0"
        bestScore.fontColor = SKColor.white
        self.addChild(bestScore)
    }
    
}
