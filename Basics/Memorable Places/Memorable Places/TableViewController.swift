//
//  TableViewController.swift
//  Memorable Places
//
//  Created by Babak Nikkhoo on 6/20/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit

var places = [Dictionary<String,String>()]
var activePlace = -1

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveStorage()
        if places.count == 0 {
            places.append(["name":"Waikiki Beach", "lat": "21.280410", "lon": "-157.836958"])
            saveStorage()
        }
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return places.count }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = places[indexPath.row]["name"]
        return cell
    }
    
    override func viewWillAppear(animated: Bool) { tableView.reloadData() }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        activePlace = indexPath.row
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) { if segue.identifier == "newPlace" { activePlace = -1 } }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            places.removeAtIndex(indexPath.row)
            saveStorage()
            tableView.reloadData()
        }
    }
    
    func saveStorage() {
        let userStorage = NSUserDefaults.standardUserDefaults()
        userStorage.setObject(places, forKey: "places")
    }
    
    func retriveStorage() {
        let userStorage = NSUserDefaults.standardUserDefaults()
        if userStorage.objectForKey("places") != nil {
            places = userStorage.objectForKey("places") as! [Dictionary<String,String>]
        }
    }
}