//
//  GameScene.swift
//  project 11
//
//  Created by Babak Nikkhoo on 11/12/17.
//  Copyright © 2017 Babak Nikkhoo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    //welcome screen labels
    var titleLabel = SKLabelNode(fontNamed: "Chalkduster")
    var challengeGameModeLabel = SKLabelNode(fontNamed: "Chalkduster")
    var freestyleGameModeLabel = SKLabelNode(fontNamed: "Chalkduster")
    var byLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    //challenge mode labels
    var ballsLabel = SKLabelNode(fontNamed: "Chalkduster")
    var levelLabel = SKLabelNode(fontNamed: "Chalkduster")

    //freestyle mode labels
    var editLabel = SKLabelNode(fontNamed: "Chalkduster")
    var exitLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    //sounds
    var loserSound = SKAction.playSoundFileNamed("loser.mp3", waitForCompletion: false)
    var boingSound = SKAction.playSoundFileNamed("boing.mp3", waitForCompletion: false)
    var chachingSound = SKAction.playSoundFileNamed("cha-ching.mp3", waitForCompletion: false)
    var clinkSound = SKAction.playSoundFileNamed("clink.mp3", waitForCompletion: false)
    var crashSound = SKAction.playSoundFileNamed("crash.mp3", waitForCompletion: false)
    
    //level and label variables
    var ballsRemaining = 5 {
        didSet {
            ballsLabel.text = "Balls: \(ballsRemaining)"
        }
    }
    
    var level = 1 {
        didSet {
            levelLabel.text = "Level: \(level)"
        }
    }
    
    var editingMode: Bool = false {
        didSet {
            if editingMode {
                editLabel.text = "Done"
            } else {
                editLabel.text = "Edit"
            }
        }
    }
    
    var challengeGameMode = false
    var freestyleGameMode = false
    var ballsOn = false
    
    let ballColor = ["ballGrey", "ballPurple", "ballRed", "ballCyan", "ballYellow", "ballGreen", "ballBlue"]
    
    //load secreen
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
        
        makeInitialScreen()
    }
    
    func makeInitialScreen() {
        removeTitleLabels(name: "title")
        removeTitleLabels(name: "box")
        challengeGameMode = false
        freestyleGameMode = false
        ballsOn = false
        self.level = 1
        
        makeLabel(name: titleLabel, title: "title", size: 100, text: "Pachinko", location: CGPoint(x: frame.midX, y: 500), alignment: .center)
        makeLabel(name: byLabel, title: "title", size: 30, text: "By: Babak Nikkhoo", location: CGPoint(x: frame.midX, y: frame.midY), alignment: .center)
        makeLabel(name: freestyleGameModeLabel, title: "title", size: 50, text: "Freestyle Mode", location: CGPoint(x: frame.minX + 20, y: 240), alignment: .left)
        makeLabel(name: challengeGameModeLabel, title: "title", size: 50, text: "Challenge Mode", location: CGPoint(x: frame.maxX - 20, y: 240), alignment: .right)
    }
    
    func makeScreen(challenge: Bool) {
        removeTitleLabels(name: "title")
        if challenge {
            makeLabel(name: ballsLabel, title: "title", size: 30, text: "Balls: \(ballsRemaining)", location: CGPoint(x: 980, y: 700), alignment: .right)
            makeLabel(name: levelLabel, title: "title", size: 30, text: "Level: \(level)", location: CGPoint(x: 100, y: 700), alignment: .center)
        } else {
            makeLabel(name: editLabel, title: "title", size: 30, text: "Edit", location: CGPoint(x: 80, y: 700), alignment: .center)
            makeLabel(name: exitLabel, title: "title", size: 30, text: "Exit", location: CGPoint(x: 980, y: 700), alignment: .right)
        }
    }
    
    //make nodes
    func makeLabel(name: SKLabelNode, title: String, size: CGFloat, text: String, location: CGPoint, alignment: SKLabelHorizontalAlignmentMode) {
        name.name = title
        name.text = text
        name.fontSize = size
        name.position = location
        name.horizontalAlignmentMode = alignment
        addChild(name)
    }
    
    func makeBox(location: CGPoint) {
        let size = CGSize(width: GKRandomDistribution(lowestValue: 16, highestValue: 128).nextInt(), height: 16)
        let box = SKSpriteNode(color: RandomColor(), size: size)
        box.name = "box"
        box.zRotation = RandomCGFloat(min: 0, max: 3)
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
        box.physicsBody?.isDynamic = false
        addChild(box)
    }
    
    func makeBouncer(at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
        bouncer.physicsBody?.isDynamic = false
        bouncer.name = "bouncer"
        addChild(bouncer)
    }
    
    func makeSlot(at position: CGPoint, isGood: Bool) {
        var slotBase: SKSpriteNode
        var slotGlow: SKSpriteNode
        
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = "good"
        } else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = "bad"
        }
        
        slotBase.position = position
        slotGlow.position = position
        slotGlow.zPosition = -0.1
        
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false
        
        addChild(slotBase)
        addChild(slotGlow)
        
        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever = SKAction.repeatForever(spin)
        slotGlow.run(spinForever)
    }
    
    func removeTitleLabels(name: String) {
        for node in self.children {
            if node.name == name {
                node.removeFromParent()
            }
        }
    }
    
    func loadLevel() {
        ballsRemaining = 5
        removeTitleLabels(name: "box")
        for _ in 1...(level * 10) {
            makeBox(location: CGPoint(x: GKRandomDistribution(lowestValue: 25, highestValue: 1000).nextInt(), y: GKRandomDistribution(lowestValue: 150, highestValue: 650).nextInt()))
        }
    }
    
    func collisionBetween(ball: SKNode, object: SKNode) {
        if object.name == "good" {
            run(chachingSound)
            destroy(ball: ball, color: "Green")
            ballsRemaining += 1
        } else if object.name == "bad" {
            run(crashSound)
            destroy(ball: ball, color: "Red")
            if ballsRemaining == 0 && (childNode(withName: "ball") == nil) {
                run(loserSound)
                let ac = UIAlertController(title: "Oops!", message: "You ran out of Pachinko balls", preferredStyle: .alert)
                let tryAgain = UIAlertAction(title: "Try again", style: .default) { (action:UIAlertAction!) in
                    self.level = 1
                    self.loadLevel()
                }
                ac.addAction(tryAgain)
                let mainMenu = UIAlertAction(title: "Main menu", style: .destructive) { (action:UIAlertAction!) in
                    self.makeInitialScreen()
                }
                ac.addAction(mainMenu)
                self.view?.window?.rootViewController?.present(ac, animated: true)
            }
        } else if object.name == "box" {
            run(clinkSound)
            object.removeFromParent()
        } else if object.name == "bouncer" {
            run(boingSound)
        }
        
        if !checkForBox() && challengeGameMode {
            level += 1
            loadLevel()
        }
    }
    
    func checkForBox() -> Bool {
        for node in self.children {
            if (node.name == "box") {
                return true
            }
        }
        return false
    }
    
    func dropBall(location: CGPoint) {
        let color = GKRandomDistribution(lowestValue: 0, highestValue: 6).nextInt()
        let ball = SKSpriteNode(imageNamed: ballColor[color])
        ball.name = "ball"
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
        ball.physicsBody!.contactTestBitMask = ball.physicsBody!.collisionBitMask
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }
    
    func destroy(ball: SKNode, color: String) {
        if let fireParticles = SKEmitterNode(fileNamed: "FireParticles\(color)") {
            fireParticles.position = ball.position
            addChild(fireParticles)
            let delay = SKAction.wait(forDuration: 2.0)
            fireParticles.run(delay) {
                fireParticles.removeFromParent()
            }
        }
        
        ball.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "ball" {
            collisionBetween(ball: nodeA, object: nodeB)
        } else if nodeB.name == "ball" {
            collisionBetween(ball: nodeB, object: nodeA)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let objects = nodes(at: location)
            
            if objects.contains(challengeGameModeLabel) {
                challengeGameMode = true
                ballsOn = true
                makeScreen(challenge: true)
                loadLevel()
            } else if objects.contains(freestyleGameModeLabel) {
                freestyleGameMode = true
                ballsOn = true
                makeScreen(challenge: false)
            } else if objects.contains(editLabel) {
                editingMode = !editingMode
            } else if objects.contains(exitLabel) {
                makeInitialScreen()
            } else {
                if editingMode {
                    for node in self.nodes(at: location) {
                        if node.name == "box" {
                            node.removeFromParent()
                            return
                        }
                    }
                    
                    makeBox(location: location)
                } else {
                    if challengeGameMode && ballsRemaining > 0 && ballsOn {
                        ballsRemaining -= 1
                        dropBall(location: CGPoint(x: location.x, y: frame.height))
                    } else if freestyleGameMode && ballsOn {
                        dropBall(location: CGPoint(x: location.x, y: frame.height))

                    }
                }
            }
        }
    }
}
