//
//  RecipeDetails.swift
//  Recipe
//
//  Created by laila on 10/06/2024.
//

import Foundation

struct MealByID: Decodable {
    let meals: [MealDetail]
}

struct MealDetail: Decodable, Identifiable {
    var id = UUID()
    let strMeal: String
    let strInstructions: String
    let idMeal: String
    let ingredients: [Ingredient]
}

struct Ingredient: Decodable, Identifiable{
    var id = UUID()
    let ingredient: String
    let measure: String
}

extension MealDetail {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        var num = 1
        var ingredients: [Ingredient] = []
        while let ingredient = mealDict["strIngredient\(num)"] as? String,
              let measure = mealDict["strMeasure\(num)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredients.append(.init(ingredient: ingredient, measure: measure))
            num += 1
        }
        self.ingredients = ingredients
        strMeal = mealDict["strMeal"] as? String ?? ""
        strInstructions = mealDict["strInstructions"] as? String ?? ""
        idMeal = mealDict["idMeal"] as? String ?? ""
    }
}




