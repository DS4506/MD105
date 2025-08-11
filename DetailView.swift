//
//  DescriptionView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/11/25.
//

import SwiftUI

struct DetailView: View {
    let item: Book

    var body: some View {
        VStack(spacing: 16) {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 260)
                .cornerRadius(12)
                .padding(.horizontal)

            Text(item.description)
                .font(.body)
                .padding(.horizontal)

            Spacer()
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
