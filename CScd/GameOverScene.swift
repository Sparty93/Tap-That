//
//  GameOver.swift
//  Tap That
//
//  Created by Robert Marchiori on 6/21/14.
//  Copyright (c) 2014 Spritley Games. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = SKColor .redColor()
        
        let bestScore = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
        bestScore.fontSize = 170
        bestScore.text = "Highscore"
        bestScore.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 300)
        self.addChild(bestScore)
        
        let highPoints = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
        highPoints.fontSize = 175
        highPoints.text = "\(gameScore.highScore)"
        highPoints.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 300)
        self.addChild(highPoints)
        
        let points = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
        points.fontSize = 175
        points.position = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame) + 200))
        points.text = "\(gameScore.score)"
        self.addChild(points)
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let scene = GameScene()
            scene.scaleMode = .AspectFill
            self.view .presentScene(scene)
        }
    }
}

