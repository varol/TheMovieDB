//
//  UIView+Extensions.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

extension UIView {
    func animate() {
        transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 1.5) {
            self.transform = CGAffineTransform.identity
        }
    }
}
