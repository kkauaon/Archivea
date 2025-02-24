//
//  ArchiveaApp.swift
//  Archivea
//
//  Created by found on 21/01/25.
//

import SwiftUI
import SwiftData

@main
struct ArchiveaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environment(\.font, .system(.body, design: .rounded))
        }
    }
}
