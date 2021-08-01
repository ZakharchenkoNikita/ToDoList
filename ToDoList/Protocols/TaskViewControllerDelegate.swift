//
//  TaskViewControllerDelegate.swift
//  ToDoList
//
//  Created by Nikita on 01.08.21.
//

import Foundation

protocol TaskViewControllerDelegate {
    func updateTask(title: String)
    func createTask(task: Task)
}
