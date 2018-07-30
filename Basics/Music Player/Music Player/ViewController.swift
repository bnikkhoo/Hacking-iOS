//
//  ViewController.swift
//  Music Player
//
//  Created by Babak Nikkhoo on 6/23/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    @IBAction func play(sender: AnyObject) { player.play() }
    
    @IBAction func pause(sender: AnyObject) { player.pause() }
    
    @IBAction func stop(sender: AnyObject) {
        player.pause()
        let audioPath = NSBundle.mainBundle().pathForResource("WhoKnows", ofType: "mp3")
        do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!)) } catch { } }
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) { player.volume = volumeSlider.value }
    
    @IBOutlet var scrubberSlider: UISlider!
    
    @IBAction func adjustScrubber(sender: AnyObject) { player.currentTime = NSTimeInterval(scrubberSlider.value) }
    
    func updateScrubSlider() { scrubberSlider.value = Float(player.currentTime) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = NSBundle.mainBundle().pathForResource("WhoKnows", ofType: "mp3")
        do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            scrubberSlider.maximumValue = Float(player.duration) } catch { }
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateScrubSlider), userInfo: nil, repeats: true) }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
}