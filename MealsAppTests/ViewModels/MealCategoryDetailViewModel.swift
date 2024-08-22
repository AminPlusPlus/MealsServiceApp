import XCTest
@testable import MealsApp

class MealCategoryDetailViewModelTests: XCTestCase {
        
    func testFetchMealCategoryDetailsSuccess() async {
          let dummyService: MealsService = DummyMealsService()
          let viewModel = MealCategoryDetailViewModel(service: dummyService)
          
          let category = "Dessert"
          
          await viewModel.fetchMealCategoryDetails(by: category)
          
          switch viewModel.state {
          case .success(let mealCategoriesDetail):
              XCTAssertEqual(mealCategoriesDetail.categoriesDetail.count, 2, "Expected 2 meals in the category")
              XCTAssertEqual(mealCategoriesDetail.categoriesDetail.first?.strMeal, "Apam balik", "First meal should be 'Apam balik'")
          case .loading:
              XCTFail("The state should not be loading.")
          case .error(let errorMessage):
              XCTFail("Expected success, but got an error: \(errorMessage)")
          }
      }
    
    func testFetchMealCategoryDetailsEmpty() async {
          let dummyService: MealsService = DummyEmptyService()
          let viewModel = MealCategoryDetailViewModel(service: dummyService)
          
          let category = "Dessert"
          
          await viewModel.fetchMealCategoryDetails(by: category)
          
          switch viewModel.state {
          case .success(let mealCategoriesDetail):
              XCTAssertEqual(mealCategoriesDetail.categoriesDetail.count, 2, "Expected 2 meals in the category")
              XCTAssertEqual(mealCategoriesDetail.categoriesDetail.first?.strMeal, "Apam balik", "First meal should be 'Apam balik'")
          case .loading:
              XCTFail("The state should not be loading.")
          case .error(let errorMessage):
              XCTAssertEqual(errorMessage, "The data received is empty.")
          }
      }
    
    func testFetchMealCategoryWhenInvalidURL() async {
          let dummyService: MealsService = DummyInvalidURLService()
          let viewModel = MealCategoryDetailViewModel(service: dummyService)
          
          let category = "Dessert"
          
          await viewModel.fetchMealCategoryDetails(by: category)
          
          switch viewModel.state {
          case .success(let mealCategoriesDetail):
              XCTAssertEqual(mealCategoriesDetail.categoriesDetail.count, 2, "Expected 2 meals in the category")
              XCTAssertEqual(mealCategoriesDetail.categoriesDetail.first?.strMeal, "Apam balik", "First meal should be 'Apam balik'")
          case .loading:
              XCTFail("The state should not be loading.")
          case .error(let errorMessage):
              XCTAssertEqual(errorMessage, "The URL string 'InvalidURL' is invalid.")
          }
      }
}
