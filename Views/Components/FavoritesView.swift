//
//  FavoritesView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/16/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    @State private var showingFilterSheet = false
    @State private var selectedGenre: Genre?
    @State private var selectedStatus: ReadingStatus?
    
    //let gridLayout = [GridItem(), GridItem()]
    @AppStorage(GRID_COLUMN_NUMBERS_KEY) private var gridColumNumber: Int = 2
    
    private var gridLayout: [GridItem] {
        Array(repeating: GridItem(), count: 3)
    }
    
    private var favoriteBooks: [Binding<Book>] {
        $books.filter{
            $0.wrappedValue.isFavorite
            && ( selectedGenre == nil || $0.wrappedValue.genre == selectedGenre!)
            && ( selectedStatus == nil || $0.wrappedValue.status == selectedStatus!)
        }
    }
    
    var body: some View {
        let _ = print("re-rendering FavoritesView \(selectedGenre?.rawValue) \(selectedStatus?.rawValue)")
        
        NavigationStack {
            ScrollView{
                if favoriteBooks.isEmpty {
                    Spacer()
                    VStack(alignment: .center) {
                        if selectedGenre != nil || selectedStatus != nil {
                            Text("No books match your selection.")
                                .font(.headline)
                        }else{
                            Text("No favorites found.")
                                .font(.headline)
                        }
                        
                    }
                    Spacer()
                }
                else{
                    LazyVGrid(columns: gridLayout){
                        ForEach(favoriteBooks) { book in
                            NavigationLink(value:book.id)
                            {//This
                                SquareCardView(book:
                                                book.wrappedValue)
                            }
                        }
                        
                    }.padding()
                }
            }.navigationTitle("Favorites Books")
                navigationDestination(for: UUID.self){ bookID in
                    if let bookIndex = books.firstIndex(where:
                    { $0.id == bookID}) {
                        DetailView(book: $books[bookIndex])
                    }else {
                        Text("Book not found.")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Filter") {
                            showingFilterSheet = true }
                        }
                    }
                .sheet(isPresented: $showingFilterSheet) {
                    FilterView(selectedGenre: $selectedGenre,
                    selectedStatus: $selectedStatus
                    )
                    
                }
                
            }
            
        }
    }
    
