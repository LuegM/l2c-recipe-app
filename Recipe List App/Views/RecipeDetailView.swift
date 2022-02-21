//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Michael Luegmayer on 20.02.22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 1.0)
                    
                    ForEach (recipe.ingredients, id: \.self) { item in
                        Text("• " + item)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 1.0)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { Index in
                        
                        Text(recipe.directions[Index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it on to preview somethings
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
