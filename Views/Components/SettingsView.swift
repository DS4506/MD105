//
//  Settings.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/25/25.
//

import SwiftUI

enum Theme: String, CaseIterable{
    case light, dark, system
    
    var id: String { rawValue }
    var label: String {
        switch self {
        case .system: return "System"
        case .light:  return "Light"
        case .dark:   return "Dark"
}

struct SettingsView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var theme: Theme = .system
    @AppStorage(GRID_COLUMN_NUMBERS_KEY) private var gridColumNumber: Int = 2
    @AppStorage(SETTINGS_GRID_SHOW_AUTHOR_KEY) private var showAuthor: Bool = true
    @AppStorage(SETTINGS_APP_ACCENT_COLOR_KEY) private var appAccentColor: Color = .accentColor
    // New list settings
    @AppStorage(SETTINGS_LIST_SHOW_FAVORITES_ONLY_KEY) private var showFavoritesOnly: Bool = false
    @AppStorage(SETTINGS_LIST_SORT_KEY) private var sortOptionRaw: String = ListSortOption.title.rawValue
    
    private var sortOption: ListSortOption {
        get { ListSortOption(rawValue: sortOptionRaw) ?? .title }
        set { sortOptionRaw = newValue.rawValue }
    }
    
    var body: some View {
        NavigationStack {
            Form {
              Section(header: Text("Apperance")) {
                  Picker("Theme", selection: $theme) {
                      ForEach(Theme.allCases, id: \.self) { theme in
                           Text(String(describing: theme))
                       }
                   }
                  ColorPicker("Accent Color", selection: $appAccentColor)
               }
                Section(header: Text("Grid Settungs")) {
                    Stepper("Colums: \(gridColumNumber)", value: $gridColumNumber, in: 2...4)
                    Toggle("Show Author", isOn: $gridShowAuthor)
                    
                }
           }
            // New: List settings
            Section(header: Text("List settings")) {
                Toggle("Show favorites only", isOn: $showFavoritesOnly)
                
                Picker("Sort books by", selection: Binding(
                    get: { sortOption },
                    set: { sortOption = $0 }
                )) {
                    ForEach(ListSortOption.allCases) { opt in
                        Text(opt.label).tag(opt)
                    }
                }
            }
            
            // About
            Section(header: Text("About")) {
                Text("Classic Books Library")
                Text("Version 1.0").foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Settings")
    }
}      }
   }


    

