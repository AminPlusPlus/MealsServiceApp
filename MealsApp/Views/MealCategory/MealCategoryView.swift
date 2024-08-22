import SwiftUI

struct MealCategoriesView: View {
    
    @StateObject private var viewModel: CategoryViewModel
    
    init(service: MealsService) {
        _viewModel = StateObject(wrappedValue: CategoryViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .loading:
                    ProgressView("Loading...")
                case .success(let list):
                    mealCategoryListView(category: list.categories)
                case .error(let errorMessage):
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Meal Categories")
            .task {
                await viewModel.fetchCategories()
            }
        }
    }
    
    @ViewBuilder
    func mealCategoryListView(category: [MealsCategories.MealCategory]) -> some View {
        List(category, id: \.strCategory) { category in
            NavigationLink(destination: MealCategoryDetailView(categoryName: category.strCategory)) {
                Text(category.strCategory)
            }
        }
    }
}

#Preview {
    MealCategoriesView(service: DummyMealsService())
}

