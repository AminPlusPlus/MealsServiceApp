import XCTest
@testable import MealsApp

class MealDetailViewModelTests: XCTestCase {
    
    func testFetchMealSuccess() async {
        let dummyService: MealsService = DummyMealsService()
        let viewModel = MealDetailViewModel(service: dummyService)
        
        let mealID = "52891"
        
        await viewModel.fetchMeal(by: mealID)
        
        switch viewModel.state {
        case .success(let meal):
            XCTAssertEqual(meal.strMeal, "Blackberry Fool", "Expected meal to be 'Blackberry Fool'")
            XCTAssertEqual(viewModel.titleMeal, "Blackberry Fool", "Title should be set to 'Blackberry Fool'")
        case .loading:
            XCTFail("The state should not be loading.")
        case .error(let errorMessage):
            XCTFail("Expected success, but got an error: \(errorMessage)")
        }
    }
    
    func testFetchMealEmptyData() async {
        let dummyService: MealsService = DummyEmptyService()
        let viewModel = MealDetailViewModel(service: dummyService)
        
        let mealID = "InvalidID"
        
        await viewModel.fetchMeal(by: mealID)
        
        switch viewModel.state {
        case .success(_):
            XCTFail("Expected error, but got success.")
        case .loading:
            XCTFail("The state should not be loading.")
        case .error(let errorMessage):
            XCTAssertEqual(errorMessage, "The data received is empty.")
        }
    }
    
    func testFetchMealInvalidURL() async {
        let dummyService: MealsService = DummyInvalidURLService()
        let viewModel = MealDetailViewModel(service: dummyService)
        
        let mealID = "InvalidID"
        
        await viewModel.fetchMeal(by: mealID)
        
        switch viewModel.state {
        case .success(_):
            XCTFail("Expected error, but got success.")
        case .loading:
            XCTFail("The state should not be loading.")
        case .error(let errorMessage):
            XCTAssertEqual(errorMessage, "The URL string 'InvalidURL' is invalid.")
        }
    }
}

