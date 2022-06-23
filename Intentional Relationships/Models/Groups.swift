//
//  Groups.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/30/22.
//

import FirebaseFirestoreSwift

struct Group: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var color: String
    var contactNames: [String]? = nil
}
