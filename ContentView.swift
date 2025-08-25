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
    @State private var showingAddBookSheet:Bool = false
    @State private var newBook = Book(
        title: "",
        author: "",
        image:"Default_book",
        description: "",
        rating: 0,
        review: "",
        status:.planToRead,
        isFavorite: true,
        genre: .scifi
    )
    
    var body: some View {
        NavigationView {
            List($books){ $book in
                NavigationLink(destination: DetailView(book: $book)) {
                    LinkView(book: book)
                }
            }
            
            .navigationTitle("My Books")
            .toolbar {
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button(action: { showingAddBookSheet = true}) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                    .accessibilityLabel("Add a new book")
                }
            }
            .sheet(isPresented: $showingAddBookSheet) {
                if !newBook.title.isEmpty {
                    books.append(newBook)
                } else {
                    newBook = Book(title: "", author: "", image:"Default_book", description: "", rating: 0, review: "", status: .planToRead, isFavorite: true, genre: .scifi)
                }
            } content: {
                EditView(book: $newBook)
            }
            .border(Color.blue, width: 2)
            }
            .border(Color.green, width: 2)
            .navigationTitle("LOTR Trilogy")
        }

    }

#Preview {
    ContentView()
}
