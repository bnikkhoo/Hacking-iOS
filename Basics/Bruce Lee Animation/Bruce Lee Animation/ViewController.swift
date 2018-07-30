//
//  ViewController.swift
//  Bruce Lee Animation
//
//  Created by Babak Nikkhoo on 6/8/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var x = 1
    
    var timer = NSTimer()
    
    var isAnimating = false

    @IBOutlet private var image: UIImageView!
    
    @IBAction private func action(sender: AnyObject) {
        
        if isAnimating == false {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(ViewController.doAnimation), userInfo: nil, repeats: true)
            
            isAnimating = true
            
        } else {
            
            timer.invalidate()
            
            isAnimating = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func doAnimation() {
        
        if x == 15 {
            
            x = 1
            
            sleep(1)
            
        } else {
            
            x += 1
            
        }
        
        image.image = UIImage(named: "frame\(x).png")
    }
    
    
    override func viewDidLayoutSubviews() {
        image.center = CGPointMake(image.center.x, image.center.y + 400)
        image.alpha = 0
        image.frame = CGRectMake(100, 0, 0, 0)
    }

    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2) {
            self.image.center = CGPointMake(self.image.center.x, self.image.center.y - 400)
            self.image.alpha = 1
            self.image.frame = CGRectMake(0, 20, 400, 400)
        }
    }

}

