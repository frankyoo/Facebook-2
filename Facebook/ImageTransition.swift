//
//  ImageTransition.swift
//  Tinder
//
//  Created by Frank Yoo on 3/2/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = toViewController as! PhotoViewController
        
        photoViewController.imageView.transform = CGAffineTransformMakeScale(0.85, 0.85)
        UIView.animateWithDuration(duration, animations: {
            photoViewController.imageView.transform = CGAffineTransformMakeScale(1, 1)
            //do other shit here
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = fromViewController as! PhotoViewController
        
        photoViewController.imageView.transform = CGAffineTransformMakeScale(1, 1)
        UIView.animateWithDuration(duration, animations: {
            photoViewController.imageView.transform = CGAffineTransformMakeScale(0.85, 0.85)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
