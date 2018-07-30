//
//  ViewController.swift
//  Stopwatch
//
//  Created by Babak Nikkhoo on 12/29/15.
//  Copyright © 2015 Babak Nikkhoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var time = 0
    
    func increaseTimer() {
        
        time += 1
        
        timeLabel.text = String(time) //or "\(time)"
        
    }
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBAction func start(sender: AnyObject) {
        
        if time == 0 {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.increaseTimer), userInfo: nil, repeats: true)
            
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()
        
    }
    
    @IBAction func reset(sender: AnyObject) {
        
        timer.invalidate()
        
        timeLabel.text = "0"
        
        time = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

