//
//  LPImageSegment.swift
//  Lepton
//
//  Created by William Tong on 11/30/16.
//  Copyright © 2016 Rameez Remsudeen. All rights reserved.
//

import UIKit
import Accelerate
import Metal

open class LPImageSegment: NSObject{
    public override init() {
        super.init()
    }
    
    open func kmeansSegment (_ image:UIImage) -> UIImage? {
        let img = LPImage(image:image)!
        let imageWidth = img.width
        let imageHeight = img.height
        let numPixels = imageWidth * imageHeight
        let points = Array<LPPixel>(img.pixels)
        let (clusters, memberships) = kMeans(points: points, k: 10, seed: 0, threshold: 0.001)
        
        for i in 0..<numPixels {
            let membership = memberships[i]
            let centroid = clusters[membership].centroid
            let newR = centroid.red
            let newG = centroid.green
            let newB = centroid.blue
            var pixel = img.pixels[i]
            pixel.red = newR
            pixel.green = newG
            pixel.blue = newB
            img.pixels[i] = pixel
        }
    
        return img.toUIImage()
    }
    
    open func KMeansGPU(_ image:UIImage) -> UIImage? {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("no GPU, aborting");
            return nil;
        }
        let metalContext = LPMetalContext(device: device)
        let img = LPImage(image:image)!
        let imageTexture = metalContext.imageToMetalTexture(image:img)!
        let outputTexture = 
        
        
        
        
        
        return metalContext.imageFromTexture(texture: <#T##MTLTexture#>)
    }
}
