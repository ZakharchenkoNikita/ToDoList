//
//  TaskListTableViewController.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    var lists = ToDoList.getToDoLists()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func unwindSegue(_ unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func addListButtonPressed(_ sender: UIBarButtonItem) {
        addNewList()
    }
}

// MARK: - Table view data source
extension TaskListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskList", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let list = lists[indexPath.row]
        
        content.image = UIImage(systemName: "list.triangle")
        content.text = list.name
        let taskCount = list.tasks.count
        if taskCount > 0 {
            content.secondaryText = String(taskCount)
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Table view delegate
extension TaskListTableViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentList = lists.remove(at: sourceIndexPath.row)
        lists.insert(currentList, at: destinationIndexPath.row)
    }
}

// MARK: - TaskTableViewControllerDelegate
extension TaskListTableViewController: TaskTableViewControllerDelegate {
    func saveData(toDoList: ToDoList) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        lists.remove(at: indexPath.row)
        lists.insert(toDoList, at: indexPath.row)
    
        tableView.reloadData()
    }
}

// MARK: - Private Methods
extension TaskListTableViewController {
    private func addNewList() {
        let alert = UIAlertController(title: "Новый список", message: nil, preferredStyle: .alert)

        
        alert.addTextField { newListTF in
            newListTF.placeholder = "Введите название списка..."
            newListTF.returnKeyType = .done
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let textField = alert.textFields?.first else { return }
            guard let name = textField.text, !name.isEmpty else { return }
            
            self.lists.insert(ToDoList(name: name, tasks: []), at: 0)
            self.tableView.reloadData()
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Navigation
extension TaskListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let taskTableVC = segue.destination as? TaskTableViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let list = lists[indexPath.row]
        taskTableVC.list = list
        taskTableVC.delegate = self
    }
}
