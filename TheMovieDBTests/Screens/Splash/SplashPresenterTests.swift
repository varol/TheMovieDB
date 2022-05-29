//
//  SplashPresenterTests.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 29.05.2022.
//

import XCTest
import DistilledCoreAPI
@testable import TheMovieDB

class SplashPresenterTests: XCTestCase {

    var presenter: SplashPresenter!
    var view: MockSplashViewController!
    var interactor: MockSplashInteractor!
    var router: MockSplashRouter!

    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(interactor: interactor,
                          router: router,
                          view: view)
    }

    func test_IsAnimationStarted() {
        XCTAssertFalse(view.invokedAnimateLogoView)
        XCTAssertEqual(view.invokedAnimateLogoViewCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedAnimateLogoView)
        XCTAssertEqual(view.invokedAnimateLogoViewCount, 1)
    }

    func test_NavigateToHomeWithInternetConnection() {
        XCTAssertFalse(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, .zero)
        XCTAssertEqual(router.invokedNavigateParameters?.route, nil)
        presenter.setInternetConnectionStatus(with: true)
        presenter.animationCompleted()
        XCTAssertTrue(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, 1)
        XCTAssertEqual(router.invokedNavigateParameters?.route, .home)
    }

    func test_NavigateToHomeWithBrokenInternetConnection() {
        XCTAssertFalse(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, .zero)
        XCTAssertEqual(router.invokedNavigateParameters?.route, nil)
        presenter.setInternetConnectionStatus(with: false)
        presenter.animationCompleted()
        XCTAssertFalse(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, .zero)
        XCTAssertEqual(router.invokedNavigateParameters?.route, nil)
    }

    func test_AlertWithBrokenInternetConnection() {
        XCTAssertFalse(view.invokedShowAlert)
        XCTAssertEqual(view.invokedShowAlertCount, .zero)
        XCTAssertEqual(view.invokedShowAlertParameters?.message, nil)
        presenter.setInternetConnectionStatus(with: false)
        presenter.animationCompleted()
        XCTAssertTrue(view.invokedShowAlert)
        XCTAssertEqual(view.invokedShowAlertCount, 1)
        XCTAssertEqual(view.invokedShowAlertParameters?.message, "No internet connection")
    }
}
