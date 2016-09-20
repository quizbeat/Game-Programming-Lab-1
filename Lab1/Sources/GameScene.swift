import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    private var touchPointNode: SKShapeNode?
    private var bubbleNode: SKSpriteNode?
    private var gravityNode: SKFieldNode?
    
    override func didMove(to view: SKView) {
        createTouchPointNode()
        createBubbleNode()
        createGravityNode()
    }
    
    func createTouchPointNode() {
        let radius: CGFloat = 15
        self.touchPointNode = SKShapeNode(circleOfRadius: radius)
        if let touchPointNode = self.touchPointNode {
            touchPointNode.lineWidth = 2.5
            touchPointNode.strokeColor = .clear
            touchPointNode.fillColor = .magenta
            touchPointNode.run(SKAction.scale(by: 10, duration: 0.8))
            touchPointNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.1),
                                                  SKAction.fadeOut(withDuration: 0.6),
                                                  SKAction.removeFromParent()]))
        }
    }
    
    func createBubbleNode() {
        self.bubbleNode = BubbleNode()
    }
    
    func createGravityNode() {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.gravityNode = SKFieldNode.radialGravityField()
        if let gravityNode = self.gravityNode {
            gravityNode.position = (self.view?.center)!
            self.addChild(gravityNode)
        }
    }
    
    // MARK: Drawing
    
    func drawHalo(atPoint point: CGPoint) {
        if let halo = self.touchPointNode?.copy() as! SKShapeNode? {
            halo.position = point
            self.addChild(halo)
        }
    }
    
    func drawBubble(atPoint point: CGPoint) {
        let bubble = SKShapeNode(circleOfRadius: 45)
        bubble.physicsBody = SKPhysicsBody(circleOfRadius: 45)
        bubble.fillColor = .cyan
        bubble.position = point
        self.addChild(bubble)
        //if let bubble = self.bubbleNode?.copy() as! SKSpriteNode? {
        //    bubble.position = point
        //    self.addChild(bubble)
        //}
    }
    
    // MARK: Touches handling
    
    func touchDown(atPoint point: CGPoint) {
        drawHalo(atPoint: point)
        drawBubble(atPoint: point)
    }
    
    func touchMoved(toPoint point: CGPoint) {
        
    }
    
    func touchUp(atPoint point: CGPoint) {
        
    }
    
    // MARK: Touch events
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    // MARK: Internal events
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
