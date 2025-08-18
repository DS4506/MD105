//
//  FavoritesView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/16/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    
    let gridLayout = [GridItem(), GridItem()]
    
    private var favoriteBooks: Array<Binding<Book>> {
        $books.filter{ $0.wrappedValue.isFavorite}
    }
    
    var body: some View {
        NavigationStack {
            if favoriteBooks.isEmpty {
                Text("No favorites found.")
            }
            else{
                ScrollView{
                    LazyVGrid(columns: gridLayout){
                        ForEach(favoriteBooks) { book in
                            NavigationLink(destination: DetailView(book: book)){
                                LinkView(book: book.wrappedValue)
                            }
                        }
                        
                    }
                }.navigationTitle("Favorites Books")
            }
            
        }
    }
    

    
    
    
    
}
