//
//  GradientColorArcView.swift
//  GradientCircular
//
//  Created by keygx on 2018/05/24.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

class GradientColorArcView: UIView {
    var style: GradientCircularConf.Style?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        isOpaque = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let style = style else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        var currentAngle: CGFloat = 0.0
        
        for i in stride(from:CGFloat(0.0), through: CGFloat(1.0), by: CGFloat(0.005)) {
            let arcPoint: CGPoint = CGPoint(x: rect.width/2, y: rect.height/2)
            let arcRadius: CGFloat = style.radius
            let arcStartAngle: CGFloat = -CGFloat.pi/2
            let arcEndAngle: CGFloat = i * 2.0 * CGFloat.pi - CGFloat.pi/2
            
            if currentAngle == 0.0 {
                currentAngle = arcStartAngle
            } else {
                currentAngle = arcEndAngle - 0.05
            }
            
            context.addArc(center: arcPoint,
                           radius: arcRadius,
                           startAngle: currentAngle,
                           endAngle: arcEndAngle,
                           clockwise: false)
            
            let strokeColor: UIColor = getGradientPointColor(ratio: i, startColor: style.gradient.start, endColor: style.gradient.end)
            context.setStrokeColor(strokeColor.cgColor)
            
            context.setLineWidth(style.lineWidth)
            context.setLineCap(style.lineCap)
            context.strokePath()
        }
    }
}

extension GradientColorArcView {
    func drawImage(style: GradientCircularConf.Style) -> UIImage {
        self.style = style
        let image = self.toUIImage()
        
        return image
    }
}

extension GradientColorArcView {
    func getGradientPointColor(ratio: CGFloat, startColor: UIColor, endColor: UIColor) -> UIColor {
        let sColor = startColor.toRGBA()
        let eColor = endColor.toRGBA()
        
        let r = (eColor.r - sColor.r) * ratio + sColor.r
        let g = (eColor.g - sColor.g) * ratio + sColor.g
        let b = (eColor.b - sColor.b) * ratio + sColor.b
        let a = CGFloat(1.0) //(eColor.a - sColor.a) * ratio + sColor.a
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
