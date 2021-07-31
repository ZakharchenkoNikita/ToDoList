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
    
    // Метод возвращает массив текущих тасков
    static func getCurrentTasks() -> [Task] {
        [ Task(title: "Work on App", isDone: false),
          Task(title: "Go to shop", isDone: true)]
    }
    
    // Метод возвращает массив тасков на неделю
    static func getWeekTasks() -> [Task] {
        [ Task(title: "Work hard", isDone: false),
          Task(title: "Buy tickets", isDone: true)]
    }
    
}
