//
//  CreateToDo.swift
//  SwiftUIToDoList
//
//  Created by PREETINDER MAROK on 2022-03-14.
//

import SwiftUI

struct CreateToDo: View {
    
    @State var toDoTitle = "" // we create to live in that perticular view
    @State var important = false
    @Environment(\.presentationMode) var presentationMode // related to where you currently are in your app
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        List {
            Section {
                TextField("Ex. Walk the Dog", text: $toDoTitle)
            }
            Section {
                Toggle(isOn: $important) {
                    Text("Important")
                }
            }
            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        self.toDoStorage.toDos.append(ToDoItem(title: self.toDoTitle,
                                                               important: self.important))
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(toDoTitle.isEmpty)
                    Spacer()
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct CreateToDo_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDo().environmentObject(ToDoStorage())
    }
}
