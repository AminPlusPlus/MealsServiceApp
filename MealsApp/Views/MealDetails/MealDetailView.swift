import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel: MealDetailViewModel
        
    init(mealID: String, service: MealsService = MealsServiceImpl()) {
        self.mealID = mealID
        _viewModel = StateObject(wrappedValue: MealDetailViewModel(service: service))
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView("Loading...")
            case .success(let meal):
                mealDetailsView(meal: meal)
            case .error(let errorMessage):
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            }
            
        }
        .task {
            await viewModel.fetchMeal(by: mealID)
        }
        .navigationTitle(viewModel.titleMeal)
        .lineLimit(2)
    }
    
    @ViewBuilder
    func mealDetailsView(meal: Meal) -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                .cornerRadius(10)
                
                Text("Instructions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text(meal.strInstructions)
                    .padding(.top)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
                Text("Ingredients & Measurements")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                ForEach(Array(zip(meal.ingredients, meal.measures)), id: \.0) { ingredient, measure in
                    HStack {
                        Text(ingredient)
                            .fontWeight(.medium)
                        Spacer()
                        Text(measure)
                            .fontWeight(.light)
                    }
                    .padding(.vertical, 2)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MealDetailView(mealID: "52767", service: DummyMealsService())
}
