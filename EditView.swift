//
//  Edit.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/11/25.
//

import SwiftUI
 
struct EditView: View {
    @Binding var book: Book
    
    @Environment(\.dismiss) var dismiss
    
//    @State private var navigationTitle: String
    
    
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $book.title)
                    TextField("Author", text: $book.author)
                    
                    Picker("Status", selection: $book.status) {
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                        
                    }
                    
                    TextEditor(text: $book.description)
                        .frame(height: 150)
                }
                
                
                //            Section(header: Text("My Rating & Review")) {
                //                StarRatingView(raiting: $book.rating)
                //                //TextEditor is for multi-line text input.
                //                    .frame(height: 150)
                //
                //
                //                TextEditor(text: $book.description)
                //                   .frame(height: 150)
                //            }
                
                
            }
            .navigationTitle("Edit book")
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {dismiss() }
                }
            }
        }
    }
}
