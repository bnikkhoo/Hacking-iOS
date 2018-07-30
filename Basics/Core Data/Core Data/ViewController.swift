//
//  ViewController.swift
//  Core Data
//
//  Created by Babak Nikkhoo on 7/11/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = appDel.managedObjectContext
        /*
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Tits", forKey: "username")
        
        newUser.setValue("pass123", forKey: "password")
        
        do { try context.save() } catch { print("There was a problem") }
        */
        let request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do { let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    print(result.valueForKey("username")! , result.valueForKey("password")!)
                    
                }
                
            }
            
        } catch { print("Fetch failed") }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

