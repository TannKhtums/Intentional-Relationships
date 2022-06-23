//
//  TaskListViewModel.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/18/22.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskRepository = TaskRepository()
    //make it published so you can listen to the tasks that are present

    @Published var taskCellViewModels = [TaskCellViewModel]()
    //^creates an empty array when initialized

    private var cancellables = Set<AnyCancellable>()

    init() {
        taskRepository.$tasks
        // this fetches the data from the task repository
            .map { tasks in
                tasks.map { task in
            TaskCellViewModel(task: task)
        }
    }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
}
    
    func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskVM)
    }
}
