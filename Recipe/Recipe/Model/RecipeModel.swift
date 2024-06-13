//
//  RecipeModel.swift
//  Recipe
//
//  Created by laila on 10/06/2024.
//

import Foundation

struct MealList: Decodable{
    let meals: [Meal]
}
struct Meal: Decodable, Identifiable {
    var id: String {idMeal}
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
