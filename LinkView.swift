//
//  LinkView.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/6/25.
//

import SwiftUI

struct LinkView: View {
    let item : Book
    
    
    var body: some View {
        HStack {
            Image("the fellowship of the ring")
                .resizable()
                .frame(maxWidth: 48,
                       maxHeight: 48)
                .scaledToFit()
            Text(item.title)
            
        }.border(Color.purple, width: 2)
    }
}
