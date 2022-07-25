//
//  ToDoServiceImpl.swift
//  POP
//
//  Created by jc.kim on 7/26/22.
//
import Foundation

class ToDoServiceImpl: ToDoService {
    private var todoItems: [ToDo] = []

    func create(title: String) {
        let todo = ToDo(id: UUID().uuidString,
                        title: title,
                        done: false,
                        createdAt: Date())
        todoItems.append(todo)
    }
    
    func count() -> Int {
        return todoItems.count
    }
    
    func item(at index: Int) -> ToDo {
        return todoItems[index]
    }
}

extension ToDoServiceImpl: Toggable {
    func toggle(withId id: String) {
        if let found = todoItems.enumerated().first(where: { $0.element.id == id }) {
            let index = found.offset
            var todo = found.element
            todo.done = !todo.done
            todoItems[index] = todo
        }
    }
}
