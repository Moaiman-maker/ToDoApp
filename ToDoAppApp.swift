//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by 橋本龍 on 2023/05/22.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
        }
    }
}
