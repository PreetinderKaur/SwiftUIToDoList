//
//  ToDoList.swift
//  SwiftUIToDoList
//
//  Created by PREETINDER MAROK on 2022-03-14.
//

import SwiftUI

struct ToDoList: View {
    
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.toDoStorage.toDos) { todo in
                    
                    /// split the items
                    if todo.important {
                        Text(todo.title).bold()
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Rectangle())
                            .foregroundColor(.red)
                            .cornerRadius(5)
                    } else {
                        Text(todo.title)
                    }
                }.onDelete(perform: { indexSet in //delete on swipe
                    if let index = indexSet.first {
                        self.toDoStorage.toDos.remove(at: index)
                    }
                })
            }
            // navigate to detail view by pressing Add button
            .navigationBarTitle("To Do's").navigationBarItems(trailing:
                                                                NavigationLink(destination: CreateToDo()) {
                Text("Add")
            })
        }
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList().environmentObject(ToDoStorage())
    }
}
