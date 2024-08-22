
# MealsServiceApp

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [API Overview](#api-overview)
- [Testing](#testing)

## Introduction

MealsServiceApp is an iOS application designed to provide users with a wide range of meal recipes and categories. It leverages the power of Swift and integrates with a meal API to fetch detailed information about meals, including ingredients, instructions, and more. The application also supports viewing meal categories and filtering meals based on these categories.

## Features

- **Browse Meal Categories:** View and explore various meal categories.
- **Meal Details:** Get detailed information about meals, including ingredients, measurements, and cooking instructions.
- **Async Data Fetching:** Fetch data asynchronously using Swift's async/await feature.
- **Error Handling:** Robust error handling to manage network and data errors.
- **MVVM Architecture:** The app follows the MVVM (Model-View-ViewModel) architecture for better separation of concerns and testability.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/AminPlusPlus/MealsServiceApp.git
   cd MealsServiceApp
   ```

2. **Open in Xcode:**

   Open the `MealsServiceApp.xcodeproj` file in Xcode.

3. **Run the App:**

   Build and run the app on a simulator or a physical device.

## Usage

- **Browse Meals:** Open the app and explore different meal categories.
- **View Meal Details:** Tap on any meal to view detailed information about the recipe, ingredients, and instructions.
- **Error Handling:** The app provides user-friendly error messages in case of network issues or invalid data.

## API Overview

- **fetchMeal(by id: String) -> MealResponse:** Fetches the details of a meal by its ID.
- **fetchMealCategories() -> MealsCategories:** Fetches all available meal categories.
- **fetchMealDetaiCategories(by category: String) -> MealCategoriesDetail:** Fetches meals filtered by category.

## Testing

### Unit Tests

The project includes unit tests for the following components:

- **ViewModels:** Tests to verify the logic in various ViewModels (e.g., `MealDetailViewModel`, `CategoryViewModel`).
- **Services:** Tests to verify the network requests and data parsing in the `MealsServiceImpl`.

To run the tests:

1. Open the project in Xcode.
2. Select `Product > Test` from the menu, or use the shortcut `Cmd + U`.

### Mocking and Test Coverage

The project uses mock services and dependency injection to ensure that the tests are isolated from real network calls. This improves reliability and speed of the tests.
