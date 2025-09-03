//
//  BookListView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/16/25.
//
import SwiftUI
import SwiftData

struct BookListView: View {
    @Query(sort: \PersistentBook.title) var books: [PersistentBook]

    var body: some View {
        NavigationStack {
            List(books) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    HStack {
                        if let image = book.coverImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 75)
                                .cornerRadius(6)
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 50, height: 75)
                                .cornerRadius(6)
                        }
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("My Books")
            .toolbar {
                NavigationLink("Add Book", destination: AddEditBookView())
            }
        }
    }
}

      
                            
//import SwiftUI

//struct BookListView: View {
  //  @Binding var books: [Book]
    
    // Read user's settings
  //  @AppStorage(SETTINGS_LIST_SHOW_FAVORITES_ONLY_KEY) private var showFavoritesOnly: Bool = false
   // @AppStorage(SETTINGS_LIST_SORT_KEY) private var sortOptionRaw: String = ListSortOption.title.rawValue
    
    //private var sortOption: ListSortOption {
        //ListSortOption(rawValue: sortOptionRaw) ?? .title
   // }
    
    // Derived list after filtering and sorting
    //private var visibleBooks: [Book] {
       // let filtered = showFavoritesOnly ? books.filter { $0.isFavorite } : books
        
     //   switch sortOption {
       // case .title:
          //  return filtered.sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
        //case .author:
            //return filtered.sorted { $0.author.localizedCaseInsensitiveCompare($1.author) == .orderedAscending }
        //case .ratingDescending:
           // return filtered.sorted { $0.rating > $1.rating }
        //}
    //}
    
    //var body: some View {
        //List {
           // ForEach(visibleBooks) { book in
             //   NavigationLink(destination: DetailView(book: book)) {
                //    HStack(alignment: .top, spacing: 12) {
                 //       Image(book.image)
                        //.resizable()
                           // .scaledToFill()
                          //  .frame(width: 50, height: 70)
// .clipped()
// .cornerRadius(6)
                        
// VStack(alignment: .leading, spacing: 4) {
// Text(book.title).font(.headline)
// Text(book.author).font(.subheadline).foregroundStyle(.secondary)
                            
// HStack(spacing: 2) {
// ForEach(0..<5, id: \.self) { i in
// Image(systemName: i < book.rating ? "star.fill" : "star")
// }
// }
// .imageScale(.small)
// .foregroundStyle(.yellow)
// }
                        
// ()
                        
//  book.isFavorite {
// Image(systemName: "heart.fill").foregroundStyle(.red)
//
// }//                     .padding(.vertical, 4)
// }
//
//
// .listStyle(.insetGrouped)
// .navigationTitle("Books")
//
//
