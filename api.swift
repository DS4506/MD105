//
//  api.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/11/25.
//

import SwiftUI
func getBooks() -> [Book] {
    return [
        Book(
            title: "The Fellowship of the Ring",
            author: "John Tolkien",
            image: "book 1",
            description: "The first journey of the Fellowship as they set out to destroy the One Ring.",
            rating: 3,
            review: "This is the review of The Fellowship of the Ring",
            status: .reading,
            isFavorite: true,
            genre: .fantasy
        ),
        
        Book(
            title: "The Two Towers",
            author: "Dave Epifanio",
            image: "book 2",
            description: "The Fellowship is split and new alliances are forged as the war for Middle-earth grows.",
            rating: 4,
            review: "This is the review of the two towers",
            status: .finished,
            genre: .fantasy
        ),
        
        Book(
            title: "The Return of the King",
            author: "Rolland James",
            image: "book 3",
            description: "The final push against Sauron and the fate of the Ring are decided.",
            rating: 5,
            review: "This is the review of the return of the king",
            status: .planToRead,
            isFavorite: true,
            genre: .fantasy
        )
    ]
}
