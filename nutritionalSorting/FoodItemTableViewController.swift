//
//  FoodItemTableViewController.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/18/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit

class FoodItemTableViewController: UITableViewController, UITextFieldDelegate {
    
    //MARK: Properties and Outlets
    var recievedCell: Food!
    var modifier:Float = 1
    
    @IBOutlet var foodItemTable: UITableView!
    @IBOutlet weak var inputText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 80.0
        inputText.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        
        return 53
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "FoodItemTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FoodItemTableViewCell
        switch indexPath.row {
        case 0:
            //var cell2: FoodItemServingTableViewCell!

            cell.propertyLabel.text = "Food ID:"
            cell.valLabel.text = "\(recievedCell.id!)"
        case 1:
            cell.propertyLabel.text = "Name:  \(recievedCell.name!)"
            cell.valLabel.text = " "
        case 2:
            cell.propertyLabel.text = "Water (g):"
            cell.valLabel.text = "\(Float(recievedCell.val1!)*modifier)"
        case 3:
            cell.propertyLabel.text = "Energy (Kcal):"
            cell.valLabel.text = "\(Float(recievedCell.val2!)*modifier)"
        case 4:
            cell.propertyLabel.text = "Protein (g):"
            cell.valLabel.text = "\(Float(recievedCell.val3!)*modifier)"
        case 5:
            cell.propertyLabel.text = "Total Lipids (fat) (g):"
            cell.valLabel.text = "\(Float(recievedCell.val4!)*modifier)"
        case 6:
            cell.propertyLabel.text = "Ash (g):"
            cell.valLabel.text = "\(Float(recievedCell.val5!)*modifier)"
        case 7:
            cell.propertyLabel.text = "Carbohydrates (g):"
            cell.valLabel.text = "\(Float(recievedCell.val6!)*modifier)"
        case 8:
            cell.propertyLabel.text = "Total Dietary Fiber (g):"
            cell.valLabel.text = "\(Float(recievedCell.val7!)*modifier)"
        case 9:
            cell.propertyLabel.text = "Total Sugar (g):"
            cell.valLabel.text = "\(Float(recievedCell.val8!)*modifier)"
        case 10:
            cell.propertyLabel.text = "Calcium (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val9!)*modifier)"
        case 11:
            cell.propertyLabel.text = "Iron (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val10!)*modifier)"
        case 12:
            cell.propertyLabel.text = "Magnesium (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val11!)*modifier)"
        case 13:
            cell.propertyLabel.text = "Phosphorus (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val12!)*modifier)"
        case 14:
            cell.propertyLabel.text = "Potassium (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val13!)*modifier)"
        case 15:
            cell.propertyLabel.text = "Sodium (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val14!)*modifier)"
        case 16:
            cell.propertyLabel.text = "Zinc (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val15!)*modifier)"
        case 17:
            cell.propertyLabel.text = "Copper (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val16!)*modifier)"
        case 18:
            cell.propertyLabel.text = "Manganese (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val17!)*modifier)"
        case 19:
            cell.propertyLabel.text = "Selenium (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val18!)*modifier)"
        case 20:
            cell.propertyLabel.text = "Vitamin C (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val19!)*modifier)"
        case 21:
            cell.propertyLabel.text = "Thiamin (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val20!)*modifier)"
        case 22:
            cell.propertyLabel.text = "Riboflavin (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val21!)*modifier)"
        case 23:
            cell.propertyLabel.text = "Niacin (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val22!)*modifier)"
        case 24:
            cell.propertyLabel.text = "Pantothenic Acid (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val23!)*modifier)"
        case 25:
            cell.propertyLabel.text = "Vitamin B-6 (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val24!)*modifier)"
        case 26:
            cell.propertyLabel.text = "Folate, DFE (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val25!)*modifier)"
        case 27:
            cell.propertyLabel.text = "Folic Acid (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val26!)*modifier)"
        case 28:
            cell.propertyLabel.text = "Food Folate (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val27!)*modifier)"
        case 29:
            cell.propertyLabel.text = "Folate, DFE (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val28!)*modifier)"
        case 30:
            cell.propertyLabel.text = "Total Choline (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val29!)*modifier)"
        case 31:
            cell.propertyLabel.text = "Vitamin B-12 (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val30!)*modifier)"
        case 32:
            cell.propertyLabel.text = "Vitamin A, IU (IU):"
            cell.valLabel.text = "\(Float(recievedCell.val31!)*modifier)"
        case 33:
            cell.propertyLabel.text = "Vitamin A, RAE (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val32!)*modifier)"
        case 34:
            cell.propertyLabel.text = "Retinol (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val33!)*modifier)"
        case 35:
            cell.propertyLabel.text = "Alpha Carotine (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val34!)*modifier)"
        case 36:
            cell.propertyLabel.text = "Beta Carotine (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val35!)*modifier)"
        case 37:
            cell.propertyLabel.text = "Beta Cryptoxanthin (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val36!)*modifier)"
        case 38:
            cell.propertyLabel.text = "Lycopene (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val37!)*modifier)"
        case 39:
            cell.propertyLabel.text = "Lutein and Zeaxanthin (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val38!)*modifier)"
        case 40:
            cell.propertyLabel.text = "Vitamin E (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val39!)*modifier)"
        case 41:
            cell.propertyLabel.text = "Vitamin D, (D2 + D3) (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val40!)*modifier)"
        case 42:
            cell.propertyLabel.text = "Vitamin D (IU):"
            cell.valLabel.text = "\(Float(recievedCell.val41!)*modifier)"
        case 43:
            cell.propertyLabel.text = "Vitamin K (µg):"
            cell.valLabel.text = "\(Float(recievedCell.val42!)*modifier)"
        case 44:
            cell.propertyLabel.text = "Saturated Fat (g):"
            cell.valLabel.text = "\(Float(recievedCell.val43!)*modifier)"
        case 45:
            cell.propertyLabel.text = "Monounsaturated Fat (g):"
            cell.valLabel.text = "\(Float(recievedCell.val44!)*modifier)"
        case 46:
            cell.propertyLabel.text = "Polyunsaturated Fat (g):"
            cell.valLabel.text = "\(Float(recievedCell.val45!)*modifier)"
        case 47:
            cell.propertyLabel.text = "Cholesterol (mg):"
            cell.valLabel.text = "\(Float(recievedCell.val46!)*modifier)"
        case 48:
            cell.propertyLabel.text = "GmWt 1:"
            cell.valLabel.text = "\(Float(recievedCell.val47!)*modifier)"
        case 49:
            cell.propertyLabel.text = "\(recievedCell.description1!)"
            cell.valLabel.text = " "
        case 50:
            cell.propertyLabel.text = "GmWt 2:"
            cell.valLabel.text = "\(Float(recievedCell.val48!)*modifier)"
        case 51:
            cell.propertyLabel.text = "\(recievedCell.description2!)"
            cell.valLabel.text = " "
        case 52:
            cell.propertyLabel.text = "Refuse Percentage:"
            cell.valLabel.text = "\(recievedCell.val49!)%"
            
            default:
            cell.propertyLabel.text = "Placeholder"
            cell.valLabel.text = "-1"
            
        }//end Switch

        // Configure the cell...

        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if (textField.text != nil) {

            modifier = Float(textField.text!)!
        }//NOTE: this 'if' check doesn't work, won't find nil
        
        //print("Modifier changed to \(modifier)")
        
        
        foodItemTable.reloadData()
        
        
        //newRestriction!.amount = Float(textField.text!)
        //tempLabel.text = textField.text!
        //print("finished Editing") //DEBUG
        
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

}
