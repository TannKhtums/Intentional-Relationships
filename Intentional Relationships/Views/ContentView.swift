//
//  ContentView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                SelfMainMenu()
                    .tabItem {
                        Label("Self", systemImage: "heart.fill")
                    }.navigationBarHidden(true)
                GroupListView()
                    .tabItem {
                        Label("Others", systemImage: "person.2.fill")
                    }.navigationBarHidden(true)
                QuoteView()
                .tabItem {
                    Label("Quote", systemImage: "quote.bubble")
                    }.navigationBarHidden(true)
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                        }.navigationBarHidden(true)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
