//
//  CoreRestriction.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/25/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import Foundation
import CoreData


class CoreRestriction: NSManagedObject {
    @NSManaged var index:NSNumber?
    @NSManaged var name:String?
    @NSManaged var amount:NSNumber?
    @NSManaged var moreOrLess:NSNumber?
    /**
    init(index: Int, name: String, amount: Int, moreOrLess: Int) {
        self.index = index
        self.name = name
        self.amount = amount
        self.moreOrLess = moreOrLess
    }**/
}