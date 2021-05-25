//
//  GameScene.swift
//  ShootIt
//
//  Created by Keval on 5/21/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var cowboy : SKSpriteNode?
    var grass: SKSpriteNode?
    var scoreLabel: SKLabelNode?
    // var gameOverLabel: SKLabelNode?
    
    var enemyTimer: Timer?
    
    var cowboyCategory: UInt32 = 2
    let enemyCategory : UInt32 = 4
    let grassCategory : UInt32 = 8
    let bulletCategory: UInt32 = 64
    
    private var actionRun: SKAction?
    private var actionShoot: SKAction?
    
    var score: Int = 0
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
//        gameOverLabel = childNode(withName: "GameOverLabel") as? SKLabelNode
//        gameOverLabel?.removeFromParent()
//        if let label = gameOverLabel {
//            // label.alpha = 0.0
//            label.run(SKAction.fadeOut(withDuration: 0))
//        }
        
        // Get label node from scene and store it for use later
        cowboy = childNode(withName: "cowboy") as? SKSpriteNode
        
        cowboy?.physicsBody?.categoryBitMask = cowboyCategory
        cowboy?.physicsBody?.contactTestBitMask = enemyCategory
        // mainChar?.physicsBody?.collisionBitMask = dummyCategory | grassCategory
        
        // MARK:- Cowboy running animation
        
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
        
        // MARK:- Enemy timer
        enemyTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {(timer) in self.createEnemy()
         })
        
        createGrass()
        
    }
    
    //Differentiate between contact and collision
    //Contact: two objects overlap
    //Collisio: two objects collide physically
    func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyA.categoryBitMask == bulletCategory && contact.bodyB.categoryBitMask == enemyCategory){
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            score += 1
        }
        
        if (contact.bodyA.categoryBitMask == enemyCategory && contact.bodyB.categoryBitMask == bulletCategory){
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            score += 1
        }
        
        if (contact.bodyA.categoryBitMask == cowboyCategory && contact.bodyB.categoryBitMask == enemyCategory) {
            
            self.speed = 0
            enemyTimer?.invalidate()
            gameOver()
            
        }
        
        if (contact.bodyA.categoryBitMask == enemyCategory && contact.bodyB.categoryBitMask == cowboyCategory) {
            
            self.speed = 0
            enemyTimer?.invalidate()
            gameOver()
            
        }
        
        scoreLabel?.text = "SCORE: \(score)"
    }
    
    
    func touchDown(atPoint pos : CGPoint) {}
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {}
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // cowboy?.physicsBody?.applyForce(CGVector(dx:0, dy:20000))
        
        // MARK:- Cowboy shooting animation
        
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
        
        actionShoot = SKAction.animate(with: cowboyShoot, timePerFrame: 0.01)
        
        // Remove running anim
        cowboy?.removeAction(forKey: "actionRun")
        
        // start shooting anim
        cowboy?.run(actionShoot!, completion: {
            // on completion of shooting anim restart running anim
            self.cowboy?.run(self.actionRun!, withKey: "actionRun")
        })
        
        fireBullet()
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    // MARK:- methods to create Nodes from code
    
    func createGrass(){
        
        grass = SKSpriteNode(imageNamed: "grass")
        
        let number_of_grass = Int(size.width / grass!.size.width) + 1
        
        for num in 0...number_of_grass{
            let gr = SKSpriteNode(imageNamed: "grass")
            gr.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: gr.size.width, height: gr.size.height - 30))    //We increase 30 to get rid of top gap in the image and to fit the collision box to the image, exactly
            gr.physicsBody?.categoryBitMask = grassCategory
            // gr.physicsBody?.contactTestBitMask = cowboyCategory
            // gr.physicsBody?.collisionBitMask = cowboyCategory | enemyCategory
            gr.physicsBody?.affectedByGravity = false
            gr.physicsBody?.isDynamic = false
            addChild(gr)
            
            //Arranging and moving grass under the feet of player
            let grX = -size.width/2 + gr.size.width/2+gr.size.width*CGFloat(num)
            gr.position = CGPoint(x: grX, y: -size.height/2 + gr.size.height + 20)
            let speed: CGFloat = 100
            
            let firstMoveLeft = SKAction.moveBy(x: -gr.size.width - gr.size.width * CGFloat(num), y: 0, duration: TimeInterval(CGFloat(gr.size.width + gr.size.width * CGFloat(num)) / speed))
            
            
            let resetGrass = SKAction.moveBy(x: size.width + gr.size.width, y: 0, duration: 0)
            
            let grassFullMove = SKAction.moveBy(x: -size.width - gr.size.width, y: 0, duration: TimeInterval(CGFloat(size.width + gr.size.width) / speed))
            
            let grassMovingForever = SKAction.repeatForever(SKAction.sequence([grassFullMove, resetGrass]))
            
            gr.run(SKAction.sequence([firstMoveLeft, resetGrass, grassMovingForever]))
        }
    }
    
    func createEnemy(){
        let enemy = SKSpriteNode(imageNamed: "enemy")
        addChild(enemy)
        enemy.size = CGSize(width: 150, height: 200)
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody?.categoryBitMask = enemyCategory
        
        // coin.physicsBody?.contactTestBitMask = playerCategory
        
        enemy.physicsBody?.affectedByGravity = false
        
        // coin.physicsBody?.collisionBitMask = bombCategory
        
        let enemyX = size.width/2 + enemy.size.width/2
        let enemyY = -size.height/2 + enemy.size.height + grass!.size.height
        
        enemy.position = CGPoint(x: enemyX, y: enemyY)
        
       
        let moveLeft = SKAction.moveBy(x: -size.width - enemy.size.width, y: 0, duration: 4)
        enemy.run(SKAction.sequence([moveLeft, SKAction.removeFromParent()]))
    }
    
    func fireBullet(){
        let bullet = SKSpriteNode(imageNamed: "bullet")
        addChild(bullet)
        // bullet.size = CGSize(width: 150, height: 200)
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody?.categoryBitMask = bulletCategory
        bullet.physicsBody?.contactTestBitMask = enemyCategory
        bullet.physicsBody?.affectedByGravity = false
        
        // coin.physicsBody?.collisionBitMask = bombCategory
        
        let bulletX = -size.width/2 + cowboy!.size.width
        let bulletY = -size.height/2 + cowboy!.size.height/2 + 80 + grass!.size.height
        
        bullet.position = CGPoint(x: bulletX, y: bulletY)
        
       
        let moveRight = SKAction.moveBy(x: size.width, y: 0, duration: 0.5)
        bullet.run(SKAction.sequence([moveRight, SKAction.removeFromParent()]))
    }
    
    func gameOver() {
        let gameOverLabel = SKLabelNode(fontNamed: "Chalkboard SE")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 100
        gameOverLabel.fontColor = SKColor.red
        gameOverLabel.position = CGPoint(x: 0, y: size.height/4)
        gameOverLabel.zPosition = 2.0
        addChild(gameOverLabel)
        
        // gameOverLabel.alpha = 0.0
        // gameOverLabel.run(SKAction.fadeIn(withDuration: 2.0))
        
        
    }
    
}
