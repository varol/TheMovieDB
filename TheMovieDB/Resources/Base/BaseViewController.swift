//
//  BaseViewController.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

class BaseViewController: UIViewController, LoadingShowable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showErrorAlert(title: String, message: String, buttonName: String? = "OK") {
        let alert = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonName,
                                                style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
