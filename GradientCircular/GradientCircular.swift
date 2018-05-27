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
        if style.gradient.start.toRGBA().a < 1.0 || style.gradient.end.toRGBA().a < 1.0 {
            // alpha value
            let alphaValueArcImage = AlphaValueArcImage()
            return alphaValueArcImage.drawImage(style: style)
        }
        
        // solid color
        let gradientArcView = GradientColorArcView(frame: style.rect)
        return gradientArcView.drawImage(style: style)
    }
    
    // -> UIImageView
    public static func drawImageView(style: GradientCircularConf.Style) -> UIImageView {
        if style.gradient.start.toRGBA().a < 1.0 || style.gradient.end.toRGBA().a < 1.0 {
            // alpha value
            let alphaValueArcImage = AlphaValueArcImage()
            let imageView = UIImageView(image: alphaValueArcImage.drawImage(style: style))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.frame = style.rect
            return imageView
        }
        
        // solid color
        let gradientArcView = GradientColorArcView(frame: style.rect)
        let imageView = UIImageView(image: gradientArcView.drawImage(style: style))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = style.rect
        return imageView
    }
}
