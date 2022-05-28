//
//  HomePresenter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
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

    }
}

extension HomePresenter: HomeInteractorOutputInterface {

}
