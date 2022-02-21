//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Michael Luegmayer on 20.02.22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // create an instance of DataService and get the data
        self.recipes = DataService.getLocalData()
    }
}
