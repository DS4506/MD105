//
//  Settings.swift
//  MD105-CLASS1
//
//  Created by Willie Earl on 8/25/25.
//

import SwiftUI

enum Theme: String, CaseIterable{
    case light, dark, system
    
}

struct SettingsView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var theme: Theme = .system
    @AppStorage(GRID_COLUMN_NUMBERS_KEY) private var gridColumNumber: Int = 2
    @AppStorage(SETTINGS_GRID_SHOW_AUTHOR_KEY) private var showAuthor: Bool = true
    @AppStorage(SETTINGS_APP_ACCENT_COLOR_KEY) private var appAccentColor: Color = .accentColor
    
    
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
      }
   }


    



