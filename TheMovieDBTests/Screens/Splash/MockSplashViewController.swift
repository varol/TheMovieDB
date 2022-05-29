//
//  MockSplashViewController.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 29.05.2022.
//

@testable import TheMovieDB
import UIKit

final class MockSplashViewController: SplashViewControllerInterface {

    var invokedAnimateLogoView = false
    var invokedAnimateLogoViewCount = 0

    func animateLogoView() {
        invokedAnimateLogoView = true
        invokedAnimateLogoViewCount += 1
    }

    var invokedShowAlert = false
    var invokedShowAlertCount = 0
    var invokedShowAlertParameters: (title: String, message: String)?
    var invokedShowAlertParametersList = [(title: String, message: String)]()

    func showAlert(title: String, message: String) {
        invokedShowAlert = true
        invokedShowAlertCount += 1
        invokedShowAlertParameters = (title, message)
        invokedShowAlertParametersList.append((title, message))
    }
}
