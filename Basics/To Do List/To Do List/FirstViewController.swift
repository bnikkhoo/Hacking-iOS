//
//  FirstViewController.swift
//  To Do List
//
//  Created by Babak Nikkhoo on 06/05/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var list: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[(indexPath as NSIndexPath).row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            toDoList.remove(at: (indexPath as NSIndexPath).row)
            
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            
            list.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        list.reloadData()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "toDoList") != nil {
            
            toDoList = UserDefaults.standard.object(forKey: "toDoList") as! [String]
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
}
