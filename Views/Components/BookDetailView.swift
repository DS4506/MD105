//
//  BookDetailView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 9/2/25.
//

import SwiftUI

struct BookDetailView: View {
    @ObservedObject var book: PersistentBook

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let image = book.coverImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 250)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                Text(book.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("by \(book.author)")
                    .font(.title2)
                Text("Rating: \(book.rating) / 5")
                    .font(.subheadline)
                Text(book.summary)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(book.title)
    }
}
