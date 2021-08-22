//
//  Task+CoreDataProperties.swift
//  SimpleCoreData
//
//  Created by Артём on 22.08.2021.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String?
    @NSManaged public var detailsText: String?
    @NSManaged public var deadline: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var label: Label?

}

extension Task : Identifiable {

}
