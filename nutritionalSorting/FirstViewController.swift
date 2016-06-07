//
//  FirstViewController.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/6/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {
    
    //private var menuItems:[MenuItem] = []
    private var foodItems:[Food] = [] //MY CODE
    var fetchResultController:NSFetchedResultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /**
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: "Food")
            do {
                foodItems = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Food]
            } catch {
                print("You got big problems tryen to fetch shit brotha")
                print(error)
            }
        } **/
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: not sure if this will work
    /**
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        //return menuItems.count
        
        //MY CODE
        return(foodItems.count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! FoodTableViewCell
        /**
        // Configure the cell...
        cell.nameLabel.text = menuItems[indexPath.row].name
        cell.detailLabel.text = menuItems[indexPath.row].detail
        cell.priceLabel.text = "$\(menuItems[indexPath.row].price as! Double)"
        **/
        //MY CODE
        //move info to view
        cell.nameLabel.text = foodItems[indexPath.row].name
        cell.detailLabel.text = foodItems[indexPath.row].description1
        cell.priceLabel.text = "\(foodItems[indexPath.row].id!)"
        
        return cell
    } **/ 
    
    
    


}

