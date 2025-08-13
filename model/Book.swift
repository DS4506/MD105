//
//  Book.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/11/25.
//

import SwiftUI

// MARK: - Data Model
struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var image: String
    var description: String
    var rating: Double
    var review: String
    
    var status: ReadingStatus // "Plan to read", "Reading" , "Dropped" , "Finished"
}
    


    
        
    
    

