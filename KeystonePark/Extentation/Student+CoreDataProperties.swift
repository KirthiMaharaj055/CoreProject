//
//  Student+CoreDataProperties.swift
//  KeystonePark
//
//  Created by Kirthi Maharaj on 2021/08/12.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var lesson: Lesson?

}

extension Student : Identifiable {

}
