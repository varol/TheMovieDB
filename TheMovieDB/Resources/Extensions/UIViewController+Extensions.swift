//
//  UIViewController+Extensions.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

internal extension UIViewController {

    func isNavigated(by navigationController: UINavigationController) -> Bool {
        return (self.navigationController == navigationController ||
            navigationController.viewControllers.contains(self))
    }

}
