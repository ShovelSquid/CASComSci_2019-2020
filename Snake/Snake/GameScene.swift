//
//  GameScene.swift
//  Snake
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
    var game: GameManager!
    
    
    override func didMove(to view: SKView) {
        initializeMenu()
        game = GameManager()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes {
                if node.name == "play_button" {
                    startGame()
                }
            }
        }
    }
    
    func startGame() {
        print("game start")
        
        gameLogo.run(SKAction.move(by: CGVector(dx: 0, dy: 600), duration: 0.5)) {
            self.gameLogo.isHidden = true
        }
        
        playButton.run(SKAction.scale(to: 0, duration: 0.3)) {
            self.playButton.isHidden = true
        }
        
        let bottom = CGPoint(x: 0, y: (frame.size.height / -2) + 20)
        bestScore.run(SKAction.move(to: bottom, duration: 0.3))
    }
    
    func initializeMenu() {
        //title
        gameLogo = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        gameLogo.zPosition = 1
        gameLogo.position = CGPoint(x: 0, y: (frame.size.height / 2) - 200)
        gameLogo.fontSize = 60
        gameLogo.text = "SNAKE"
        gameLogo.fontColor = SKColor.red
        self.addChild(gameLogo)
        
        //score
        bestScore = SKLabelNode(fontNamed: "ChalkboardSE-Regular")
        bestScore.zPosition = 1
        bestScore.position = CGPoint(x: 0, y: gameLogo.position.y - 50)
        bestScore.fontSize = 40
        bestScore.text = "Best Score: 0"
        bestScore.fontColor = SKColor.white
        self.addChild(bestScore)
        
        //button
        playButton = SKShapeNode()
        playButton.name = "play_button"
        playButton.zPosition = 1
        playButton.position = CGPoint(x: 0, y: (frame.size.height / -2) + 200)
        playButton.fillColor = SKColor.cyan
        
        let topCorner = CGPoint(x: -50, y: 50)
        let bottomCorner = CGPoint(x: -50, y: -50)
        let middle = CGPoint(x: 50, y: 0)
        let path = CGMutablePath()
        path.addLines(between: [topCorner, middle, bottomCorner])
        
        playButton.path = path
        self.addChild(playButton)
    }
    
}
