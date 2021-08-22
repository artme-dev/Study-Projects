//
//  CoreDataService.swift
//  SimpleCoreData
//
//  Created by Артём on 20.08.2021.
//

import Foundation
import CoreData

class DataService{
    
    static var shared = DataService()
    private init(){}
    var context: NSManagedObjectContext!
    
    var tasks: [Task] = []
    
    func addTask(configurationHandler: (Task)->()){
        let task = Task(context: context)
        configurationHandler(task)
        
        do{
            try context.save()
            tasks.append(task)
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchTasks(){
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do{
            let fetchedTasks = try context.fetch(request)
            tasks = fetchedTasks
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func updateTask(withName name: String, updatingHandler: (Task)->()){
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", name)
        do{
            let fetchedTasks = try context.fetch(request)
            guard let task = fetchedTasks.first else { return }
            updatingHandler(task)
            try context.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func deleteTask(at index: Int, completion: ()->()){
        let taskForDelete = tasks[index]
        context.delete(taskForDelete)
        
        do{
            try context.save()
            tasks.remove(at: index)
            completion()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
