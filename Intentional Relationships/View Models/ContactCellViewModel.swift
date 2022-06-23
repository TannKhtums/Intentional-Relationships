//
//  ContactCell.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/14/22.
//

import Foundation
import Combine

class ContactCellViewModel: ObservableObject, Identifiable {
    
    private let contactRepository = ContactRepository()
    @Published var contact: Contact
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(contact: Contact) {
        self.contact = contact
        $contact
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
