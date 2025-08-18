//
//  FavoriteToggle.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/16/25.
//

import SwiftUI

public struct FavoriteToggle: View {
    @State private var isFavorite = false
    
    @State private var opacity: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var offsetY: CGFloat = 0
    
    public var body: some View {
        ZStack {
            Image(systemName: "heart. fill")
                .foregroundColor(.red)
                .font(.largeTitle)
                .opacity(0.1)
                .scaleEffect(1)
                .offset(y: -10)
            
            
            Toggle( isOn: $isFavorite){
                Image(systemName: isFavorite ? "heart" : "heart.fill")
                    .foregroundColor(isFavorite ? .red :.secondary)
                
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(.spring, value: isFavorite)
            .accessibilityLabel(isFavorite ? "Remove from fravorites": "Add to favorites")
            .onChange(of: isFavorite) { oldView, newValue in
                guard newValue == true else {
                    return
                    
                }
                //Appear and grow
                withAnimation(.spring(response: 0.5, dampingFraction: 0.4)){
                    self.opacity = 1
                    self.scale = 1.2
                }
                // Float and vanish
                withAnimation(.easeInOut(duration: 0.5).delay(0.3)){
                    offsetY = -100
                    opacity = 0
                    
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    scale = 1
                    offsetY = 0
                    
                }
            }
            
            
        }
    }
    
}
