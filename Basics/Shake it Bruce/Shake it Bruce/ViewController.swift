//
//  ViewController.swift
//  Shake it Bruce
//
//  Created by Babak Nikkhoo on 6/24/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
    }

    func swiped(gesture: UISwipeGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                let audioPath = NSBundle.mainBundle().pathForResource("I Farted", ofType: "mp3")
                do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!)) } catch { }
                player.play()
                print("swiped right")
            case UISwipeGestureRecognizerDirection.Left:
                let audioPath = NSBundle.mainBundle().pathForResource("fart", ofType: "mp3")
                do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!)) } catch { }
                player.play()
                print("swiped left")
            default:
                break
            }
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            let audioPath = NSBundle.mainBundle().pathForResource("bruce lee kung fu", ofType: "mp3")
            do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!)) } catch { }
            player.play()
            print("shaken not stirred")
        }
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
}