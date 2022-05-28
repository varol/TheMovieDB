//
//  SplashPresenter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

protocol SplashPresenterInterface: AnyObject {
    func viewDidLoad()
}

final class SplashPresenter: SplashPresenterInterface {

    unowned private var view: SplashViewControllerInterface!
    private let router: SplashRouterInterface!
    private let interactor: SplashInteractorInterface!

    init(interactor: SplashInteractorInterface,
         router: SplashRouterInterface,
         view: SplashViewControllerInterface) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {

    }
}

extension SplashPresenter: SplashInteractorOutputInterface {

}
