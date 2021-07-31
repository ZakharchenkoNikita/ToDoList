//
//  ToDoList.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

struct ToDoList {
    let name: String
    let tasks: [Task]
}

extension ToDoList {
    
    // Возвращает массив со списками задач
    static func getToDoLists() -> [ToDoList] {
        [ToDoList(name: "Current", tasks: Task.getCurrentTasks()),
         ToDoList(name: "Week", tasks: Task.getWeekTasks())]
    }
}
