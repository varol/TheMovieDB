//
//  BaseScreen.swift
//  TheMovieDBUITests
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation
import XCTest

class BaseScreen {
    var app: XCUIApplication!

    required init(with app: XCUIApplication = XCUIApplication()) {
        self.app = app
    }
}
