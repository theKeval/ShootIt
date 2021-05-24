//
//  GameScene.swift
//  ShootIt
//
//  Created by Keval on 5/21/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var square : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        // Get label node from scene and store it for use later
        square = childNode(withName: "square") as? SKSpriteNode
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        square?.physicsBody?.applyForce(CGVector(dx:0, dy:20000))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
