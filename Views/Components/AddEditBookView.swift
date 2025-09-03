//
//  AddEditView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/16/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddEditBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var title: String = ""
    @State private var author: String = ""
    @State private var summary: String = ""
    @State private var rating: Int = 3
    @State private var image: UIImage?
    @State private var imageItem: PhotosPickerItem?

    var bookToEdit: PersistentBook?

    var body: some View {
        Form {
            Section(header: Text("Book Info")) {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                TextEditor(text: $summary)
                    .frame(height: 100)
                Picker("Rating", selection: $rating) {
                    ForEach(1...5, id: \.self) { num in
                        Text("\(num)").tag(num)
                    }
                }
            }
            Section(header: Text("Cover Image")) {
                PhotosPicker(selection: $imageItem, matching: .images) {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    } else {
                        Text("Select Image")
                    }
                }
            }
        }
        .navigationTitle(bookToEdit == nil ? "Add Book" : "Edit Book")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    saveBook()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .onChange(of: imageItem) { _ in
            loadImage()
        }
        .onAppear {
            if let book = bookToEdit {
                title = book.title
                author = book.author
                summary = book.summary
                rating = book.rating
                if let data = book.imageData {
                    image = UIImage(data: data)
                }
            }
        }
    }

    func loadImage() {
        guard let item = imageItem else { return }
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                image = uiImage
            }
        }
    }

    func saveBook() {
        let imageData = image?.jpegData(compressionQuality: 0.8)
        if let book = bookToEdit {
            // Edit existing
            book.title = title
            book.author = author
            book.summary = summary
            book.rating = rating
            book.imageData = imageData
        } else {
            // Add new
            let newBook = PersistentBook(title: title, author: author, summary: summary, rating: rating, imageData: imageData)
            modelContext.insert(newBook)
        }
        try? modelContext.save()
        dismiss()
    }
}

//  SwiftUI

//  AddEditView: View {
    // Binding var book: Book
    // @Environment(\.dismiss) var dismiss
    //Update @State navigationTitle
    
    
    //  body: some View {
        // NavigationView {
            // Form {
                // Section(header: Text("Book Details")) {
                    // TextField("Title", text: $book.title)
                    // TextField("Author", text: $book.author)
                    
                    // ("Status", selection: $book.status) {
                        // ForEach(ReadingStatus.allCases, id: \.self) { status in
                            // (status.rawValue).tag(status)
                            //
                            
                        // }
                    
                    // Picker("Genre", selection: $book.genre) {
                        // ForEach(Genre.allCases, id: \.self) { genre in
                            // Text(genre.rawValue).tag(genre)
                            // }
                        //
                    
                    // (text: $book.description)
                    // .frame(height: 150)
                        
                    //
                
                // (header: Text("My Rating & Review")) {
                    // StarRatingView(rating: $book.rating)
                    //TextEditor is for multi-line text input.
                    // TextEditor(text: $book.review)
                    // .frame(height: 150)
                    // }
                // }
            // .navigationTitle("navigationTitle") // update
            // .toolbar {
                // ToolbarItem(placement: .confirmationAction) {
                    // Button("Save") { dismiss() }
                    
                    // }
                // }
        //}
   // }
//}
