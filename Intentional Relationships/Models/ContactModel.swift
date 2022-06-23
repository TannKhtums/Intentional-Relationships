//
//  ContactModel.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/14/22.
//

import FirebaseFirestoreSwift

struct Contact: Identifiable, Codable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var birthday: String
    var groupTag: String
    var groupColor: String
    var greatTraits: [String]? = nil
    var memories: [String]? = nil
    var takeaways: [String]? = nil
}
