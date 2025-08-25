//
//  Capsule.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/18/25.
//

import SwiftUI

struct CapsuleView: View{
    var text: String
    var color: Color
    
    public var body: some View {
        Text(text)
            .font(.caption).fontWeight(.bold).padding(8)
            .background(color.opacity(0.2)).clipShape(Capsule())
            
    }
    
    
}
