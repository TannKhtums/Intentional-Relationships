//
//  SelfMainMenu.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/24/22.
//

import SwiftUI

struct SelfMainMenu: View {
    var body: some View {
        VStack {
            Text("Self Main Menu")
            NavigationLink(destination: TaskListView()) {
                Text("To Do List")
            }
        }

    }
}

struct SelfMainMenu_Previews: PreviewProvider {
    static var previews: some View {
        SelfMainMenu()
    }
}
