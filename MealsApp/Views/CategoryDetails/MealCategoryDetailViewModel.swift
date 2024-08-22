import SwiftUI

class MealCategoryDetailViewModel: ObservableObject {
    
    @Published var state: ViewState<MealCategoriesDetail> = .loading
    private let service: MealsService
    
    init(service: MealsService) {
        self.service = service
    }
    
    @MainActor
    public func fetchMealCategoryDetails(by category: String) async {
        state = .loading
        do {
            let mealCategoryDetail = try await service.fetchMealDetaiCategories(by: category)
            state = .success(mealCategoryDetail)
        } catch let error as ServiceError {
            state = .error(errorMessage: error.localizedDescription)
        } catch {
            state = .error(errorMessage: "Unexpected error: \(error.localizedDescription)")
        }
    }
}
