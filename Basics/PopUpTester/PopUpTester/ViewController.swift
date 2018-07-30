//
//  ViewController.swift
//  PopUpTester
//
//  Created by Babak Nikkhoo on 9/23/17.
//  Copyright © 2017 Babak Nikkhoo. All rights reserved.
////
//
//http://www.techotopia.com/index.php/An_iOS_10_Local_Notification_Tutorial

import UIKit
import UserNotifications

var messageBody = "" , badgeCount = 0

public func reset() {
    messageBody = "Just in case, fuck you again!"
    badgeCount = 0
}

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    
    func myAlert() {
        let alertController = UIAlertController(title: "Hey", message: "Fuck You!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Say that again", style: UIAlertActionStyle.default, handler: { action in self.myAlert() }))
        alertController.addAction(UIAlertAction(title: "No, Fuck You!", style: UIAlertActionStyle.destructive, handler: { action in self.localNotification() }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func localNotification(){
        let content = UNMutableNotificationContent()
        
        badgeCount += 1
        content.title = "Hey"
        content.subtitle = "Fuck you!"
        content.body = messageBody
        content.sound = UNNotificationSound.default()
        content.badge = badgeCount as NSNumber
        
        let repeatAction = UNNotificationAction(identifier:"repeat", title:"Repeat", options: [.destructive])
        let changeAction = UNTextInputNotificationAction(identifier: "change", title: "Change Message", options: [])
        
        let category = UNNotificationCategory(identifier: "actionCategory", actions: [repeatAction, changeAction], intentIdentifiers: [], options: [])
        
        content.categoryIdentifier = "actionCategory"
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in }
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        myAlert()
    }
    
    override func viewDidLoad() {
        UNUserNotificationCenter.current().requestAuthorization(options: [[.alert, .sound, .badge]]) { (granted, error) in }
        
        UNUserNotificationCenter.current().delegate = self
        reset()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "repeat": self.localNotification()
        case "change":
            let textResponse = response as! UNTextInputNotificationResponse
            messageBody = textResponse.userText
            self.localNotification()
        default: break
        }
        completionHandler()
    }
    
}

