//
//  TodoListAppSwiftUIApp.swift
//  TodoListAppSwiftUI
//
//  Created by Muhammad Saeed on 31/07/2023.
//

import SwiftUI

@main
struct TodoListAppSwiftUIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
