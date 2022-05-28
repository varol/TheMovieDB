//
//  HomeScreen.swift
//  TheMovieDBUITests
//
//  Created by Varol Aksoy on 28.05.2022.
//

import XCTest

final class HomeScreen: BaseScreen {

    lazy var navigationBars = app.navigationBars
    lazy var sortButton = app.buttons[AppAccessibilityIdenfier.sortButton.rawValue]

    func checkNavigationTitleIsCorrect(title: String) {
        XCTAssertTrue(navigationBars[title].waitForExistence(timeout: 1))
    }

    func checkSortButtonText(text: String) {
        XCTAssertEqual(text, sortButton.label)
    }

}
