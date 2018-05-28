//
//  SingleColorArcView.swift
//  GradientCircular
//
//  Created by keygx on 2018/05/24.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

class SingleColorArcView: UIView, ArcDefaultType {
    var style: GradientCircularConf.Style?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        inirialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let style = style else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let arcPoint: CGPoint = CGPoint(x: rect.width/2, y: rect.height/2)
        let arcRadius: CGFloat = style.radius
        let arcStartAngle: CGFloat = 0.0
        let arcEndAngle: CGFloat = CGFloat.pi * 2.0
        
        context.addArc(center: arcPoint,
                       radius: arcRadius,
                       startAngle: arcStartAngle,
                       endAngle: arcEndAngle,
                       clockwise: true)
        
        context.setStrokeColor(style.gradient.start.cgColor)
        context.setLineWidth(style.lineWidth)
        context.setLineCap(style.lineCap)
        context.strokePath()
    }
}
