//
//  ContactListViewModel.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/14/22.
//

import Combine

final class ContactListViewModel: ObservableObject {
    @Published var contactRepository = ContactRepository()
    @Published var contactViewModels: [ContactCellViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        contactRepository.$contacts
            .map { contacts in
                contacts.map(ContactCellViewModel.init)
            }
            .assign(to: \.contactViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ contact: Contact) {
        contactRepository.add(contact)
    }
    func remove(_ contact: Contact) {
        contactRepository.remove(contact)
    }
    func update(_ contact: Contact) {
        contactRepository.update(contact)
    }
    
}
