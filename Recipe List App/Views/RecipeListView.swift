//
//  ContentView.swift
//  Recipe List App
//
//  Created by Michael Luegmayer on 20.02.22.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the ViewModel
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                    }
                }

                
                
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
