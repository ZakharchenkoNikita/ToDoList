//
//  User.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

struct User {
    let login: String
    let password: String
    let email: String
    let toDoList: [ToDoList]
}

extension User {
    
    // Возвращает конкретного юзера с его списком задач
    func getUser() -> User {
        User(login: "TestUser", password: "12345",
             email: "testuser@gmail.com", toDoList: ToDoList.getToDoLists())
    }
}
