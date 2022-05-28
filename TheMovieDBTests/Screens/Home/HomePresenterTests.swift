//
//  HomePresenterTests.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 28.05.2022.
//

import XCTest
import DistilledCoreAPI
@testable import TheMovieDB

class HomePresenterTests: XCTestCase {

    var presenter: HomePresenter!
    var view: MockHomeViewController!
    var interactor: MockHomeInteractor!
    var router: MockHomeRouter!

    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(interactor: interactor,
                          router: router,
                          view: view)
    }

    func test_viewDidLoad_InvokesRequiredViewMethods() {
        XCTAssertFalse(view.invokedPrepareCollectionView)
        XCTAssertEqual(view.invokedPrepareCollectionViewCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedPrepareCollectionView)
        XCTAssertEqual(view.invokedPrepareCollectionViewCount, 1)
    }

    func test_showLoading() {
        XCTAssertFalse(view.invokedShowLoadingView)
        XCTAssertEqual(view.invokedShowLoadingViewCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedShowLoadingView)
        XCTAssertEqual(view.invokedShowLoadingViewCount, 1)
    }

    func test_hideLoadingWithSuccessResponse() {
        XCTAssertFalse(view.invokedHideLoadingView)
        XCTAssertEqual(view.invokedHideLoadingViewCount, .zero)
        presenter.viewDidLoad()
        presenter.handleTopRatedTVShowsResult(.success(.response))
        XCTAssertTrue(view.invokedHideLoadingView)
        XCTAssertEqual(view.invokedHideLoadingViewCount, 1)
    }

    func test_hideLoadingWithNetworkError() {
        XCTAssertFalse(view.invokedHideLoadingView)
        XCTAssertEqual(view.invokedHideLoadingViewCount, .zero)
        presenter.viewDidLoad()
        presenter.handleTopRatedTVShowsResult(.failure(.networkError))
        XCTAssertFalse(view.invokedHideLoadingView)
        XCTAssertEqual(view.invokedHideLoadingViewCount, .zero)
    }

    func test_getNumberOfItems() {
        XCTAssertEqual(presenter.numberOfItems, .zero)
        presenter.handleTopRatedTVShowsResult(.success(.response))
        XCTAssertEqual(presenter.numberOfItems, 20)
    }

    func test_getTVShowItem() {
        XCTAssertEqual(presenter.getTVShow(.zero), nil)
        presenter.handleTopRatedTVShowsResult(.success(.response))
        XCTAssertEqual(presenter.getTVShow(.zero), TopRatedTVShowsResponse.response.results?.first)
    }

    func test_getTVShowItemWithOutIfIndex() {
        XCTAssertEqual(presenter.getTVShow(-1), nil)
        presenter.handleTopRatedTVShowsResult(.success(.response))
        XCTAssertEqual(presenter.getTVShow(-1), nil)
    }

    func test_SortTVShowAtoZ() {
        XCTAssertEqual(presenter.getTVShow(.zero), nil)
        presenter.handleTopRatedTVShowsResult(.success(.response))
        presenter.sortTVShows()
        XCTAssertEqual(presenter.getTVShow(.zero), TopRatedTVShowsResponse.response.results![2])
    }

    func test_SortTVShowZtoA() {
        XCTAssertEqual(presenter.getTVShow(.zero), nil)
        presenter.handleTopRatedTVShowsResult(.success(.response))
        presenter.toggleSortingFlag()
        presenter.sortTVShows()
        XCTAssertEqual(presenter.getTVShow(.zero), TopRatedTVShowsResponse.response.results![13])
    }

    func test_SetTitle() {
        XCTAssertEqual(view.invokedSetTitleParameters?.title, nil)
        presenter.viewDidLoad()
        XCTAssertEqual(view.invokedSetTitleParameters?.title, "🍿 Top Rated TV Shows")
    }

    func test_prepareNavigationBar() {
        XCTAssertEqual(view.invokedPrepareNavigationBar, false)
        XCTAssertEqual(view.invokedPrepareNavigationBarParameters?.buttonName, nil)
        presenter.viewDidLoad()
        XCTAssertEqual(view.invokedPrepareNavigationBar, true)
        XCTAssertEqual(view.invokedPrepareNavigationBarParameters?.buttonName, "Sort ⇅")
    }

    func test_alertWithFailure() {
        XCTAssertEqual(view.invokedShowAlert, false)
        XCTAssertEqual(view.invokedShowAlertCount, .zero)
        XCTAssertEqual(view.invokedShowAlertParameters?.title, nil)
        XCTAssertEqual(view.invokedShowAlertParameters?.message, nil)
        presenter.viewDidLoad()
        presenter.handleTopRatedTVShowsResult(.failure(.networkError))
        XCTAssertEqual(view.invokedShowAlert, true)
        XCTAssertEqual(view.invokedShowAlertCount, 1)
        XCTAssertEqual(view.invokedShowAlertParameters?.title, APIClientError.networkError.title)
        XCTAssertEqual(view.invokedShowAlertParameters?.message, APIClientError.networkError.message)
    }
}

// MARK: - Extensions

extension TopRatedTVShowsResponse {
    static var response: TopRatedTVShowsResponse {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "TopRatedTVShows", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let homeResponse = try! JSONDecoder().decode(TopRatedTVShowsResponse.self, from: data)
        return homeResponse
    }

    static var emptyResponse: TopRatedTVShowsResponse? {
        nil
    }
}
