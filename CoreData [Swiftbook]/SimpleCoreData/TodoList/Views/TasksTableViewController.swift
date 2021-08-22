//
//  TableViewController.swift
//  SimpleCoreData
//
//  Created by Артём on 20.08.2021.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    private var dataService = DataService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tasks"
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = false
        tableView.isUserInteractionEnabled = true
        setNavigationBar()
        
        dataService.fetchTasks()
    }

    private func setNavigationBar(){
        self.navigationController?.hidesBarsOnSwipe = true
        let button = UIButton(type: .contactAdd)
        button.addTarget(self, action: #selector(showTaskCreationAlert), for: .touchUpInside)
        
        let buttonBarItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = buttonBarItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TaskTableViewCell
        guard let taskCell = cell else { return UITableViewCell() }
        
        let taskModel = dataService.tasks[indexPath.row]
        
        taskCell.taskName = taskModel.name
        taskCell.isDone = taskModel.isDone
        taskCell.index = indexPath.row
        taskCell.toggleHandler = setTaskChecked
        
        return taskCell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        dataService.deleteTask(at: indexPath.row) {
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    // MARK: - UserActionHandlers
    
     @objc private func showTaskCreationAlert(){
        let alert = UIAlertController(title: "New task", message: nil, preferredStyle: .alert)
        alert.addTextField{
            filed in
            filed.placeholder = "Task name"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] action in
            guard let self = self else { return }
            guard let newTaskName = alert.textFields?[0].text else { return }
            self.addTask(taskName: newTaskName)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func addTask(taskName: String){
        dataService.addTask { task in
            task.name = taskName
        }
        tableView.reloadData()
    }
    
    lazy var setTaskChecked: ((Bool, Int)->Void) = { [weak self] isChecked, taskIndex in
        guard let self = self else { return }
        let task = self.dataService.tasks[taskIndex]
        guard let taskName = task.name else { return  }
        self.dataService.updateTask(withName: taskName) { task in
            task.isDone = isChecked
        }
        
    }

}
