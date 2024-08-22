
# MealsServiceApp

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [API Overview](#api-overview)
- [Testing](#testing)

| Homepage | Categories    | Meal Details    |
| :---:   | :---: | :---: |
| ![simulator_screenshot_16BA007F-1EAC-4CC7-897A-6F8EA7CD5718](https://github.com/user-attachments/assets/85a8d7aa-6622-43a7-b495-7d41fc321df9) | ![simulator_screenshot_F9EDC508-35A9-422C-94D4-0B66C401BD1F](https://github.com/user-attachments/assets/4330fcf1-b871-4499-b513-3fc5b26bd5c6)   | ![simulator_screenshot_46892480-EA1D-4ADB-89D1-0CEA4AA562AD](https://github.com/user-attachments/assets/38dbbae4-3530-4277-a3f1-708cd9e2b9fc)   |

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
