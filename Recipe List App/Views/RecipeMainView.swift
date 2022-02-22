//
//  RecipeMainView.swift
//  Recipe List App
//
//  Created by Michael Luegmayer on 22.02.22.
//

import SwiftUI

struct RecipeMainView: View {
    var body: some View {
        
        TabView {
            
            Text("Feature site")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
                .tag(0)
            
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                .tag(1)
            
        }
        
    }
}

struct RecipeMainView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMainView()
    }
}
