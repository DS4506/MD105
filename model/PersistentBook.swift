//
//  Book.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/11/25.
//

import Foundation
import SwiftData
import UIKit

@Model
class PersistentBook: Identifiable {
    var id: UUID
    var title: String
    var author: String
    var summary: String
    var rating: Int
    var imageData: Data?

    init(id: UUID = UUID(), title: String, author: String, summary: String, rating: Int, imageData: Data? = nil) {
        self.id = id
        self.title = title
        self.author = author
        self.summary = summary
        self.rating = rating
        self.imageData = imageData
    }

    var coverImage: UIImage? {
        guard let data = imageData else { return nil }
        return UIImage(data: data)
    }
}
    
        
    
    

//mport SwiftUI

// MARK: - Data Model
 //public struct Book: Identifiable {
   //public let id = UUID()
  //  var title: String
   // var author: String
    //var image: String
  //  var description: String
   // var rating: Int
  //  var review: String
  //  var status: ReadingStatus // "Plan to read", "Reading" , "Dropped" , "Finished"
    //var isFavorite: Bool = false
  //  var genre: Genre
//}
