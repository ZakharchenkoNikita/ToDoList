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
                                                   isDone: false),
                                              Task(title: "Test",
                                                   isDone: false),
                                              Task(title: "Test1",
                                                   isDone: false)]),
                             ToDoList(name: "Ваш второй список",
                                                               tasks: [Task(title: "Ваша вторая задача",
                                                                            isDone: false),
                                                                       Task(title: "Test",
                                                                            isDone: false),
                                                                       Task(title: "Test1",
                                                                            isDone: false)])]
    
    private init() {}
}
