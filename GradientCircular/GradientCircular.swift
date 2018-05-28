//
//  GradientCircular.swift
//  GradientCircular
//
//  Created by keygx on 2018/05/24.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

public class GradientCircular {
    // -> UIImage
    public static func drawImage(style: GradientCircularConf.Style) -> UIImage {
        // single color
        if  style.gradient.start == style.gradient.end {
            let singleColorArcView = SingleColorArcView(frame: style.rect)
            return singleColorArcView.drawImage(style: style)
        }
        
        // alpha value
        if style.gradient.start.toRGBA().a < 1.0 || style.gradient.end.toRGBA().a < 1.0 {
            let alphaValueArcImage = AlphaValueArcImage()
            return alphaValueArcImage.drawImage(style: style)
        }
        
        // solid color
        let gradientArcView = GradientColorArcView(frame: style.rect)
        return gradientArcView.drawImage(style: style)
    }
    
    // -> UIImageView
    public static func drawImageView(style: GradientCircularConf.Style) -> UIImageView {
        let image = drawImage(style: style)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = style.rect
        return imageView
    }
}
