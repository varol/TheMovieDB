//
//  BaseTests.swift
//  TheMovieDBUITests
//
//  Created by Varol Aksoy on 28.05.2022.
//

import XCTest

public class BaseTest: XCTestCase {

    var app: XCUIApplication!
    var baseScreen: BaseScreen!

    lazy var homeScreen: HomeScreen = {
        return HomeScreen(with: app)
    }()

    public override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        baseScreen = BaseScreen(with: app)

        app.setUpAndLaunch()
    }

    public override func tearDownWithError() throws {

    }
}

extension XCUIApplication {
    func setUpAndLaunch() {
        launchEnvironment = ["DISABLE_ANIMATIONS": "1"]
        launchArguments += ["UI-Testing"]
        launch()
    }
}
