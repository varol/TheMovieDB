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

    var isPresentedViewController: Bool {
        if self.presentingViewController?.presentedViewController == self {
            return true
        }
        if self.navigationController != nil &&
            self.navigationController?.presentingViewController?.presentedViewController == self.navigationController &&
            self.navigationController?.viewControllers.first == self {
            return true
        }
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }

}
