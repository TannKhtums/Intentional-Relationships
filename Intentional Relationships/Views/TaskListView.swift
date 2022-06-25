//
//  DailyToDoListView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/17/22.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListViewModel = TaskListViewModel()
    
    let tasks = testDataTasks
    
    @State var presentAddNewItem = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(taskListViewModel.taskCellViewModels) { taskCellViewModel in
                        TaskCell(taskCellViewModel: taskCellViewModel)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellViewModel: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.taskListViewModel.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: { self.presentAddNewItem.toggle()}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add New Task")
                    }
                }
                .padding()
            }
            .navigationTitle("Tasks")
        }
    }
}

struct DailyToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellViewModel: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = { _ in }
    
    //learn swiftui + combine
    
    var body: some View {
        HStack {
            Image(systemName: taskCellViewModel.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellViewModel.task.completed.toggle()
                }
            TextField("Enter a task title", text: $taskCellViewModel.task.title, onCommit: {
                self.onCommit(self.taskCellViewModel.task)
                // this captures the oncommit event on the text field, it so when the user hits enter on the text field, then we receive this callback and take the current task and send it in the callback and capture it in the if presentAdddNewItem
            })
        }
    }
}
