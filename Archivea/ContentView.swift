//
//  ContentView.swift
//  Archivea
//
//  Created by found on 21/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var modelContainer: ModelContainer = {
        let schema = Schema([
            ItemCollection.self,
            Collection.self,
            MyProfile.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some View {
        SplashView()
            .modelContainer(modelContainer)
    }
}

#Preview {
    ContentView()
}

