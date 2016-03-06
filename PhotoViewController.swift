//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Frank Yoo on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionsUIImageView: UIImageView!
    @IBOutlet var parentView: UIView!

    var image: UIImage!
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        print(imageView)
        photoScrollView.delegate = self
        
        photoScrollView.frame.origin.y = 0
        photoScrollView.delegate = self
        photoScrollView.alpha = 1
        doneButton.alpha = 1
        actionsUIImageView.alpha = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        let offset = Float(photoScrollView.contentOffset.y)
        
        
        UIView.animateWithDuration(1, delay: 0, options: [], animations: { () -> Void in
            self.photoScrollView.alpha = 0
            self.doneButton.alpha = 0
            self.actionsUIImageView.alpha = 0
            self.parentView.alpha = 0
            }, completion: nil)

        print(offset)

        func scrollViewDidEndDragging(scrollView: UIScrollView!,
            willDecelerate decelerate: Bool) {
                
                if offset > 100 {
                    
                    dismissViewControllerAnimated(true, completion: nil)
                
                } else {
                    
                    UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                        self.photoScrollView.frame.origin.y = 0
                        self.photoScrollView.alpha = 1
                        self.doneButton.alpha = 1
                        self.actionsUIImageView.alpha = 1
                        }, completion: nil)
                    
                }

        }
        
    }
    

    
    @IBAction func didPressDone(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
