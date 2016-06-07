//
//  Food.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/12/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import Foundation
import CoreData
/**
class Food {
    var id: Int?
    var name: String?
}

class testClass {
    var id: Int?
    var name: String?
}

class Food {
     var id: Int?
     var name: String?
     var val1: Float?
     var val2: Float?
     var val3: Float?
     var val4: Float?
     var val5: Float?
     var val6: Float?
     var val7: Float?
     var val8: Float?
     var val9: Float?
     var val10: Float?
     var val11: Float?
     var val12: Float?
     var val13: Float?
     var val14: Float?
     var val15: Float?
     var val16: Float?
     var val17: Float?
     var val18: Float?
     var val19: Float?
     var val20: Float?
     var val21: Float?
     var val22: Float?
     var val23: Float?
     var val24: Float?
     var val25: Float?
     var val26: Float?
     var val27: Float?
     var val28: Float?
     var val29: Float?
     var val30: Float?
     var val31: Float?
     var val32: Float?
     var val33: Float?
     var val34: Float?
     var val35: Float?
     var val36: Float?
     var val37: Float?
     var val38: Float?
     var val39: Float?
     var val40: Float?
     var val41: Float?
     var val42: Float?
     var val43: Float?
     var val44: Float?
     var val45: Float?
     var val46: Float?
     var val47: Float?
     var description1: String?
     var val48: Float?
     var description2: String?
     var val49: Float?
} **/



class Food: NSManagedObject {
    @NSManaged var id: NSNumber?
    @NSManaged var name: String?
    @NSManaged var val1: NSNumber?
    @NSManaged var val2: NSNumber?
    @NSManaged var val3: NSNumber?
    @NSManaged var val4: NSNumber?
    @NSManaged var val5: NSNumber?
    @NSManaged var val6: NSNumber?
    @NSManaged var val7: NSNumber?
    @NSManaged var val8: NSNumber?
    @NSManaged var val9: NSNumber?
    @NSManaged var val10: NSNumber?
    @NSManaged var val11: NSNumber?
    @NSManaged var val12: NSNumber?
    @NSManaged var val13: NSNumber?
    @NSManaged var val14: NSNumber?
    @NSManaged var val15: NSNumber?
    @NSManaged var val16: NSNumber?
    @NSManaged var val17: NSNumber?
    @NSManaged var val18: NSNumber?
    @NSManaged var val19: NSNumber?
    @NSManaged var val20: NSNumber?
    @NSManaged var val21: NSNumber?
    @NSManaged var val22: NSNumber?
    @NSManaged var val23: NSNumber?
    @NSManaged var val24: NSNumber?
    @NSManaged var val25: NSNumber?
    @NSManaged var val26: NSNumber?
    @NSManaged var val27: NSNumber?
    @NSManaged var val28: NSNumber?
    @NSManaged var val29: NSNumber?
    @NSManaged var val30: NSNumber?
    @NSManaged var val31: NSNumber?
    @NSManaged var val32: NSNumber?
    @NSManaged var val33: NSNumber?
    @NSManaged var val34: NSNumber?
    @NSManaged var val35: NSNumber?
    @NSManaged var val36: NSNumber?
    @NSManaged var val37: NSNumber?
    @NSManaged var val38: NSNumber?
    @NSManaged var val39: NSNumber?
    @NSManaged var val40: NSNumber?
    @NSManaged var val41: NSNumber?
    @NSManaged var val42: NSNumber?
    @NSManaged var val43: NSNumber?
    @NSManaged var val44: NSNumber?
    @NSManaged var val45: NSNumber?
    @NSManaged var val46: NSNumber?
    @NSManaged var val47: NSNumber? //not good num
    @NSManaged var description1: String?
    @NSManaged var val48: NSNumber? //not good num
    @NSManaged var description2: String?
    @NSManaged var val49: NSNumber?
    
    func retrieveVal(index: Int) -> Float? {
        switch index {
            case 0:
                return(Float(val1!))
            case 1:
                return(Float(val2!))
            case 2:
                return(Float(val3!))
            case 3:
                return(Float(val4!))
            case 4:
                return(Float(val5!))
            case 5:
                return(Float(val6!))
            case 6:
                return(Float(val7!))
            case 7:
                return(Float(val8!))
            case 8:
                return(Float(val9!))
            case 9:
                return(Float(val10!))
            case 10:
                return(Float(val11!))
            case 11:
                return(Float(val12!))
            case 12:
                return(Float(val13!))
            case 13:
                return(Float(val14!))
            case 14:
                return(Float(val15!))
            case 15:
                return(Float(val16!))
            case 16:
                return(Float(val17!))
            case 17:
                return(Float(val18!))
            case 18:
                return(Float(val19!))
            case 19:
                return(Float(val20!))
            case 20:
                return(Float(val21!))
            case 21:
                return(Float(val22!))
            case 22:
                return(Float(val23!))
            case 23:
                return(Float(val24!))
            case 24:
                return(Float(val25!))
            case 25:
                return(Float(val26!))
            case 26:
                return(Float(val27!))
            case 27:
                return(Float(val28!))
            case 28:
                return(Float(val29!))
            case 29:
                return(Float(val30!))
            case 30:
                return(Float(val31!))
            case 31:
                return(Float(val32!))
            case 32:
                return(Float(val33!))
            case 33:
                return(Float(val34!))
            case 34:
                return(Float(val35!))
            case 35:
                return(Float(val36!))
            case 36:
                return(Float(val37!))
            case 37:
                return(Float(val38!))
            case 38:
                return(Float(val39!))
            case 39:
                return(Float(val40!))
            case 40:
                return(Float(val41!))
            case 41:
                return(Float(val42!))
            case 42:
                return(Float(val43!))
            case 43:
                return(Float(val44!))
            case 44:
                return(Float(val45!))
            case 45:
                return(Float(val46!))
            case 46:
                return(Float(val49!))
            default:
                return(0)
            
        }
    }
    
    
}

class restrictionClass {
    var index:Int?
    var name:String?
    var amount:Float?
    var moreOrLess:Int?
    init(index: Int, name: String, amount: Float, moreOrLess: Int) {
        self.index = index
        self.name = name
        self.amount = amount
        self.moreOrLess = moreOrLess
    }
} 
