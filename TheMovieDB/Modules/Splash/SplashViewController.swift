//
//  SplashViewController.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

protocol SplashViewControllerInterface: AnyObject {
    func animateLogoView()
    func showAlert(title: String, message: String)
}

final class SplashViewController: BaseViewController {
    @IBOutlet private weak var logoImageView: UIImageView!

    var presenter: SplashPresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
}

extension SplashViewController: SplashViewControllerInterface {
    func animateLogoView() {
        logoImageView.animate(completion: { [weak self] in
            guard let self = self else { return }
            self.presenter.animationCompleted()
        })
    }

    func showAlert(title: String, message: String) {
        showErrorAlert(title: title, message: message)
    }
}

