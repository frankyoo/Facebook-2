//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var wedding1ImageView: UIImageView!
    @IBOutlet weak var wedding2ImageView: UIImageView!
    @IBOutlet weak var wedding3ImageView: UIImageView!
    @IBOutlet weak var wedding4ImageView: UIImageView!
    @IBOutlet weak var wedding5ImageView: UIImageView!
    
    var isPresenting: Bool = true
    var window = UIApplication.sharedApplication().keyWindow
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
        
        wedding1ImageView.frame.origin = CGPoint(x: 4, y: 83)
        wedding1ImageView.frame.size = CGSize(width: 155, height: 154)
        
        wedding2ImageView.frame.origin = CGPoint(x: 4, y: 241)
        wedding2ImageView.frame.size = CGSize(width: 155, height: 154)
        
        wedding3ImageView.frame.origin = CGPoint(x: 161, y: 83)
        wedding3ImageView.frame.size = CGSize(width: 156, height: 103)
        
        wedding4ImageView.frame.origin = CGPoint(x: 161, y: 187)
        wedding4ImageView.frame.size = CGSize(width: 156, height: 103)
        
        wedding5ImageView.frame.origin = CGPoint(x: 161, y: 292)
        wedding5ImageView.frame.size = CGSize(width: 156, height: 103)

//        var frame = window!.convertRect(wedding1ImageView.frame, fromView: scrollView)
//        window!.addSubview(wedding1ImageView)

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = self.wedding1ImageView.image
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        imageTransition = ImageTransition()
       
        destinationViewController.transitioningDelegate = imageTransition
        
        imageTransition.duration = 0.5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }

    @IBAction func didPressImageView(sender: UITapGestureRecognizer) {
        
//        var wedding1ImageView = UIImage(named: "wedding1")
//        var newImageView = UIImageView(image: wedding1ImageView)
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }
}
