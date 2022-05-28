//
//  HomePresenter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

import Foundation

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
}

final class HomePresenter: HomePresenterInterface {

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

    func viewDidLoad() {
        interactor.fetchMovies(page: "1")
    }

    func viewWillAppear() {

    }
}

extension HomePresenter: HomeInteractorOutputInterface {
    func handleTopRatedMoviesResult(_ result: TopRatedMoviesResult) {
        switch result {
        case .success(let response):
            debugPrint(response)
        case .failure(let error):
            debugPrint(error.message)
        }
    }
}
