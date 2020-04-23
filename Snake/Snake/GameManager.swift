//
//  GameManager.swift
//  Snake
//
//  Created by Kaelen Cook on 4/15/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import SpriteKit

class GameManager {
    var scene: GameScene!
    var nextTime: Double?
    var timeDefault: Double = 0.2
    var timeExtension: Double = 0.2
    var playerDirection: Int = 4 // 1 == left, 2 == up, 3 == right, 4 == down
    var currentScore: Int = 0
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func initGame() {
        scene.playerPositions.append((10, 10))
        scene.playerPositions.append((10, 11))
        scene.playerPositions.append((10, 12))
        renderChange()
        
        generateNewPoint()
    }
    
    func renderChange() {
        for (node, x, y) in scene.gameArray {
            if contains(apple: scene.playerPositions, cranberry: (x, y)) {
                node.fillColor = SKColor.cyan
            }
            else {
                node.fillColor = SKColor.clear
            }
            if scene.scorePos != nil {
                if Int((scene.scorePos?.x)!) == y && Int((scene.scorePos?.y)!) == x {
                    node.fillColor = SKColor.red
                }
            }
        }
    }
    
    func contains(apple:[(Int, Int)], cranberry: (Int, Int)) -> Bool {
        let (c1, c2) = cranberry
        for (v1, v2) in apple {
            if v1 == c1 && v2 == c2 {
                return true
            }
        }
        return false
    }
    
    func update(time: Double) {
        if nextTime == nil {
            nextTime = time + timeExtension
        }
        else {
            if time >= nextTime! {
                nextTime = time + timeExtension
                updatePlayerPosition()
                checkForScore()
                checkForDeath()
                finishAnimation()
            }
        }
    }
    
    func checkForScore() {
        if scene.scorePos != nil {
            let x = scene.playerPositions[0].0
            let y = scene.playerPositions[0].1
            if Int((scene.scorePos?.x)!) == y && Int((scene.scorePos?.y)!) == x {
                let speedUp = timeExtension * 0.10
                timeExtension -= speedUp
                currentScore += 1
                scene.currentScore.text = "Score: \(currentScore)"
                generateNewPoint()
                for _ in 0 ... 2 {
                    scene.playerPositions.append(scene.playerPositions.last!)
                }
            }
        }
    }
    
    func checkForDeath() {
        if scene.playerPositions.count > 0 {
            var arrayOfPositions = scene.playerPositions
            let headOfSnake = arrayOfPositions[0]
            arrayOfPositions.remove(at: 0)
            if contains(apple: arrayOfPositions, cranberry: headOfSnake) {
                playerDirection = 0
                timeExtension = timeDefault
            }
        }
    }
    
    func updatePlayerPosition() {
        var xChange = 0
        var yChange = 0
        
        switch playerDirection {
        case 0:
            // Dead
            xChange = 0
            yChange = 0
            break
            
        case 1:
            // Left
            xChange = -1
            yChange = 0
            break
            
        case 2:
            // Up
            xChange = 0
            yChange = -1
            break
            
        case 3:
            // Right
            xChange = 1
            yChange = 0
            break
            
        case 4:
            // Down
            xChange = 0
            yChange = 1
            break
            
        default:
            break
        }
        
        if scene.playerPositions.count > 0 {
            var start = scene.playerPositions.count - 1
            while start > 0 {
                scene.playerPositions[start] = scene.playerPositions[start - 1]
                start -= 1
            }
            scene.playerPositions[0] = (scene.playerPositions[0].0 + yChange, scene.playerPositions[0].1 + xChange)
        }
        
        if scene.playerPositions.count > 0 {
            let x = scene.playerPositions[0].1
            let y = scene.playerPositions[0].0
            if y > 40 {
                scene.playerPositions[0].0 = 0
            }
            else if y < 0 {
                scene.playerPositions[0].0 = 40
            }
            else if x > 20 {
                scene.playerPositions[0].1 = 0
            }
            else if x < 0 {
                scene.playerPositions[0].1 = 20
            }
        }
        renderChange()
    }
    
    func swipe(id: Int) {
        if !(id == 2 && playerDirection == 4) && !(id == 4 && playerDirection == 2) {
            if !(id == 1 && playerDirection == 3) && !(id == 3 && playerDirection == 1) {
                if playerDirection != 0 {
                    playerDirection = id
                }
            }
        }
    }
    
    func finishAnimation() {
        if playerDirection == 0 && scene.playerPositions.count > 0 {
            var hasFinished = true
            let headOfSnake = scene.playerPositions[0]
            for position in scene.playerPositions {
                if headOfSnake != position {
                    hasFinished = false
                }
            }
            if hasFinished {
                print("end game")
                updateScore()
                playerDirection = 4
                scene.scorePos = nil
                scene.playerPositions.removeAll()
                renderChange()
                // return to sender
                scene.currentScore.run(SKAction.scale(to: 0, duration: 0.3)) {
                    self.scene.currentScore.isHidden = true
                }
                scene.gameBG.run(SKAction.scale(to: 0, duration: 0.3)) {
                    self.scene.gameBG.isHidden = true
                    self.scene.gameLogo.isHidden = false
                    self.scene.gameLogo.run(SKAction.move(to: CGPoint(x: 0, y: (self.scene.frame.size.height / 2) - 200), duration: 0.3)) {
                        self.scene.playButton.isHidden = false
                        self.scene.playButton.run(SKAction.scale(to: 1, duration: 0.3))
                        self.scene.playButton.run(SKAction.move(to: CGPoint(x: 0, y: (self.scene.frame.size.height / -2) + 200), duration: 0.3))
                        self.scene.bestScore.run(SKAction.move(to: CGPoint(x: 0, y: self.scene.gameLogo.position.y - 50), duration: 0.3))
                    }
                }
            }
        }
    }
    
    func generateNewPoint() {
        var randomX = CGFloat(arc4random_uniform(19))
        var randomY = CGFloat(arc4random_uniform(39))
        
        while contains(apple: scene.playerPositions, cranberry: (Int(randomX), Int(randomY))) {
            randomX = CGFloat(arc4random_uniform(19))
            randomY = CGFloat(arc4random_uniform(39))
        }
        scene.scorePos = CGPoint(x: randomX, y: randomY)
        renderChange()
    }
    
    func updateScore() {
        if currentScore > UserDefaults.standard.integer(forKey: "bestScore") {
            UserDefaults.standard.set(currentScore, forKey: "bestScore")
        }
        currentScore = 0
        scene.currentScore.text = "Score: 0"
        scene.bestScore.text = "Best Score: \(UserDefaults.standard.integer(forKey: "bestScore"))"
    }
}
