//
//  DescriptionView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/11/25.
//

import SwiftUI

struct DetailView: View {
    //    let book: Book
    
    @Binding var book: Book
    @State private var showingEditSheet = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.brown.opacity(0.1), .green.opacity(0.3)]), startPoint: .top, endPoint: .bottom) .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(book.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 100, maxHeight:150)
                            .padding(.vertical,20)
                        
                        VStack{
                            Text(book.title)
                                .font(.system(size: 36, weight: .bold, design:
                                        .serif))
                            
                            Text("by\(String(describing: book.author))")
                                .font(.headline).foregroundStyle(.secondary)
                        }
                        
                    }
                    
                    
                    HStack{
                        ForEach(1...5, id: \.self) {count in
                            Image(systemName: count <= book.rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    .accessibilityLabel("\(book.rating) out of 5 stars")
                    
                    HStack{
                        Text(book.status.rawValue)
                            .font(.caption).fontWeight(.bold).padding(8)
                            .background(Color.accentColor.opacity(0.2))
                            .clipShape(Capsule())
                        
                        if !book.description.isEmpty {
                            VStack(alignment: .leading) {
                                Text(book.description)
                            }
                        }
                        
                        if !book.review.isEmpty {
                            VStack(alignment: .leading) {
                                Text("My Review")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text(book.review)
                            }
                            .padding()
                        }
                        
                    }
                }
                
                .navigationTitle(book.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Edit") {
                            showingEditSheet = true
                        }
                    }
                }
                .sheet(isPresented: $showingEditSheet) {
                    EditView(book: $book)
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
