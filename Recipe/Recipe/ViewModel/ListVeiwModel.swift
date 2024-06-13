//
//  ListVeiwModel.swift
//  Recipe
//
//  Created by laila on 10/06/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published private(set) var mealList: MealList?
    @Published private(set) var mealByID: MealByID?
    @Published private(set) var mealDetail: MealDetail?
    
    func getListOfMeals<T>(url: String, type: T.Type) {
        guard let url = URL(string: url) else{
            print("invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if(T.Type.self == MealList.Type.self){
                self.mealList = try! JSONDecoder().decode(MealList.self, from: data)
            }
            else if(T.Type.self == MealByID.Type.self){
                self.mealByID = try! JSONDecoder().decode(MealByID.self, from: data)
            }
        }.resume()
    }
}


