import Foundation

public enum ServiceError: Error {
    case invalidURL(String)
    case emptyData
    case invalidResponse(Error)
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL(let urlString):
             "The URL string '\(urlString)' is invalid."
        case .emptyData:
             "The data received is empty."
        case .decodingError(let error):
             "Failed to decode data: \(error.localizedDescription)"
        case .invalidResponse(let error):
            "Invalid Response : \(error.localizedDescription)"
        }
    }
}

public enum MealsEndpoints {
    private static let baseUrl = "https://www.themealdb.com/api/json/v1/1"
    
    case lookupMeal(id: String)
    case filterByCategory(category: String)
    case mealCategoryList
    
    var urlString: String {
        switch self {
        case .lookupMeal(let id):
            return "\(MealsEndpoints.baseUrl)/lookup.php?i=\(id)"
        case .filterByCategory(let category):
            return "\(MealsEndpoints.baseUrl)/filter.php?c=\(category)"
        case .mealCategoryList:
            return "\(MealsEndpoints.baseUrl)/list.php?c=list"
        }
    }
}
