//
//  RecipeApp.swift
//  Recipe
//
//  Created by laila on 10/06/2024.
//

import SwiftUI

@main
struct RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(listViewModel: ListViewModel.init())
        }
    }
}
