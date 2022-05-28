//
//  MockHomeViewController.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 28.05.2022.
//

@testable import TheMovieDB
import UIKit

final class MockHomeViewController: HomeViewControllerInterface {

    var invokedPrepareCollectionView = false
    var invokedPrepareCollectionViewCount = 0

    func prepareCollectionView() {
        invokedPrepareCollectionView = true
        invokedPrepareCollectionViewCount += 1
    }

    var invokedPrepareNavigationBar = false
    var invokedPrepareNavigationBarCount = 0
    var invokedPrepareNavigationBarParameters: (buttonName: String, Void)?
    var invokedPrepareNavigationBarParametersList = [(buttonName: String, Void)]()

    func prepareNavigationBar(with buttonName: String) {
        invokedPrepareNavigationBar = true
        invokedPrepareNavigationBarCount += 1
        invokedPrepareNavigationBarParameters = (buttonName, ())
        invokedPrepareNavigationBarParametersList.append((buttonName, ()))
    }

    var invokedSetTitle = false
    var invokedSetTitleCount = 0
    var invokedSetTitleParameters: (title: String, Void)?
    var invokedSetTitleParametersList = [(title: String, Void)]()

    func setTitle(with title: String) {
        invokedSetTitle = true
        invokedSetTitleCount += 1
        invokedSetTitleParameters = (title, ())
        invokedSetTitleParametersList.append((title, ()))
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedShowLoadingView = false
    var invokedShowLoadingViewCount = 0

    func showLoadingView() {
        invokedShowLoadingView = true
        invokedShowLoadingViewCount += 1
    }

    var invokedHideLoadingView = false
    var invokedHideLoadingViewCount = 0

    func hideLoadingView() {
        invokedHideLoadingView = true
        invokedHideLoadingViewCount += 1
    }

    var invokedSortButtonTapped = false
    var invokedSortButtonTappedCount = 0

    func sortButtonTapped() {
        invokedSortButtonTapped = true
        invokedSortButtonTappedCount += 1
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
