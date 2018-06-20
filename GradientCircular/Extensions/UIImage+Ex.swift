//
//  UIImage+Ex.swift
//  GradientCircular
//
//  Created by keygx on 2018/06/20.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

extension UIImage {
    func mask(image maskImage: UIImage) -> UIImage {
        guard let imageRef: CGImage = self.cgImage else { return self }
        guard let maskRef: CGImage = maskImage.cgImage else { return self }
        guard let mask: CGImage = CGImage(maskWidth: maskRef.width,
                                          height: maskRef.height,
                                          bitsPerComponent: maskRef.bitsPerComponent,
                                          bitsPerPixel: maskRef.bitsPerPixel,
                                          bytesPerRow: maskRef.bytesPerRow,
                                          provider: maskRef.dataProvider!,
                                          decode: nil,
                                          shouldInterpolate: false) else { return self }
        guard let maskedImageRef: CGImage = imageRef.masking(mask) else { return self }
        
        let maskedImage: UIImage = UIImage(cgImage: maskedImageRef,
                                           scale: self.scale,
                                           orientation: .up)
        return maskedImage
    }
}
