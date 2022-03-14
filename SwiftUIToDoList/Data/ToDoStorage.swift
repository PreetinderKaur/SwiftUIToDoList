//
//  ToDoStorage.swift
//  SwiftUIToDoList
//
//  Created by PREETINDER MAROK on 2022-03-14.
//

import Foundation

class ToDoStorage: ObservableObject {
    @Published var toDos = [ToDoItem]() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(toDos), forKey: "toDos")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.value(forKey: "toDos") as? Data {
            if let userDefaultTodos = try? PropertyListDecoder().decode(Array<ToDoItem>.self, from: data) {
                toDos = userDefaultTodos
            }
        }
    }
}
