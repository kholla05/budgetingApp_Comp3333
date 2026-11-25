import XCTest
import UIKit
@testable import budgetingApp_Comp3333

final class DashboardTests: XCTestCase {
    @MainActor
    private func makeDashboard() -> Dashboard {
        let dashboard = Dashboard()
        dashboard.loadViewIfNeeded()
        // Retain the weak outlets as subviews, without relying on storyboard layout.
        let labels = (0..<9).map { _ in UILabel() }
        labels.forEach { dashboard.view.addSubview($0) }
        dashboard.ltsLabel = labels[0]
        dashboard.spentLabel = labels[1]
        dashboard.budgetLabel = labels[2]
        dashboard.trackingLabel = labels[3]
        dashboard.foodLabel = labels[4]
        dashboard.booksLabel = labels[5]
        dashboard.funLabel = labels[6]
        dashboard.transportationLabel = labels[7]
        dashboard.otherLabel = labels[8]
        return dashboard
    }

    @MainActor
    func testReturningToDashboardRefreshesBudgetAndExpenses() {
        let previous = (budget, purchaseNames, purchaseAmounts, purchaseCategories)
        defer { (budget, purchaseNames, purchaseAmounts, purchaseCategories) = previous }
        budget = 0
        purchaseNames = []
        purchaseAmounts = []
        purchaseCategories = []
        let dashboard = makeDashboard()
        dashboard.viewWillAppear(false)

        budget = 900
        purchaseNames = ["Lunch"]
        purchaseAmounts = [40]
        purchaseCategories = ["Food"]
        dashboard.viewWillAppear(false)

        XCTAssertEqual(dashboard.budgetLabel.text, "Budget: $900.00")
        XCTAssertEqual(dashboard.spentLabel.text, "Spent: $40.00")
        XCTAssertEqual(dashboard.ltsLabel.text, "$860.00")
        XCTAssertEqual(dashboard.foodLabel.text, "Food: $40.00")
        XCTAssertEqual(dashboard.trackingLabel.text, "You're currently on track with your budget.")
    }

    @MainActor
    func testResetClearsBudgetExpensesAndAllDisplayedTotals() {
        let previous = (budget, purchaseNames, purchaseAmounts, purchaseCategories)
        defer { (budget, purchaseNames, purchaseAmounts, purchaseCategories) = previous }
        budget = 100
        purchaseNames = ["Lunch", "Textbook", "Movie", "Bus", "Supplies"]
        purchaseAmounts = [20, 40, 30, 10, 25]
        purchaseCategories = ["Food", "Books", "Fun", "Transportation", "Other"]
        let dashboard = makeDashboard()
        dashboard.viewWillAppear(false)
        XCTAssertEqual(dashboard.ltsLabel.textColor, UIColor.red)

        dashboard.resetBudget()

        XCTAssertEqual(budget, 0)
        XCTAssertTrue(purchaseNames.isEmpty)
        XCTAssertTrue(purchaseAmounts.isEmpty)
        XCTAssertTrue(purchaseCategories.isEmpty)
        XCTAssertEqual(dashboard.budgetLabel.text, "Budget: $0.00")
        XCTAssertEqual(dashboard.spentLabel.text, "Spent: $0.00")
        XCTAssertEqual(dashboard.ltsLabel.text, "$0.00")
        XCTAssertEqual(dashboard.foodLabel.text, "Food: $0.00")
        XCTAssertEqual(dashboard.booksLabel.text, "Books: $0.00")
        XCTAssertEqual(dashboard.funLabel.text, "Fun: $0.00")
        XCTAssertEqual(dashboard.transportationLabel.text, "Transportation: $0.00")
        XCTAssertEqual(dashboard.otherLabel.text, "Other: $0.00")
        XCTAssertEqual(dashboard.trackingLabel.text, "You're currently on track with your budget.")
        XCTAssertEqual(dashboard.ltsLabel.textColor, UIColor.white)
    }
}
