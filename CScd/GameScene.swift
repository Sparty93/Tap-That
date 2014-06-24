//
//  GameScene.swift
//  Tap That
//
//  Created by Milo on 6/21/14.
//  Copyright (c) 2014 Spritley Games. All rights reserved.
//

import SpriteKit
import QuartzCore

var gameScore = GameScore()
var nowTime : CFTimeInterval = CACurrentMediaTime()
var gameOver : Bool = false
var points = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
var time = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
var highPoints = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        gameScore.score = 0
        nowTime = CACurrentMediaTime()
        gameOver = false
        points = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
        time = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
        highPoints = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
        
        points.fontSize = 175;
        points.position = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame) + 200));
        self.addChild(points)
        
        time.fontSize = 175;
        time.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 300);
        self.addChild(time)
        
        self.backgroundColor = SKColor .greenColor()
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            gameScore.score++
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        var countDownTime  = String(format:"%.0f", (CACurrentMediaTime() - nowTime))

        if (CACurrentMediaTime() - nowTime) < 5 {
            time.text = "\(countDownTime)"
            points.text = "\(gameScore.score)"
        }
        else {

            gameOver = true
            
            let scene = GameOverScene.unarchiveFromFile("GameOverScene") as? GameOverScene
            // Configure the view.
            let skView = self.view as SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            //scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
            
        }
    }
}
