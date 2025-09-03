//
//  UploadedImage.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/23/25.
//

import SwiftData
import Foundation

@Model
class UploadedImage {
    var imageData: Data?
    
    init(imageData: Data?) {
        self.imageData = imageData
        
    }
    
}
