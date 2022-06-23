//
//  GroupListViewModel.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/1/22.
//

import Combine

final class GroupListViewModel: ObservableObject {
    @Published var groupRepository = GroupRepository()
    @Published var groupViewModels: [GroupCelLViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        groupRepository.$groups
            .map { groups in
                groups.map(GroupCelLViewModel.init)
            }
            .assign(to: \.groupViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ group: Group) {
        groupRepository.add(group)
    }
    func remove(_ group: Group) {
        groupRepository.remove(group)
    }
    func update(_ group: Group) {
        groupRepository.update(group)
    }
    
}
