//
//  HomePresenter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

extension HomePresenter {
    fileprivate enum Constants {
        static let screenTitle: String = "🍿 Top Rated TV Shows"
        static let sortButtonTitle: String = "Sort ⇅"
        static let initialPageValue: Int = 1
    }
}

protocol HomePresenterInterface: AnyObject {
    var numberOfItems: Int { get }

    func viewDidLoad()
    func getTVShow(_ index: Int) -> TVShow?
    func scrollViewDidEndDecelerating()
    func sortTVShows()
    func toggleSortingFlag()
}

final class HomePresenter {

    private var shows: [TVShow] = []
    private var shouldFetchNextPage: Bool = true
    private var pageNumber: Int = Constants.initialPageValue
    private var isSortingAscending: Bool = true

    unowned private var view: HomeViewControllerInterface!
    private let router: HomeRouterInterface!
    private let interactor: HomeInteractorInterface!

    init(interactor: HomeInteractorInterface,
         router: HomeRouterInterface,
         view: HomeViewControllerInterface) {

        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterInterface {
    var numberOfItems: Int {
        shows.count
    }

    fileprivate func fetchTVShows() {
        view.showLoadingView()
        interactor.fetchTVShows(page: pageNumber)
    }

    func viewDidLoad() {
        view.prepareCollectionView()
        view.prepareNavigationBar(with: Constants.sortButtonTitle)
        view.setTitle(with: Constants.screenTitle)
        fetchTVShows()
    }

    func getTVShow(_ index: Int) -> TVShow? {
        shows[safe: index]
    }

    func scrollViewDidEndDecelerating() {
        guard shouldFetchNextPage else { return }
        fetchTVShows()
    }

    func sortTVShows() {
        if isSortingAscending {
            shows.sort { $0.name ?? .empty < $1.name ?? .empty }
        } else {
            shows.sort { $0.name ?? .empty > $1.name ?? .empty }
        }

        toggleSortingFlag()
        view.reloadData()
    }

    func toggleSortingFlag() {
        isSortingAscending.toggle()
    }
}

extension HomePresenter: HomeInteractorOutputInterface {
    func handleTopRatedTVShowsResult(_ result: TopRatedTVShowsResult) {
        switch result {
        case .success(let response):
            if let shows = response.results {
                self.shows.append(contentsOf: shows)
                pageNumber += 1
            } else {
                shouldFetchNextPage = false
            }

            view?.reloadData()
            view?.hideLoadingView()
        case .failure(let error):
            view.showAlert(title: error.title,
                           message: error.message)
            debugPrint(error.debugMessage)
        }
    }
}
