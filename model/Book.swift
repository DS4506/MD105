//
//  Book.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/11/25.
//

import SwiftUI

// MARK: - Data Model
 public struct Book: Identifiable {
   public let id = UUID()
    var title: String
    var author: String
    var image: String
    var description: String
    var rating: Int
    var review: String
    var status: ReadingStatus // "Plan to read", "Reading" , "Dropped" , "Finished"
    var isFavorite: Bool = false
    var genre: Genre
}
    


    
        
    
    

