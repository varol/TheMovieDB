//
//  LoadingView.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

class LoadingView {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let shared = LoadingView()
    var containerView: UIView = UIView()

    private init() {
        configure()
    }

    func configure() {
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.frame = UIWindow(frame: UIScreen.main.bounds).frame
        activityIndicator.center = containerView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .darkGray
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .gray
        }
        activityIndicator.hidesWhenStopped = true
        containerView.addSubview(activityIndicator)
    }

    func startLoading() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        containerView.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
}
