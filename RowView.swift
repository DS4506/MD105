//
//  LinkView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/6/25.
//

import SwiftUI

struct RowView: View {
    let item: Book

    var body: some View {
        HStack(spacing: 12) {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipped()
                .cornerRadius(8)

            Text(item.title)
                .font(.headline)
        }
    }
}
#Preview {
    
}
