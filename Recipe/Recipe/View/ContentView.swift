//
//  ContentView.swift
//  Recipe
//
//  Created by laila on 10/06/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {
    
    @ObservedObject var listViewModel: ListViewModel
    var body: some View {
        NavigationStack{
            List(listViewModel.mealList?.meals ?? []){ recipe in
                HStack{
                    WebImage(url: URL(string: recipe.strMealThumb))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 220)
                        .cornerRadius(14)
                    NavigationLink(recipe.strMeal, destination: DetailsView.init(id: Int(recipe.idMeal)!, detailsViewModel: listViewModel))
                        .font(.title)
                        .padding(.bottom)
                }
            }.navigationTitle("Dessert Menu")
            .onAppear() {
                self.listViewModel.getListOfMeals(url: Constants.mainMenue, type: MealList.self)
            }
        }
    }
}
