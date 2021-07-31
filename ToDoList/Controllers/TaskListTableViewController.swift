//
//  TaskListTableViewController.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    let manager = UserManager.shared
    let lists = ToDoList.getToDoLists()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskList", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let list = lists[indexPath.row]
        
        content.image = UIImage(systemName: "list.triangle")
        content.text = list.name
        if let taskCount = list.tasks?.count {
            content.secondaryText = String(taskCount)
        }
        
        cell.contentConfiguration = content
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addListButtonPressed(_ sender: UIBarButtonItem) {
        addNewList()
    }
}

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
            guard let textField = textField.text, !textField.isEmpty else { return }
            
            self.manager.lists.insert(ToDoList(name: textField, tasks: nil), at: 0)
            print(self.manager.lists)
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func addNewTaskList() {
        
    }
}
