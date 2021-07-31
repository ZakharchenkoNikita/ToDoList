//
//  UserManager.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    var lists: [ToDoList] = [ToDoList(name: "Ваш первый список", tasks: nil)]
    var tasks: [Task] = []
    
    private init() {}
}
