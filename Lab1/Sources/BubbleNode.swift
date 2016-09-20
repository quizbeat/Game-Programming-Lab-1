import SpriteKit


class BubbleNode: SKSpriteNode {
    
    init() {
        let bubbleImage = UIImage(named: "bubble.png")
        let texture = SKTexture(image: bubbleImage!)
        let size = CGSize(width: 50, height: 50)
        super.init(texture: texture, color: UIColor.blue, size: size)
        self.physicsBody = SKPhysicsBody(circleOfRadius: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
