import Foundation

class DummyEmptyService: DummyMealsService {
    override func fetchMealCategories() async throws -> MealsCategories {
        throw ServiceError.emptyData
    }
}

class DummyInvalidURLService: DummyMealsService {
    override func fetchMealCategories() async throws -> MealsCategories {
        throw ServiceError.invalidURL("InvalidURL")
    }
}

class DummyMealsService: MealsService {
   
    func fetchMeal(by id: String) async throws -> MealResponse {
        try JSONDecoder().decode(MealResponse.self, from: jsonMealString.data(using: .utf8)!)
    }
    
    func fetchMealCategories() async throws -> MealsCategories {
        MealsCategories(categories: [
            MealsCategories.MealCategory(strCategory: "Italian"),
            MealsCategories.MealCategory(strCategory: "Chinese"),
            MealsCategories.MealCategory(strCategory: "Mexican"),
            MealsCategories.MealCategory(strCategory: "Indian"),
            MealsCategories.MealCategory(strCategory: "French")
        ])
    }
    
    func fetchMealDetaiCategories(by category: String) async throws -> MealCategoriesDetail {
        try JSONDecoder().decode(MealCategoriesDetail.self, from: jsonCategoriesDetailString.data(using: .utf8)!)
    }
    
}

fileprivate let jsonCategoriesDetailString = """
{
  "meals": [
    {
      "strMeal": "Apam balik",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
      "idMeal": "53049"
    },
    {
      "strMeal": "Apple & Blackberry Crumble",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
      "idMeal": "52893"
    }
  ]
}
"""

fileprivate let jsonMealString = """
{
  "meals": [
    {
      "idMeal": "52891",
      "strMeal": "Blackberry Fool",
      "strDrinkAlternate": null,
      "strCategory": "Dessert",
      "strArea": "British",
      "strInstructions": "For the biscuits, preheat the oven to 200C/180C (fan)/Gas 6 and line two large baking trays with baking parchment.",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg",
      "strTags": "Desert,Summer,Fruity,Dairy",
      "strYoutube": "https://www.youtube.com/watch?v=kniRGjDLFrQ",
      "strIngredient1": "Hazlenuts",
      "strIngredient2": "Butter",
      "strIngredient3": "Caster Sugar",
      "strIngredient4": "Lemon",
      "strIngredient5": "Plain Flour",
      "strIngredient6": "Baking Powder",
      "strIngredient7": "Blackberrys",
      "strIngredient8": "Sugar",
      "strIngredient9": "Caster Sugar",
      "strIngredient10": "Lemon Juice",
      "strIngredient11": "Double Cream",
      "strIngredient12": "Yogurt",
      "strIngredient13": "Mint",
      "strIngredient14": "",
      "strIngredient15": "",
      "strIngredient16": "",
      "strIngredient17": "",
      "strIngredient18": "",
      "strIngredient19": "",
      "strIngredient20": "",
      "strMeasure1": "50g",
      "strMeasure2": "125g",
      "strMeasure3": "150g",
      "strMeasure4": "Grated",
      "strMeasure5": "150g",
      "strMeasure6": "½ tsp",
      "strMeasure7": "600g",
      "strMeasure8": "75g",
      "strMeasure9": "2 tbs",
      "strMeasure10": "1 tbs",
      "strMeasure11": "300ml ",
      "strMeasure12": "100ml",
      "strMeasure13": "Garnish with",
      "strMeasure14": "",
      "strMeasure15": "",
      "strMeasure16": "",
      "strMeasure17": "",
      "strMeasure18": "",
      "strMeasure19": "",
      "strMeasure20": "",
      "strSource": "https://www.bbc.co.uk/food/recipes/blackberry_fool_with_11859",
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    }
  ]
}
"""
