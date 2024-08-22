import SwiftUI

class MealDetailViewModel: ObservableObject {
    
    @Published var state: ViewState<Meal> = .loading
    @Published var titleMeal: String = ""
    private let service: MealsService
    
    init(service: MealsService) {
        self.service = service
    }
    
    @MainActor
    public func fetchMeal(by id: String) async {
        state = .loading
        do {
            let meal = try await service.fetchMeal(by: id)
            guard let firstMeal = meal.meals.first  else {
                state = .error(errorMessage: "No data available.")
                return
            }
            state = .success(firstMeal)
            titleMeal = firstMeal.strMeal
        } catch let error as ServiceError {
            state = .error(errorMessage: error.localizedDescription)
        } catch {
            state = .error(errorMessage: "Unexpected error: \(error.localizedDescription)")
        }
    }
}
