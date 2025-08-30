//
//  Constants.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/30/25.
//

 public let NEW_BOOK = Book(title: "", author: "",
                    image:"default_book", description: "", rating: 0,
                    review: "", status: .planToRead, genre: .classic)


public let  GRID_COLUMN_NUMBERS_KEY = "gridColumnNumber"

public let SETTINGS_THEME_KEY = "theme"

public let SETTINGS_GRID_SHOW_AUTHOR_KEY = "gridShowAuthor"

public let SETTINGS_APP_ACCENT_COLOR_KEY = "appAccentColor"

public let SETTINGS_LIST_SHOW_FAVORITES_ONLY_KEY = "listShowFavoritesOnly"

public let SETTINGS_LIST_SORT_KEY = "listSortOption"

struct spanishConstants {
    static let welcomeTitle = "¡Bienvenido!"
    static let welcomeSubtitle = "Biblioteca digital de libros clásicos!"
}

struct englishConstants {
    static let welcomeTitle = "Welcome!"
    static let welcomeSubtitle = "Digital classic book library"
}

enum Language {
    case spanish
    case english
}


public enum ListSortOption: String, CaseIterable, Identifiable {
    case title
    case author
    case ratingDescending
    
    public var id: String { rawValue }
    public var label: String {
        switch self {
        case .title: return "Title A–Z"
        case .author: return "Author A–Z"
        case .ratingDescending: return "Rating High to Low"
        }
    }
}
