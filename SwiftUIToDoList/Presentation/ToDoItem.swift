//
//  ToDoItem.swift
//  SwiftUIToDoList
//
//  Created by PREETINDER MAROK on 2022-03-14.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    var id = UUID() // unique id
    var title: String
    var important: Bool
    
    init(title: String, important: Bool) {
        self.title = title
        self.important = important
    }
}
