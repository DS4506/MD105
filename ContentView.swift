//
//  ContentView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/6/25.
//

import SwiftUI


// MARK: - Data Source (keep only ONE definition of this array in the whole project)

// MARK: - Main View
struct ContentView: View {
    @State private var books:[Book] = getBooks()
    
    var body: some View {
        NavigationView {
            List($books) {$book in
                NavigationLink(destination: DetailView(book: $book)) {
                    LinkView(book: book)
                }
                .border(Color.blue, width: 2)
            }
            .navigationTitle("LOTR Trilogy")
        }
        .border(Color.green, width: 2)
    }
}




#Preview {
    ContentView()
}
