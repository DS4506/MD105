//
//  LinkView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/6/25.
//

import SwiftUI

struct LinkView: View {
    let book: Book

    var body: some View {
        HStack(spacing: 12) {
            Image(book.image)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipped()
                .cornerRadius(8)

            Text(book.title)
                .font(.headline)
        }
    }
}
#Preview {
    ContentView()
    
}
