//
//  AddEditView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/16/25.
//

import SwiftUI

struct AddEditView: View {
    @Binding var book: Book
    @Environment(\.dismiss) var dismiss
    //Update @State navigationTitle
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $book.title)
                    TextField("Author", text: $book.author)
                    
                    Picker("Status", selection: $book.status) {
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                            
                    }
                    
                    Picker("Genre", selection: $book.genre) {
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    
                    TextEditor(text: $book.description)
                        .frame(height: 150)
                        
                    }
                
                Section(header: Text("My Rating & Review")) {
                    StarRatingView(rating: $book.rating)
                    //TextEditor is for multi-line text input.
                    TextEditor(text: $book.review)
                        .frame(height: 150)
                }
            }
            .navigationTitle("navigationTitle") // update
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { dismiss() }
                    
                }
            }
        }
    }
}
