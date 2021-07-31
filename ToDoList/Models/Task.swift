//
//  Task.swift
//  ToDoList
//
//  Created by Nikita on 30.07.21.
//

struct Task {
    let title: String
    let isDone: Bool
}

extension Task {
    
    // Геттер с массивом текущих тасков
   static var CurrentTasks: [Task] {
        [ Task(title: "Work on App", isDone: false),
          Task(title: "Go to shop", isDone: true)]
    }
    
    // Геттер с массивом тасков на неделю
    static var WeeekTasks: [Task] {
        [ Task(title: "Work hard", isDone: false),
          Task(title: "Buy tickets", isDone: true)]
    }
    
}
