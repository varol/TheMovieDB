//
//  SplashPresenter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

extension SplashPresenter {
    fileprivate enum Constants {
        static let noInternetConnection: String = "No internet connection"
    }
}

protocol SplashPresenterInterface: AnyObject {
    func viewDidLoad()
    func animationCompleted()
    func setInternetConnectionStatus(with value: Bool)

    var isInternetOnline: Bool { get set }
}

final class SplashPresenter {
    var isInternetOnline = false

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
}

extension SplashPresenter: SplashPresenterInterface {
    func viewDidLoad() {
        interactor.checkInternetConnection()
        view.animateLogoView()
    }

    func animationCompleted() {
        if isInternetOnline {
            router.navigate(.home)
        } else {
            view.showAlert(title: .empty, message: Constants.noInternetConnection)
        }
    }

    func setInternetConnectionStatus(with value: Bool) {
        isInternetOnline = value
    }
}

extension SplashPresenter: SplashInteractorOutputInterface {
    func internetConnection(status: Bool) {
        setInternetConnectionStatus(with: status)
    }
}
