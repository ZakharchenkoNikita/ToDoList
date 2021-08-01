//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Nikita on 01.08.21.
//

import UIKit

class TaskViewController: UIViewController {
        
    @IBOutlet weak var taskTextField: UITextField!
    
    var delegate: TaskViewControllerDelegate!
    var currentTask: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let title = taskTextField.text, title != "" else { return }
        currentTask = Task(title: title, isDone: false)
        guard let currentTask = currentTask else { return }
        delegate.updateList(with: currentTask )
    }
    

    private func updateUI() {
        guard let task = currentTask else { return }
        taskTextField.text = task.title
    }
    
    


    

}
