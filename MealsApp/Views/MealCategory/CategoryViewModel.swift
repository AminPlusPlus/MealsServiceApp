import SwiftUI

class CategoryViewModel: ObservableObject {
    
    @Published var state: ViewState<MealsCategories> = .loading
    private let service: MealsService
    
    init(service: MealsService) {
        self.service = service
    }
    
    @MainActor
    public func fetchCategories() async {
        state = .loading
        do {
            let fetchedCategories = try await service.fetchMealCategories()
            state = .success(fetchedCategories)
        } catch let error as ServiceError {
            state = .error(errorMessage: error.localizedDescription)
        } catch {
            state = .error(errorMessage: "Unexpected error: \(error.localizedDescription)")
        }
    }
}
