//
//  GroupCellViewModel.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/30/22.
//

import Combine

final class GroupCelLViewModel: ObservableObject, Identifiable {
    
    private let groupRepository = GroupRepository()
    @Published var group: Group
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(group: Group) {
        self.group = group
        $group
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
