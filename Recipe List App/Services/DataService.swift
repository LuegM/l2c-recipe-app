//
//  DataService.swift
//  Recipe List App
//
//  Created by Michael Luegmayer on 20.02.22.
//

import Foundation

class DataService {
    
    // Method which returns a array of recipes
    static func getLocalData() -> [Recipe] {
        
        // define path of file
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if path != nil
        guard path != nil else {
            
            // if nil -> return empty recipe array
            return [Recipe]()
        }
        
        // Create URL object
        let url = URL(fileURLWithPath: path!)
        
        do {
            // Create Data object
            let data = try Data(contentsOf: url)
            
            // Decode data with JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add UUID for each recipe
                for r in recipeData {
                    r.id = UUID()
                    
                    //add UUID for each ingredient in a recipe
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                return recipeData
            }
            catch {
                // Error with parsing json
                print(error)
            }
                             
        }
        catch {
            // Error with getting Data
            print(error)
        }
        
        //return empty array if error ocurs
        return [Recipe]()
    }
}
