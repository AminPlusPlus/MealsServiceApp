import XCTest
@testable import MealsApp

class CategoryViewModelTests: XCTestCase {
    
    func testFetchCategoriesSuccess() async {
        let dummyService: MealsService = DummyMealsService()
        let viewModel = CategoryViewModel(service: dummyService)
        
        await viewModel.fetchCategories()
        
        switch viewModel.state {
        case .success(let mealsCategories):
            XCTAssertEqual(mealsCategories.categories.count, 5, "Expected 5 categories")
            XCTAssertEqual(mealsCategories.categories.first?.strCategory, "Italian", "First category should be 'Italian'")
        case .loading:
            XCTFail("The state should not be loading.")
        case .error(let errorMessage):
            XCTFail("Expected success, but got an error: \(errorMessage)")
        }
    }
    
    func testFetchCategoriesEmpty() async {
        let dummyService: MealsService = DummyEmptyService()
        let viewModel = CategoryViewModel(service: dummyService)
        
        await viewModel.fetchCategories()
        
        switch viewModel.state {
        case .success(_):
            XCTFail("Expected error, but got success.")
        case .loading:
            XCTFail("The state should not be loading.")
        case .error(let errorMessage):
            XCTAssertEqual(errorMessage, "The data received is empty.")
        }
    }
    
    func testFetchCategoriesInvalidURL() async {
        let dummyService: MealsService = DummyInvalidURLService()
        let viewModel = CategoryViewModel(service: dummyService)
        
        await viewModel.fetchCategories()
        
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
