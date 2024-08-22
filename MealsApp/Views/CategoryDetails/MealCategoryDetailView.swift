import SwiftUI

struct MealCategoryDetailView: View {
    let categoryName: String
    
    @StateObject private var viewModel: MealCategoryDetailViewModel
    
    init(categoryName: String, service: MealsService = MealsServiceImpl()) {
        self.categoryName = categoryName
        _viewModel = StateObject(wrappedValue: MealCategoryDetailViewModel(service: service))
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView("Loading...")
            case .success(let mealCategoriesDetail):
                categoryListView(listCategory: mealCategoriesDetail.categoriesDetail)
            case .error(let errorMessage):
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            }
        }
        .task {
            await viewModel.fetchMealCategoryDetails(by: categoryName)
        }
        .navigationTitle(categoryName)
    }
    
    @ViewBuilder
    func categoryListView(listCategory: [MealCategoriesDetail.MealDetail]) -> some View {
        List(listCategory) { category in
            NavigationLink(destination: MealDetailView(mealID: category.id)) {
                LazyVStack(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: category.strMealThumb)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Text(category.strMeal)
                    }
                }
            }
        }
    }
}

#Preview {
    MealCategoryDetailView(categoryName: "dessert",
                           service: DummyMealsService())
}
