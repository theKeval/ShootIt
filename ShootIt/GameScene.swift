//
//  GameScene.swift
//  ShootIt
//
//  Created by Keval on 5/21/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var cowboy : SKSpriteNode?
    
    private var cowboyCategory: UInt32 = 2
    
    private var actionRun: SKAction?
    private var actionShoot: SKAction?
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        // Get label node from scene and store it for use later
        cowboy = childNode(withName: "cowboy") as? SKSpriteNode
        
        cowboy?.physicsBody?.categoryBitMask = cowboyCategory
        // mainChar?.physicsBody?.contactTestBitMask = coinCategory | bombCategory
        // mainChar?.physicsBody?.collisionBitMask = dummyCategory | grassCategory
        
        var cowboyRun: [SKTexture] = []
        cowboyRun.append(SKTexture(imageNamed: "00-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "01-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "02-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "03-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "04-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "05-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "06-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "07-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "08-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "09-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "10-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "11-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "12-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "13-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "14-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "15-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "16-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "17-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "18-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "19-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "20-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "21-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "22-cowboy-frame"))
        cowboyRun.append(SKTexture(imageNamed: "23-cowboy-frame"))
        
        let actionRunAnimate = SKAction.animate(with: cowboyRun, timePerFrame: 0.05)
        actionRun = SKAction.repeatForever(actionRunAnimate)
        
        cowboy?.run(actionRun!, withKey: "actionRun")
        
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
        // cowboy?.physicsBody?.applyForce(CGVector(dx:0, dy:20000))
        
        cowboy?.removeAllActions()
        
        var cowboyShoot: [SKTexture] = []
        cowboyShoot.append(SKTexture(imageNamed: "01-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "02-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "03-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "04-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "05-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "06-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "07-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "08-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "09-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "10-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "11-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "12-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "13-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "14-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "15-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "16-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "17-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "18-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "19-cowboy-shoot-frame"))
        cowboyShoot.append(SKTexture(imageNamed: "20-cowboy-shoot-frame"))
        
        actionShoot = SKAction.animate(with: cowboyShoot, timePerFrame: 0.05)
        
        cowboy?.removeAction(forKey: "actionRun")
        cowboy?.run(actionShoot!, completion: {
            self.cowboy?.run(self.actionRun!, withKey: "actionRun")
        })
        
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
