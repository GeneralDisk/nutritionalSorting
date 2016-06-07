//
//  FoodTableViewController.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/13/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit
import CoreData

class FoodTableViewController: UITableViewController {
    
    
    //MARK: Properties
    
    @IBOutlet var foodTable: UITableView!
    
    private var foodItems:[Food] = []
    private var restrictionItems:[CoreRestriction] = []
    var fetchResultController:NSFetchedResultsController!
    
    //MARK: Methods
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("AT food table view")
    }//this code is called whenever FoodTableViewController appears
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Load INITIAL TABLE")
        
        foodItems = loadData()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    /**
    func loadTestingSet() {
        print("Loading testing Set")
        let food1 = Food()
        food1.id = 9999
        food1.name = "Pork and Beans"
        
        let food2 = Food()
        food2.id = 6666
        food2.name = "Satan's Chops"
        
        let food3 = Food()
        food3.id = 1111
        food3.name = "Lame Sauce"
    
        /**
        let food1 = Food(9999, "Pork and Beans", 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, "heyo", 49, "yeayer", 50)
        let food2 = (6666,  "Satan's Chops",  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,  39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  "heyo",  49,  "yeayer",  52)
        let food3 = ( 1111,  "Lame Sauce",  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,  39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  "heyo",  50,  "yeayer",  52)
        **/
        foodItems.append(food1)
        foodItems.append(food2)
        foodItems.append(food3)
        print("done Loading")
        
    }//load in a testing set of fake data to see if the view controller is working
    **/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "FoodTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FoodTableViewCell
        
        let food = foodItems[indexPath.row]
        // Configure the cell...
        cell.nameLabel.text = food.name!
        cell.idLabel.text = "\(food.id!)"

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("ID of selected cell is: \(foodItems[indexPath.row].id!)")
        //var tappedCell = tableView.cellForRowAtIndexPath(indexPath)! as! FoodTableViewCell
        //print("index of tappedCell in Table: \(indexPath.row)")
        //print("ID: \(foodItems[indexPath.row].val1!), NAME: \(foodItems[indexPath.row].name!)")
        //performSegueWithIdentifier("foodItemSegue", sender: tappedCell)
        let sentInfo = foodItems[indexPath.row]
        performSegueWithIdentifier("foodItemSegue2", sender: sentInfo)
        
        
    }//this will control what happens when cells are tapped by the user
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextViewController = segue.destinationViewController as! FoodItemTableViewController
        //let tester = sender as! Food
        //print("ID: \(tester.id!)\nName: \(tester.name!)\nVal1: \(tester.val1!) -- should be 15.87")
        //nextViewController.recievedCell = sender as! FoodTableViewCell
        nextViewController.recievedCell = sender as! Food
        
        
    }//overridethe prepareForSegue function to send each cells information to the new view
    
    //MARK: Actions
    
    @IBAction func tester(sender: UIButton) {
        //print("PRESSED TESTER")
        //print("count: \(foodItems.count)")
        //foodItems.sortInPlace() { Int($0.id!) > Int($1.id!) }
        //foodItems.sortInPlace() { Int($0.id!) > 1200 }
        //foodTable
        //foodItems = loadData()
        //let numItems = foodItems.count
        /**
        for(var i = 0; i < 49; i++) {
            //print(foodItems[68].retrieveVal(i)!)
        }
        for (var i = 0; i < foodItems.count; i++) {
            print("\(i) - ID: \(foodItems[i].id!)")
            
            if (Int(foodItems[i].id!) < 1200) {
                print("-removing id")
                foodItems.removeAtIndex(i)
                i--
            }
            else {
                print("-Cool")
            }
        }//iterate through the entire table
        **/
        foodItems = loadData()
        restrictionItems = loadRestrictions()
        for items in restrictionItems {
            //print("name: \(items.name!), index: \(items.index!), resAmount: \(items.amount!), moreOrLess: \(items.moreOrLess!)")
            
            foodItems = applyRestriction(foodItems, resIndex: Int(items.index!), resAmount: Float(items.amount!), moreOrLess: Int(items.moreOrLess!))
        }
        
        foodTable.reloadData()
        
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: My Functions
    
    func loadData() -> [Food] {
        var data:[Food] = []
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: "Food")
            do {
                data = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Food]
                data.sortInPlace() { Int($0.id!) < Int($1.id!) }
                //data.sort({ Int($0.id!) < Int($1.id!) })
                return(data)
            } catch {
                print("You got big problems tryen to fetch shit brotha")
                print(error)
            }
            
        }
        return(data)
    }//retrieves data from our data model
    
    func loadRestrictions() -> [CoreRestriction] {
        var data:[CoreRestriction] = []
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: "CoreRestriction")
            do {
                data = try managedObjectContext.executeFetchRequest(fetchRequest) as! [CoreRestriction]
                //data.sortInPlace() { Int($0.id!) < Int($1.id!) }
                //data.sort({ Int($0.id!) < Int($1.id!) })
                return(data)
            } catch {
                print("You got big problems tryen to fetch shit brotha")
                print(error)
            }
            
        }
        return(data)
    }
    
    func applyRestriction(var data: [Food], resIndex: Int, resAmount: Float, moreOrLess: Int) -> [Food] {
        //NOTE: moreOrLess -- 0 = more, 1 = less
        //NOTE: resIndexes are corresponding values, i.e. if restriction water was called, index is 0 for val1
        if (moreOrLess == 0) {
            for (var i = 0; i < data.count; i++) {
                if (data[i].retrieveVal(resIndex)! > resAmount) {
                    //print("-removing id")
                    data.removeAtIndex(i)
                    i--
                }
            }//iterate through the entire table
            
            
        }//if no more than amount of restriction
        else {
            for (var i = 0; i < data.count; i++) {
                if (data[i].retrieveVal(resIndex)! < resAmount) {
                    data.removeAtIndex(i)
                    i--
                }
            }//iterate through the entire table
        }//else, no less than amount of restriction
        return(data)
    }
    
    
}
