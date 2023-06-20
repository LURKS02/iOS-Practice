//
//  Cat+CoreDataProperties.swift
//  objectTest
//
//  Created by 지혜 on 2023/06/16.
//
//

import Foundation
import CoreData


extension Cat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cat> {
        return NSFetchRequest<Cat>(entityName: "Cat")
    }

    @NSManaged public var content: String?
    @NSManaged public var insertDate: Date?

}

extension Cat : Identifiable {

}
