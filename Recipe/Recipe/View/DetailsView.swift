//
//  DetailsView.swift
//  Recipe
//
//  Created by laila on 10/06/2024.
//

import SwiftUI

struct DetailsView: View {
    var id: Int
    @ObservedObject var detailsViewModel: ListViewModel
    
    init(id: Int, detailsViewModel: ListViewModel) {
        self.id = id
        self.detailsViewModel = detailsViewModel
    }
    var body: some View {
        List{
            VStack{
                Text(self.detailsViewModel.mealByID?.meals[0].strMeal ?? "")
                    .font(.title)
                    .bold()
                Text("Instructions:")
                    .font(.title)
                    .bold()
                Text(self.detailsViewModel.mealByID?.meals[0].strInstructions ?? "")
                Text("Ingredients")
                    .font(.title)
                    .bold()
                if let ingredients = self.detailsViewModel.mealByID?.meals[0].ingredients {
                    ForEach(ingredients){ ing in
                        Text(ing.ingredient + " : " + ing.measure)
                    }
                }
            }.onAppear(){
                self.detailsViewModel.getListOfMeals(url: Constants.detailedRecipe + String(self.id), type: MealByID.self)
            }
        }
    }
}
