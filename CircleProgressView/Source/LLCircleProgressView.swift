//
//  CircleProgressView.swift
//  CircleProgressView
//
//  Created by Yuri Ferretti on 3/28/17.
//  Copyright © 2017 yuri. All rights reserved.
//

import UIKit

open class LLCircleProgressView: UIView {
    
    private var trackingLayer: LLCircleLayer?
    private var progressLayer: LLCircleLayer?
    private let backgroundMask = CAShapeLayer()
    
    public var lineWidth: CGFloat = 50 {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    public var progressColor: UIColor = .black {
        didSet {
            progressLayer?.lineColor = progressColor
        }
    }
    
    public var trackColor: UIColor = UIColor(white: 0, alpha: 0.1) {
        didSet {
            trackingLayer?.lineColor = trackColor
        }
    }
    
    public var animationDuration: TimeInterval = 0.3 {
        didSet {
            progressLayer?.animationDuration = animationDuration
        }
    }
    
    public var progress: CGFloat = 0 {
        didSet {
            progressLayer?.setProgress(progress, animated: false)
        }
    }
    
    public func setProgress(_ progress: CGFloat, animated: Bool) {
        progressLayer?.setProgress(progress, animated: animated)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let centerReference = (bounds.width / 2)
        let center = CGPoint(x: centerReference, y: centerReference)
        let radius = centerReference - (lineWidth / 2)
        let startAngle: CGFloat = -(.pi / 2)
        let endAngle: CGFloat = 3 * (.pi / 2)
        
        [trackingLayer, progressLayer].forEach {
            $0?.removeAllAnimations()
            $0?.removeFromSuperlayer()
        }
        
        trackingLayer = LLCircleLayer(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true,
            lineWidth: lineWidth
        )
        trackingLayer?.strokeEnd = 1
        trackingLayer?.lineColor = trackColor
        progressLayer = LLCircleLayer(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true,
            lineWidth: lineWidth
        )
        progressLayer?.lineColor = progressColor
        progressLayer?.progress = progress
        progressLayer?.animationDuration = animationDuration
        layer.addSublayer(trackingLayer!)
        layer.addSublayer(progressLayer!)
        backgroundMask.path = UIBezierPath(ovalIn: bounds).cgPath
        layer.mask = backgroundMask
    }
}

