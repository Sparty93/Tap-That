//
//  GameScene.swift
//  Tap That
//
//  Created by Milo on 6/21/14.
//  Copyright (c) 2014 Spritley Games. All rights reserved.
//

import SpriteKit
import QuartzCore

var score = 0
var nowTime : CFTimeInterval = CACurrentMediaTime()
var gameOver : Bool = false
let points = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
let time = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")
let highPoints = SKLabelNode(fontNamed:"Helvetica Neue UltraLight")

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        
        
        points.fontSize = 175;
        points.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) / 2 * 1.5);
        
        self.addChild(points)
        
        time.fontSize = 175;
        time.position = CGPoint(x:320, y:CGRectGetMidY(self.frame) / 4 * 1.5);
        
        self.addChild(time)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        if gameOver == true  {
            
            for touch: AnyObject in touches {
                
                score = 0
                nowTime = CACurrentMediaTime()
                gameOver = false
                
            }
            
        }
        
        for touch: AnyObject in touches {
            score++
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        var countDownTime  = String(format:"%.0f", (CACurrentMediaTime() - nowTime))

        if (CACurrentMediaTime() - nowTime) < 5 {
            time.text = "\(countDownTime)"
            points.text = "\(score)"
            self.backgroundColor = SKColor .greenColor()
            
        }
        else {

            gameOver = true
            self.backgroundColor = SKColor .redColor()
            
        }
    }
}
