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
                            .frame(maxWidth: .infinity)
                            .frame(height: 260)
                            .cornerRadius(12)
                            .padding(.horizontal)
                        
                        VStack{
                            Text(book.title)
                                .font(.system(size: 36, weight: .bold, design:
                                        .serif))
                            
                            Text("by\(String(describing: book.author))")
                                .font(.headline).foregroundStyle(.secondary)
                        }
                        
                    }
                    
                    if !book.description.isEmpty {
                        VStack {
                            Text(book.description)
                        }
                        
                    }
                }
            }
            
            .navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Edit"){
                        //                    Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .sheet(isPresented: $showingEditSheet) {
                EditView(book: $book)
            }
        }
    }
}
