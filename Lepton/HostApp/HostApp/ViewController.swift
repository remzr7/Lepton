//
//  ViewController.swift
//  HostApp
//
//  Created by William Tong on 11/14/16.
//  Copyright © 2016 William Tong. All rights reserved.
//

import UIKit
import Lepton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named:"sunset")!
        
        let kMeansThreshhold:Float = 0.001
        let k = 8
        
        //let lepton = LPImageFilter()
        let kmeans = LPImageSegment()
        
        
        
        //let gaussian3 = lepton.GaussianFilterGenerator(1.0)
        //let x = lepton.blurImage(image!, mask: gaussian3)
        //let x = lepton.acceleratedBlurImageCPU(image!, mask:gaussian3)
        //let newImage = kmeans.KMeansGPU(image, k: 4);
        
        let startTime = CFAbsoluteTimeGetCurrent()
        let newImage = kmeans.kmeansSegment(image, k:k, threshold:kMeansThreshhold);
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for \(title): \(timeElapsed) s")
        
        let imageView = UIImageView(image: newImage)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.addSubview(imageView)
        let newImageView = UIImageView(image: image)
        newImageView.frame = CGRect(x: 0, y: 310, width: 300, height: 300)
        view.addSubview(newImageView)
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

