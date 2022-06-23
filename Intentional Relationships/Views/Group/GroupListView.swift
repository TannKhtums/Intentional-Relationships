//
//  GroupListView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/30/22.
//

import SwiftUI

struct GroupListView: View {
    @ObservedObject var groupListViewModel = GroupListViewModel()
    @State private var showingAddGroup = false
    
    var body: some View {
        NavigationView {

            VStack {
                NavigationLink(destination: PersonView()) {
                    Text("ContactView")
                }
                .padding()
                List {
                    ForEach(groupListViewModel.groupViewModels) {  groupViewModel in
                        NavigationLink(destination: GroupDetailView(group: groupViewModel.group)) {
                            GroupCell(groupViewModel: groupViewModel)
                        }
                        }
                    }
                Button(action: { showingAddGroup = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add new group")
                    }.sheet(isPresented: $showingAddGroup) {
                        AddGroupView { group in
                            groupListViewModel.add(group)
                            showingAddGroup = false
                        }
                    }
                }
                .padding()
                }
            .navigationTitle("Groups")
            }
        }
    }

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(groupListViewModel: GroupListViewModel())
    }
}
