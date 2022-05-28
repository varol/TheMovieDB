//
//  SplashPresenter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

extension SplashPresenter {
    fileprivate enum Constants {
        static let delayTime: Double = 1.5
    }
}

protocol SplashPresenterInterface: AnyObject {
    func viewDidLoad()
    func navigateToHome()
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
        view.animateLogoView()
        navigateToHome()
    }

    func navigateToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayTime) {
            self.router.navigate(.home)
        }
    }
}

extension SplashPresenter: SplashInteractorOutputInterface {

}
