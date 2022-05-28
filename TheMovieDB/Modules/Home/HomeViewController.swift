//
//  HomeViewController.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {

}

final class HomeViewController: BaseViewController {
    var presenter: HomePresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
        debugPrint("home")
    }
}

extension HomeViewController: HomeViewControllerInterface {

}