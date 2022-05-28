//
//  HomeRouter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

protocol HomeRouterInterface: AnyObject {
    func navigate(_ route: HomeRoutes)
}

enum HomeRoutes {

}

final class HomeRouter: NSObject {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    static func setupModule(navigationController: UINavigationController) -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(navigationController: navigationController)
        let presenter = HomePresenter(interactor: interactor, router: router, view: view)
        view.presenter = presenter
        return view
    }
}

extension HomeRouter: HomeRouterInterface {
    func navigate(_ route: HomeRoutes) {

    }
}
