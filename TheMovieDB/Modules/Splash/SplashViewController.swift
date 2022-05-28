//
//  SplashViewController.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

protocol SplashViewControllerInterface: AnyObject {
    func animateLogoView()
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
        logoImageView.animate()
    }
}

