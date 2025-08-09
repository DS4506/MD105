//
//  ContentView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/6/25.
//

import SwiftUI
let books = [
    Book(title:"The Fellowship of the Ring", image:"the fellowship of the ring", description:"The first book in the trilogy"),
]

struct Book {
    let id = UUID() // Automatic,  Unique
    let title: String;
    let image: String;
    let description: String;
}


  

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(books, id: \.self.id){ currentItem in
                NavigationLink(destination:
                DetailView()) {
                LinkView(item: currentItem)
                    }.border(Color.blue, width: 2)
                    }.navigationTitle(Text("LOTR Trilogy"))
        }.border(Color.green, width: 2)
        // slight change
    }
    }


#Preview {
    ContentView()
}
