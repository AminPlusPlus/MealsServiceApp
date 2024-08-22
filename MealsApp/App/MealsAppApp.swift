//
//  MealsAppApp.swift
//  MealsApp
//
//  Created by Aminjoni Abdullozoda on 8/20/24.
//

import SwiftUI

@main
struct MealsAppApp: App {
    var body: some Scene {
        WindowGroup {
            MealCategoriesView(service: MealsServiceImpl())
        }
    }
}
