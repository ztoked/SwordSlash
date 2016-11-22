//
//  gameControls.swift
//  SwordSlash
//
//  Created by Zach Halvorsen on 4/20/16.
//  Copyright © 2016 Halvorsen Games. All rights reserved.
//

import Foundation
import SpriteKit

class gameControls {
    
    var left = SKShapeNode()
    var right = SKShapeNode()
    var shieldButton = SKShapeNode()
    
    let swordsman = Model.singleton.swordsman
    let currentScene = Model.singleton.currentScene
    
    init() {
        left = SKShapeNode(rectOfSize: CGSize(width: currentScene!.size.width/5, height: currentScene!.size.height/3))
        left.position = CGPoint(x: currentScene!.size.width/10, y: currentScene!.size.height/6)
        left.fillColor = SKColor.grayColor()
        left.alpha = 0.5
        
        right = SKShapeNode(rectOfSize: CGSize(width: currentScene!.size.width/5, height: currentScene!.size.height/3))
        right.position = CGPoint(x: currentScene!.size.width * 3 / 10, y: currentScene!.size.height/6)
        right.fillColor = SKColor.grayColor()
        right.alpha = 0.5
        
        shieldButton = SKShapeNode(rectOfSize: CGSize(width: currentScene!.size.width * 2 / 5, height: currentScene!.size.height/6))
        shieldButton.position = CGPoint(x: currentScene!.size.width/5, y: currentScene!.size.height * 5 / 12)
        shieldButton.fillColor = SKColor.grayColor()
        shieldButton.alpha = 0.5
        
        currentScene!.addChild(left)
        currentScene!.addChild(right)
        currentScene!.addChild(shieldButton)
    }
    
    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(currentScene!)
            if (left.containsPoint(location)) {
                swordsman.moveLeft()
            }
            else if (right.containsPoint(location)) {
                swordsman.moveRight()
            }
            else if (shieldButton.containsPoint(location)) {
                swordsman.block()
            }
            else if(!swordsman.blocking && location.x > currentScene!.size.width * 4 / 5) {
                if(swordsman.facingRight) {
                    swordsman.sword.zRotation = CGFloat(M_PI) * CGFloat((location.y / currentScene!.size.height))
                }
                else {
                    swordsman.sword.zRotation = -1 * (CGFloat(M_PI) * CGFloat((location.y / currentScene!.size.height)))
                }
            }
        }
    }
    
    func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
}
