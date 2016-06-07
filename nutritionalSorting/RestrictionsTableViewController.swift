//
//  RestrictionsTableViewController.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/19/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit
import CoreData

class RestrictionsTableViewController: UITableViewController {
    
    //MARK: Properties
    var coreRestrictions = [NSManagedObject]()
    var addRestrictions:[restrictionClass?] = []
    var restrictionTable:[restrictionClass?] = []
    var newRestriction:restrictionClass?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 80.0
        navigationItem.leftBarButtonItem = editButtonItem() //add a edit button in the left hand corner

        //print("Is the table view loading?")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restrictionTable.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "RestrictionTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestrictionTableViewCell
        
        let restriction = restrictionTable[indexPath.row]
        cell.resName.text = restriction!.name
        cell.resAmount.text = "\(restriction!.amount!)"
        //print(restriction!.amount)

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
        
            managedContext?.deleteObject(coreRestrictions.removeAtIndex(indexPath.row)) //delete from coredata
            restrictionTable.removeAtIndex(indexPath.row) //delete from local table
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade) //deletion from tableview
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }//editing and deleting functionality in table


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print("SEGUE ATTACK!!!! OH NOOOO!!!!")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func unwindToRestrictionList(sender: UIStoryboardSegue) {
        let sourceViewController = sender.sourceViewController as! AddRestrictionViewController
        let newRestriction = sourceViewController.newRestriction
        let newIndexPath = NSIndexPath(forRow: restrictionTable.count, inSection: 0)
        restrictionTable.append(newRestriction)
        saveResToData(newRestriction)
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)

        
        
    }//unwind action triggered in next view by Done button
    
    func saveResToData(restriction: restrictionClass?) {
        //print("ADDING: \(restriction!.name!) -- \(restriction!.amount!)")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("CoreRestriction", inManagedObjectContext:managedContext!)
        let restrictionC = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        restrictionC.setValue(restriction!.index!, forKey: "index")
        restrictionC.setValue(restriction!.name!, forKey: "name")
        restrictionC.setValue(restriction!.amount!, forKey: "amount")
        restrictionC.setValue(restriction!.moreOrLess!, forKey: "moreOrLess")
        
        do {
            coreRestrictions.append(restrictionC)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        
        //let managedObjectContext = self.managedObjectContext
        //let restrictionItem = NSEntityDescription.insertNewObjectForEntityForName("CoreRestriction", inManagedObjectContext: managedObjectContext!) as! CoreRestriction
        //restrictionItem.amount =
    }

}
