//
//  MD105_CLASS1App.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/6/25.
//

import SwiftUI
import SwiftData

@main
struct MD105App: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: PersistentBook.self)
    }
}
