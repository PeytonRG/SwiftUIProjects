//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Peyton Gasink on 10/6/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
