//
//  ViewController.swift
//  Is It Prime
//
//  Created by Babak Nikkhoo on 12/28/15.
//  Copyright © 2015 Babak Nikkhoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNumberTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func button(sender: AnyObject) {
        
        if let number = Int(userNumberTextField.text!) {
        
            var isPrime = true
        
            if number == 1 {
            
                isPrime = false
            
            }
        
            if number != 2 && number != 1 {
            
                for var i = 2; i < number; i++ {
                
                    if number % i == 0 {
                
                        isPrime = false
                
                    }
                }
            }
        
            if isPrime {
            
                resultLabel.text = userNumberTextField.text! + " is a prime number!"
            
            } else {
            
                resultLabel.text = userNumberTextField.text! + " is not a prime number"
            }
            
        } else {
            
            resultLabel.text = "Please enter a whole number"
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "2060.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

