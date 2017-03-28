//
//  CircleLayer.swift
//  CircleProgressView
//
//  Created by Yuri Ferretti on 3/28/17.
//  Copyright © 2017 yuri. All rights reserved.
//

open class CircleLayer: CAShapeLayer {
    
    private let progressAnimationKey = "progress-animation-key"
    
    var lineColor: UIColor = .black {
        didSet {
            strokeColor = lineColor.cgColor
        }
    }
    
    open var animationDuration: TimeInterval = 0.3
    
    public var progress: CGFloat = 0 {
        didSet {
            setProgress(progress, animated: false)
        }
    }
    
    public init(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, lineWidth: CGFloat) {
        super.init()
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        self.path = circlePath.cgPath
        fillColor = UIColor.clear.cgColor
        strokeColor = lineColor.cgColor
        self.lineWidth = lineWidth
        self.lineCap = kCALineCapRound
        self.strokeStart = 0
        self.strokeEnd = 0
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setProgress(_ progress: CGFloat, animated: Bool) {
        let normalizedProgress = max(0, min(progress, 1)) // 0 <= progress <= 1
        guard animated else {
            strokeEnd = normalizedProgress
            return
        }
        
        removeAnimation(forKey: progressAnimationKey)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = normalizedProgress
        animation.duration = animationDuration
        animation.fillMode = kCAFillModeBoth
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.isRemovedOnCompletion = false
        add(animation, forKey: progressAnimationKey)
        
    }
}
