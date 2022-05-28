//
//  SplashInteractor.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

protocol SplashInteractorInterface: AnyObject {}

protocol SplashInteractorOutputInterface: AnyObject {}

final class SplashInteractor {
    var output: SplashInteractorOutputInterface?
}

extension SplashInteractor: SplashInteractorInterface {}
