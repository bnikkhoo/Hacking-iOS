//
//  ViewController.swift
//  Weather App
//
//  Created by Babak Nikkhoo on 12/31/15.
//  Copyright © 2015 Babak Nikkhoo. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private  var cityLabel: UILabel!
    
    @IBOutlet private var cityTextField: UITextField!
    
    @IBOutlet private var resultLabel: UILabel!
    
    private var brain = WeatherBrain()
    
    @IBAction private func getWeather(sender: AnyObject) {
        
        if cityTextField.text != "" {
            
            cityTextField.resignFirstResponder()
            
            let cityInfo = brain.cityFormat(cityTextField.text!)
            
            let cityUrl = brain.cityUrl(cityInfo[1])
            
            var wasSuccessful = false
             
            let task = NSURLSession.sharedSession().dataTaskWithURL(cityUrl) { (data, response, error) -> Void in
                if let urlContent = data {
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    let websiteArray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    if websiteArray.count > 1 {
                        let weatherArray = websiteArray[1].componentsSeparatedByString("</span>")
                        if weatherArray.count > 1 {
                            wasSuccessful = true
                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º ")
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.cityLabel.text = cityInfo[0] + " Weather"
                                self.resultLabel.text = "The 1 - 3 day weather forecast is: " + weatherSummary
                                self.cityTextField.text = ""
                            })
                        }
                    }
                }
                if wasSuccessful == false {
                    self.resultLabel.text = "Could not find the weather for \"" + cityInfo[0] + "\", please try again"
                    self.cityTextField.text = ""
                    self.cityLabel.text = ""
                }
            }
            task.resume()
            
        } else {
            self.resultLabel.text = "Enter a city to begin!"
            self.cityLabel.text = ""
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        cityTextField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}