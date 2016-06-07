//
//  AddRestrictionViewController.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/19/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit
import CoreData

class AddRestrictionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    //MARK: Properties
    var pickerLabels:[String?] = []
    var selectedRestriction: String? = "Water (g)" //default selection
    var selectedRestrictionIndex: Int? = 0 //default selection
    var userAmount:String? = "0"
    var newRestriction:restrictionClass? = restrictionClass(index: 0, name: "Water (g)", amount: 0, moreOrLess: 0)
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var restrictionPicker: UIPickerView!
    @IBOutlet weak var userAmountInput: UITextField!
    //@IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Is this shit even happening?")
        //samplePickerLabels = ["Test Label 1", "Test Label 2", "Test Label 3", "Test Label 4"]
        pickerLabels = loadRestrictionLabels()

        
        userAmountInput.delegate = self
        restrictionPicker.delegate = self //as UIPickerViewDelegate
        restrictionPicker.dataSource = self //as UIPickerViewDataSource
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func doneButtonAction(sender: UIButton) {
        /**
        print(" - Done Button")
        print(" - \(newRestriction!.name!)")
        print(" - amount of \(newRestriction!.amount!)")
        **/
        //performSegueWithIdentifier("backToTable", sender: newRestriction)
    }

    
    //MARK: Text Field overrides
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        userAmount = textField.text!
        newRestriction!.amount = Float(textField.text!)
        //tempLabel.text = textField.text!
        //print("finished Editing") //DEBUG
      
    }
    
    // MARK: Picker function overrides
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerLabels.count
    }// The number of rows of data
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerLabels[row]
    }// The data to return for the row and component (column) that's being passed in
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedRestrictionIndex = row
        newRestriction!.index = row
        selectedRestriction = pickerLabels[row]
        newRestriction!.name = pickerLabels[row]
        //print("Selected: \(selectedRestriction!) at row \(selectedRestrictionIndex!)") //DEBUG
        //tempLabel.text = selectedRestriction! //DEBUG
    }//this is what happens when an row in the picker is selected
    
    //MARK: Segue overrides
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        /**
        let nextViewController = segue.destinationViewController as! RestrictionsTableViewController
        //let tester = sender as! Food
        //print("ID: \(tester.id!)\nName: \(tester.name!)\nVal1: \(tester.val1!) -- should be 15.87")
        //nextViewController.recievedCell = sender as! FoodTableViewCell
        let newIndexPath = NSIndexPath(forRow: nextViewController.restrictionTable.count, inSection: 0)
        
        nextViewController.newRestriction = sender as? restrictionClass
        print(nextViewController.restrictionTable.count)
        nextViewController.restrictionTable.append(sender as? restrictionClass)
        print(nextViewController.restrictionTable.count)
        print("Index: \(newIndexPath.row)")
        
        //print("performing Segue")
        //print("-- \(nextViewController.newRestriction!.name!)")
        **/
        
    }//overridethe prepareForSegue function to send each cells information to the new view
    
    
    
    
    //MARK: My Functions
    
    func loadFile(contentsOfURL: NSURL, encoding: NSStringEncoding) -> [String?] {
        //let placeholder:[String?] = ["Hello", "Goodbye"]
        var returnStr:[String?] = []
        let myFilePath = NSData(contentsOfURL: contentsOfURL)
        let content = NSString(data: myFilePath!, encoding: encoding)
        
        let cont_lines:[String] = content!.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
        
        for line in cont_lines {
            returnStr.append(line)
        }
        
        return(returnStr)
    }
    
    func loadRestrictionLabels() -> [String?] {
        let fileName = "restrictionLabels"
        let contentsOfURL = NSBundle.mainBundle().URLForResource(fileName, withExtension: "txt")
        let encoding = NSUTF8StringEncoding
        //var strArr = loadFile(contentsOfURL!, encoding: encoding)
        return(loadFile(contentsOfURL!, encoding: encoding))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
