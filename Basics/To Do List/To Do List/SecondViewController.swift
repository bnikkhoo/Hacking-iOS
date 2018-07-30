//
//  SecondViewController.swift
//  To Do List
//
//  Created by Babak Nikkhoo on 06/05/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func submit(_ sender: AnyObject) {
        
        if textField.text != "" {
            
            let newItem = textField.text!
            
            resultLabel.text = "'\(newItem)' added to the list!"
            
            toDoList.append(textField.text!)
            
            textField.text = ""
            
            textField.resignFirstResponder()
            
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.textField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}

