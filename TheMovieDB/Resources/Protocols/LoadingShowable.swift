//
//  LoadingShowable.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        DispatchQueue.main.async {
            LoadingView.shared.startLoading()
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            LoadingView.shared.hideLoading()
        }
    }
}
