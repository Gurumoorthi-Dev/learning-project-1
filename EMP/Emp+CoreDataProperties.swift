//
//  Emp+CoreDataProperties.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//
//

import Foundation
import CoreData


extension Emp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emp> {
        return NSFetchRequest<Emp>(entityName: "Emp")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var profileImage: String?
    @NSManaged public var username: String?
    @NSManaged public var website: String?
    @NSManaged public var city: String?
    @NSManaged public var suite: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var street: String?
    @NSManaged public var lat: String?
    @NSManaged public var long: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var companyName: String?
    @NSManaged public var bs: String?

}

extension Emp : Identifiable {

}
