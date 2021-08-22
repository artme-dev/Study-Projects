//
//  Label+CoreDataProperties.swift
//  SimpleCoreData
//
//  Created by Артём on 22.08.2021.
//
//

import Foundation
import CoreData


extension Label {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Label> {
        return NSFetchRequest<Label>(entityName: "Label")
    }

    @NSManaged public var title: String?
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension Label {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension Label : Identifiable {

}
