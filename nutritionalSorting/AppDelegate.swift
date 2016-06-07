//
//  AppDelegate.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/6/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        loadDatabase()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("NutritionalInfoData", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("nutritionalSorting.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to load the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            //abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext!.hasChanges {
            do {
                try managedObjectContext!.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    //MARK: my custom Methods
    func parseLine(let line: String, let data_columns: Int) -> [String?] {
        
        //MARK: declared variables and constants needed for parseLine
        var iter = 0
        var col_num = 0 //keep track of column number we're in
        var specialCase = false
        var data = [String?](count:data_columns, repeatedValue: nil) //this is the variable we will use to store each line's information
        
        let delimeter = ","
        let delimeterQuot = "\""
        let lineLength = line.characters.count
        
        //MARK: parse char by char for a single line
        for char in line.characters {
            
            if col_num == data_columns /**|| (iter == (lineLength))**/ {
                print("Forced Break from PARSELINE")//DEBUG
                print("col_num = \(col_num)") //DEBUG
                print("iter = \(iter) --- linelength = \(lineLength)") //DEBUG
                break
            }
            
            if specialCase {
                if String(char) == delimeterQuot {
                    if ((delimeter == (line.substringWithRange(Range<String.Index>(start: line.startIndex.advancedBy(iter+1), end: line.startIndex.advancedBy(iter+2)))))) {
                        if ((iter + 3) < lineLength) {
                            if Float(line.substringWithRange(Range<String.Index>(start: line.startIndex.advancedBy(iter+2), end: line.startIndex.advancedBy(iter+3)))) != nil {
                                specialCase = false //end special case
                            }//check if there is a number after ", so we capture the whole string
                            else {
                                if data[col_num] == nil {
                                    if (String(char) != " ") && (String(char) != "\"") {
                                        data[col_num] = "\(char)"
                                    } //don't include spaces or quotes at the start of strings
                                }//we can't unwrap a nil optional
                                else {
                                    data[col_num]! += "\(char)"
                                }//unwrap assignment
                            }//otherwise, input the next line
                        }
                        else {
                            specialCase = false //end special case
                        }
                        //now we iterate, but since our statement will automatically check again after looping, we don't need to do that
                        
                    }//this returns the next character in the stream and checks if it is a ','
                    else {
                        if data[col_num] == nil {
                            if (String(char) != " ") && (String(char) != "\"") {
                                data[col_num] = "\(char)"
                            } //don't include spaces or quotes at the start of strings
                        }//we can't unwrap a nil optional
                        else {
                            data[col_num]! += "\(char)"
                        }//unwrap assignment
                    }//if no delimeter, add character to stream
                }//if you find a quotation, check the next char for end of special case. we want to save quots b/c they could signify meausrements
                else {
                    if data[col_num] == nil {
                        if (String(char) != " ") && (String(char) != "\"") {
                            data[col_num] = "\(char)"
                        } //don't include spaces or quotes at the start of strings
                    }//we can't unwrap a nil optional
                    else {
                        data[col_num]! += "\(char)"
                    }//unwrap assignment
                }
            }//if special case has been found
            else if String(char) == delimeter {
                //print((line1.substringWithRange(Range<String.Index>(start: line1.startIndex.advancedBy(iter+1), end: line1.startIndex.advancedBy(iter+2)))))
                //check for special case, that is, check for '"' now
                //prin
                if ((iter + 2) > lineLength ) {
                    break
                }//if this is true, then you will get an indexing error, in which case, you've reached the end of the line, if that happens, break
                if delimeterQuot == (line.substringWithRange(Range<String.Index>(start: line.startIndex.advancedBy(iter+1), end: line.startIndex.advancedBy(iter+2)))) {
                    specialCase = true
                }//special case has been found
                if data[col_num] == nil {
                    data[col_num] = "0"
                }//if the data column is empty and delimeter is found, we should set the data to 0 sine the CSV file was ',,'
                col_num++
            }//if the delimeter is found, iterate the col_num
            else {
                if data[col_num] == nil {
                    if (String(char) != " ") && (String(char) != "\"") {
                        data[col_num] = "\(char)"
                    } //don't include spaces or quotes at the start of strings
                }//we can't unwrap a nil optional
                else {
                    data[col_num]! += "\(char)"
                }//unwrap assignment
            }//if no delimeter, add character to stream
            iter++ // current location of char in line1.characters
        }//parse each line
        
        if (col_num != (data_columns - 1) ) {
            for (var i = col_num ; i < data_columns ; i++) {
                data[i] = "0"
            }
        }//add in the string "0" to the rest of the fields if necessary
        return(data)
    }//end function parseLine()
    
    func parseCSVfile(contentsOfURL: NSURL, encoding: NSStringEncoding, let data_columns: Int) -> [(id: Int, name: String, val1: Float, val2: Float, val3: Float, val4: Float, val5: Float, val6: Float, val7: Float, val8: Float, val9: Float, val10: Float, val11: Float, val12: Float, val13: Float, val14: Float, val15: Float, val16: Float, val17: Float, val18: Float, val19: Float, val20: Float, val21: Float, val22: Float, val23: Float, val24: Float, val25: Float, val26: Float, val27: Float, val28: Float, val29: Float, val30: Float, val31: Float, val32: Float, val33: Float, val34: Float, val35: Float, val36: Float, val37: Float, val38: Float, val39: Float, val40: Float, val41: Float, val42: Float, val43: Float, val44: Float, val45: Float, val46: Float, val47: Float, description1: String, val48: Float, description2: String, val49: Float)]? {
        
        //var token = 0
        //Declare variables and constants
        var table_items:[(id: Int, name: String, val1: Float, val2: Float, val3: Float, val4: Float, val5: Float, val6: Float, val7: Float, val8: Float, val9: Float, val10: Float, val11: Float, val12: Float, val13: Float, val14: Float, val15: Float, val16: Float, val17: Float, val18: Float, val19: Float, val20: Float, val21: Float, val22: Float, val23: Float, val24: Float, val25: Float, val26: Float, val27: Float, val28: Float, val29: Float, val30: Float, val31: Float, val32: Float, val33: Float, val34: Float, val35: Float, val36: Float, val37: Float, val38: Float, val39: Float, val40: Float, val41: Float, val42: Float, val43: Float, val44: Float, val45: Float, val46: Float, val47: Float, description1: String, val48: Float, description2: String, val49: Float)]?
        
        let myCSVfilePath = NSData(contentsOfURL: contentsOfURL) //convert URL stream to NSStream
        
        //initialize optional data structure
        table_items = []
        
        //parse the data
        if let content = NSString(data: myCSVfilePath!, encoding: encoding) {
            let cont_lines:[String] = content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
            var isFirstTime = true
            for eachLine in cont_lines {
                if eachLine != "" {
                    var data = parseLine(eachLine, data_columns: data_columns)
                    if (!isFirstTime) {
                        
                        let table_item = (id: Int((data[0]!))!, name: data[1]!, val1: Float(data[2]!)!, val2: Float(data[3]!)!, val3: Float(data[4]!)!, val4: Float(data[5]!)!, val5: Float(data[6]!)!, val6: Float(data[7]!)!, val7: Float(data[8]!)!, val8: Float(data[9]!)!, val9: Float(data[10]!)!, val10: Float(data[11]!)!, val11: Float(data[12]!)!, val12: Float(data[13]!)!, val13: Float(data[14]!)!, val14: Float(data[15]!)!, val15: Float(data[16]!)!, val16: Float(data[17]!)!, val17: Float(data[18]!)!, val18: Float(data[19]!)!, val19: Float(data[20]!)!, val20: Float(data[21]!)!, val21: Float(data[22]!)!, val22: Float(data[23]!)!, val23: Float(data[24]!)!, val24: Float(data[25]!)!, val25: Float(data[26]!)!, val26: Float(data[27]!)!, val27: Float(data[28]!)!, val28: Float(data[29]!)!, val29: Float(data[30]!)!, val30: Float(data[31]!)!, val31: Float(data[32]!)!, val32: Float(data[33]!)!, val33: Float(data[34]!)!, val34: Float(data[35]!)!, val35: Float(data[36]!)!, val36: Float(data[37]!)!, val37: Float(data[38]!)!, val38: Float(data[39]!)!, val39: Float(data[40]!)!, val40: Float(data[41]!)!, val41: Float(data[42]!)!, val42: Float(data[43]!)!, val43: Float(data[44]!)!, val44: Float(data[45]!)!, val45: Float(data[46]!)!, val46: Float(data[47]!)!, val47: Float(data[48]!)!, description1: data[49]!, val48: Float(data[50]!)!, description2: data[51]!, val49: Float(data[52]!)!)
                        
                        
                        
                        table_items?.append(table_item) //apend items to the back of the table_items optional array
                        //token++
                    }
                    isFirstTime = false //no longer first time through
                }// we want to exclude the lines that are empty
            }//end for loop (this goes through the whole file
        }//this code will parse through an entire CSV
        return(table_items)
    }//end parseCSVfile()
    
    func loadDatabase() {
        //var table_items:[(id: Int, name: String, val1: Float, val2: Float, val3: Float, val4: Float, val5: Float, val6: Float, val7: Float, val8: Float, val9: Float, val10: Float, val11: Float, val12: Float, val13: Float, val14: Float, val15: Float, val16: Float, val17: Float, val18: Float, val19: Float, val20: Float, val21: Float, val22: Float, val23: Float, val24: Float, val25: Float, val26: Float, val27: Float, val28: Float, val29: Float, val30: Float, val31: Float, val32: Float, val33: Float, val34: Float, val35: Float, val36: Float, val37: Float, val38: Float, val39: Float, val40: Float, val41: Float, val42: Float, val43: Float, val44: Float, val45: Float, val46: Float, val47: Float, description1: String, val48: Float, description2: String, val49: Float)]?
        
        let data_columns = 53 //number of columns in data set
        
        let mainFile = "nutritinalInfoCSV"
        let secondaryFile = "testCSVr"
        let contentsOfURL = NSBundle.mainBundle().URLForResource(secondaryFile, withExtension: "csv")
        let encoding = NSUTF8StringEncoding
        
        
        if let allFoods = parseCSVfile(contentsOfURL!, encoding: encoding, data_columns: data_columns) {
            //printDatabase(allFoods)
            // Preload the menu items
            let managedObjectContext = self.managedObjectContext
            for foodItems in allFoods {
                let foodItem = NSEntityDescription.insertNewObjectForEntityForName("Food", inManagedObjectContext: managedObjectContext!) as! Food
                foodItem.name = foodItems.name
                foodItem.id = foodItems.id
                foodItem.val1 = foodItems.val1
                foodItem.val2 = foodItems.val2
                foodItem.val3 = foodItems.val3
                foodItem.val4 = foodItems.val4
                foodItem.val5 = foodItems.val5
                foodItem.val6 = foodItems.val6
                foodItem.val7 = foodItems.val7
                foodItem.val8 = foodItems.val8
                foodItem.val9 = foodItems.val9
                foodItem.val10 = foodItems.val10
                foodItem.val11 = foodItems.val11
                foodItem.val12 = foodItems.val12
                foodItem.val13 = foodItems.val13
                foodItem.val14 = foodItems.val14
                foodItem.val15 = foodItems.val15
                foodItem.val16 = foodItems.val16
                foodItem.val17 = foodItems.val17
                foodItem.val18 = foodItems.val18
                foodItem.val19 = foodItems.val19
                foodItem.val20 = foodItems.val20
                foodItem.val21 = foodItems.val21
                foodItem.val22 = foodItems.val22
                foodItem.val23 = foodItems.val23
                foodItem.val24 = foodItems.val24
                foodItem.val25 = foodItems.val25
                foodItem.val26 = foodItems.val26
                foodItem.val27 = foodItems.val27
                foodItem.val28 = foodItems.val28
                foodItem.val29 = foodItems.val29
                foodItem.val30 = foodItems.val30
                foodItem.val31 = foodItems.val31
                foodItem.val32 = foodItems.val32
                foodItem.val33 = foodItems.val33
                foodItem.val34 = foodItems.val34
                foodItem.val35 = foodItems.val35
                foodItem.val36 = foodItems.val36
                foodItem.val37 = foodItems.val37
                foodItem.val38 = foodItems.val38
                foodItem.val39 = foodItems.val39
                foodItem.val40 = foodItems.val40
                foodItem.val41 = foodItems.val41
                foodItem.val42 = foodItems.val42
                foodItem.val43 = foodItems.val43
                foodItem.val44 = foodItems.val44
                foodItem.val45 = foodItems.val45
                foodItem.val46 = foodItems.val46
                foodItem.val47 = foodItems.val47
                foodItem.val48 = foodItems.val48
                foodItem.val49 = foodItems.val49
                foodItem.description1 = foodItems.description1
                foodItem.description2 = foodItems.description2
                /**
                if managedObjectContext!.save() != true {
                print("insert error: \(error!.localizedDescription)")
                }
                **/
            }//gotta pass all the variables to the database, kind of a pain in the ass, but we gotta do it.
            
        }
        
    }//loads all the data
    


}

