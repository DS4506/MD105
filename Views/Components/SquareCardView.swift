//
//  SquareCardView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/18/25.
//

import SwiftUI

struct SquareCardView: View {
    var book: Book // dosen't edit
    
    @AppStorage(SETTINGS_GRID_SHOW_AUTHOR_KEY) private var showAuthor: Bool = true
    
    
    var body: some View {
        VStack {
            Text(book.title)
                .frame(maxWidth: .infinity)// wewant the text
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors:[.clear, .black.opacity(0.8)],
                    startPoint: .bottom,
                    endPoint: .top
                ))
            
            Spacer()
            if gridShowAuthor {
                
            }
            
            Text(book.author)
                .frame(maxWidth: .infinity)
                .font(.subheadline)
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(4)
                .background(LinearGradient(
                    colors:[.clear, .black.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                ))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image(book.image)
            .resizable()
            .scaledToFill()
            .opacity(0.9))
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
 }
    

