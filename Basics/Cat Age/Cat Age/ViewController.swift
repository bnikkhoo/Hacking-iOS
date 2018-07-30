//
//  ViewController.swift
//  Cat Age
//
//  Created by Babak Nikkhoo on 12/27/15.
//  Copyright © 2015 Babak Nikkhoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var catAgeTextField: UITextField!
    
    @IBOutlet private var catAgeLabel: UILabel!
    
    @IBAction private func catAgeResult(sender: AnyObject) {
        var catAge = Int(catAgeTextField.text!)!
        catAge = catAge * 7
        catAgeLabel.text = "Your cat is \(catAge) years old!"
        print ("You're pressing my button!")
    }
    
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
           print ("Hello Boobs!")
        
    }

    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

