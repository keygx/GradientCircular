//
//  AlphaValueArcImage.swift
//  GradientCircular
//
//  Created by keygx on 2018/05/24.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

class AlphaValueArcImage {
    init() {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawImage(style: GradientCircularConf.Style) -> UIImage {
        // Start Color
        let startColorArcImage = { () -> UIImage in
            let gradientMaskView = GradientColorArcView(frame: style.rect)
            gradientMaskView.style = style.setColorGrayScale(startAlpha: style.gradient.start.toRGBA().a,
                                                             endAlpha: style.gradient.end.toRGBA().a,
                                                             clockwise: true)
            let gradientMaskImage = gradientMaskView.toUIImage(alpha: 1.0)
            
            let solidMaskView = SingleColorArcView(frame: style.rect)
            solidMaskView.style = style.setColorSingle(color: style.gradient.start)
            let solidMaskImage = solidMaskView.toUIImage(alpha: 1.0)
            
            let image = mask(image: solidMaskImage, maskImage: gradientMaskImage)
            
            return image
        }()
        
        // End Color
        let endColorArcImage = { () -> UIImage in
            let gradientMaskView = GradientColorArcView(frame: style.rect)
            gradientMaskView.style = style.setColorGrayScale(startAlpha: style.gradient.start.toRGBA().a,
                                                             endAlpha: style.gradient.end.toRGBA().a,
                                                             clockwise: false)
            let gradientMaskImage = gradientMaskView.toUIImage(alpha: 1.0)
            
            let solidMaskView = SingleColorArcView(frame: style.rect)
            solidMaskView.style = style.setColorSingle(color: style.gradient.end)
            let solidMaskImage = solidMaskView.toUIImage(alpha: 1.0)
            
            let image = mask(image: solidMaskImage, maskImage: gradientMaskImage)
            
            return image
        }()
        
        // Composite
        let image: UIImage = composite(image1: startColorArcImage, image2: endColorArcImage, style: style)
        
        return image
    }
}

extension AlphaValueArcImage {
    func mask(image: UIImage, maskImage: UIImage) -> UIImage {
        let maskRef: CGImage = maskImage.cgImage!
        let mask: CGImage = CGImage(
            maskWidth: maskRef.width,
            height: maskRef.height,
            bitsPerComponent: maskRef.bitsPerComponent,
            bitsPerPixel: maskRef.bitsPerPixel,
            bytesPerRow: maskRef.bytesPerRow,
            provider: maskRef.dataProvider!,
            decode: nil,
            shouldInterpolate: false)!
        
        let maskedImageRef: CGImage = image.cgImage!.masking(mask)!
        let scale = UIScreen.main.scale
        let maskedImage: UIImage = UIImage(cgImage: maskedImageRef, scale: scale, orientation: .up)
        
        return maskedImage
    }
    
    func composite(image1: UIImage, image2: UIImage, style: GradientCircularConf.Style) -> UIImage {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image1.size, false, scale)
        image1.draw(
            in: CGRect(x: 0, y: 0, width: image1.size.width, height: image1.size.height),
            blendMode: .overlay,
            alpha: style.gradient.start.toRGBA().a)
        image2.draw(
            in: CGRect(x: 0, y: 0, width: image2.size.width, height: image2.size.height),
            blendMode: .overlay,
            alpha: style.gradient.end.toRGBA().a)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
