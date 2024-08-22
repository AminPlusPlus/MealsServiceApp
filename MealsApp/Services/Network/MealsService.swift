import Foundation

protocol MealsService {
    func fetchMeal(by id: String) async throws -> MealResponse
    func fetchMealCategories() async throws -> MealsCategories
    func fetchMealDetaiCategories(by category: String) async throws -> MealCategoriesDetail
}

final class MealsServiceImpl: MealsService  {

    func fetchMeal(by id: String) async throws -> MealResponse {
        let urlString = MealsEndpoints.lookupMeal(id: id).urlString
        guard let url = URL(string: urlString) else {
            throw ServiceError.invalidURL(urlString)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ServiceError.invalidResponse(URLError(.badServerResponse))
        }
        
        guard !data.isEmpty else {
            throw ServiceError.emptyData
        }
        
        do {
            let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
            if mealResponse.meals.isEmpty {
                throw ServiceError.emptyData
            }
            return mealResponse
        } catch {
            throw ServiceError.decodingError(error)
        }
    }
    
    func fetchMealCategories() async throws -> MealsCategories {
        let urlString = MealsEndpoints.mealCategoryList.urlString
        guard let url = URL(string: urlString) else {
            throw ServiceError.invalidURL(urlString)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ServiceError.invalidResponse(URLError(.badServerResponse))
        }
        
        guard !data.isEmpty else {
            throw ServiceError.emptyData
        }
        
        do {
            let mealsCategories = try JSONDecoder().decode(MealsCategories.self, from: data)
            if mealsCategories.categories.isEmpty {
                throw ServiceError.emptyData
            }
            return mealsCategories
        } catch {
            throw ServiceError.decodingError(error)
        }
    }
    
    func fetchMealDetaiCategories(by category: String) async throws -> MealCategoriesDetail {
        let urlString = MealsEndpoints.filterByCategory(category: category).urlString
        guard let url = URL(string: urlString) else {
            throw ServiceError.invalidURL(urlString)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ServiceError.invalidResponse(URLError(.badServerResponse))
        }
        
        guard !data.isEmpty else {
            throw ServiceError.emptyData
        }
        
        do {
            let mealCategoriesDetail = try JSONDecoder().decode(MealCategoriesDetail.self, from: data)
            if mealCategoriesDetail.categoriesDetail.isEmpty {
                throw ServiceError.emptyData
            }
            return mealCategoriesDetail
        } catch {
            throw ServiceError.decodingError(error)
        }
    }
}
