//
//  UINavigationController+Extensions.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

internal extension UINavigationController {

    var rootViewController: UIViewController? {
        return viewControllers.first
    }

    ///Get previous view controller of the navigation stack
    var previousViewController: UIViewController? {

        let lenght = self.viewControllers.count

        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght - 2] : nil

        return previousViewController
    }

    func setRootViewController(_ viewController: UIViewController?, animated: Bool) {
        guard let viewController = viewController else { return }
        viewControllers.removeAll()
        safePushViewController(viewController, animated: animated)
    }

    func safePushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewController.isNavigated(by: self) { return }
        if self.viewControllers.isEmpty {
            setViewControllers([viewController], animated: false)
        } else {
            pushViewController(viewController, animated: animated)
        }
    }

    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let viewController = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(viewController, animated: animated)
        }
    }

    func setTintColor(_ color: UIColor) {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        navigationBar.tintColor = color
    }

    func backgroundColor(_ color: UIColor) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.barTintColor = color
        navigationBar.shadowImage = UIImage()
    }

}
