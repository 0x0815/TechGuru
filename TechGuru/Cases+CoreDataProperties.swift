//
//  Cases+CoreDataProperties.swift
//  TechGuru
//
//  Created by Tobi on 19.10.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

import Foundation
import CoreData


extension Cases {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cases> {
        return NSFetchRequest<Cases>(entityName: "Cases");
    }

    @NSManaged public var spnumber: String?
    @NSManaged public var status: Int16
    @NSManaged public var dayin: NSDate?
    @NSManaged public var customername: String?
    @NSManaged public var article: String?
    @NSManaged public var errordescription: String?
    @NSManaged public var technician: String?
    @NSManaged public var customernumber: String?
    @NSManaged public var customermail: String?
    @NSManaged public var serialnumber: String?

}
