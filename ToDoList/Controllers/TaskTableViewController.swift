//
//  TaskTableViewController.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

import UIKit

class TaskTableViewController: UITableViewController {

    var list: ToDoList!
    var delegate: TaskTableViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = list.name
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        delegate.saveData(ToDoList: list)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.tasks?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "task", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        if let task = list.tasks?[indexPath.row] {
            content.text = task.title
            content.secondaryText = task.isDone ? "выполнена" : ""
            content.image = UIImage(systemName: "clock")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var status = true
        
        let isDone = UIContextualAction(style: .normal, title: nil) { _, _, _ in
            
            switch status {
            case false:
                self.getRowPostiton(indexPath: indexPath, isDone: status)
            default:
                self.getRowPostiton(indexPath: indexPath, isDone: status)
            }
            self.tableView.reloadData()
        }
        
        switch list.tasks?[indexPath.row].isDone {
        case false:
            isDone.image = UIImage(systemName: "checkmark.circle")
            isDone.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            status = true
        default:
            isDone.image = UIImage(systemName: "checkmark.circle.fill")
            isDone.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            status = false
        }
        
        return UISwipeActionsConfiguration(actions: [isDone])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: nil) { _, _, _ in
            self.list.tasks?.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        delete.image = UIImage(systemName: "trash.fill")
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return UISwipeActionsConfiguration(actions: [delete])
    }

    // MARK: Private Methods
    private func getRowPostiton(indexPath: IndexPath, isDone: Bool) {
        guard var element = list.tasks?.remove(at: indexPath.row) else { return }
        
        element.isDone = isDone
        
        switch isDone {
        case false:
            list.tasks?.insert(element, at: 0)
        default:
            list.tasks?.append(element)
        }
    }
}
