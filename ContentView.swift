//
//  ContentView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/6/25.
//

import SwiftUI

// MARK: - Data Model
struct Book: Identifiable {
    let id = UUID()
    let title: String
    let image: String    // matches Asset Catalog name
    let description: String
}

// MARK: - Data Source (keep only ONE definition of this array in the whole project)
let books: [Book] = [
    Book(
        title: "The Fellowship of the Ring",
        image: "book 1",
        description: "The first journey of the Fellowship as they set out to destroy the One Ring."
    ),
    Book(
        title: "The Two Towers",
        image: "book 2",
        description: "The Fellowship is split and new alliances are forged as the war for Middle-earth grows."
    ),
    Book(
        title: "The Return of the King",
        image: "book 3",
        description: "The final push against Sauron and the fate of the Ring are decided."
    )
]

// MARK: - Main View
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(books) { currentItem in
                NavigationLink(destination: BookDetailView(item: currentItem)) {
                    BookRow(item: currentItem)
                }
                .border(Color.blue, width: 2)
            }
            .navigationTitle("LOTR Trilogy")
        }
        .border(Color.green, width: 2)
    }
}

// MARK: - Row View (renamed from LinkView)
struct BookRow: View {
    let item: Book

    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(8)

            Text(item.title)
                .font(.headline)
        }
    }
}

// MARK: - Detail View (renamed from DescriptionView)
struct BookDetailView: View {
    let item: Book

    var body: some View {
        VStack(spacing: 16) {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(12)
                .padding(.horizontal)

            Text(item.description)
                .padding()

            Spacer()
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
