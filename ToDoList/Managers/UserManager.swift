//
//  UserManager.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    var lists: [ToDoList] = [ToDoList(name: "Ваш первый список",
                                      tasks: [Task(title: "Ваша первая задача",
                                                   isDone: false)])]
    
    private init() {}
}
