//
//  SplashInteractor.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation
import DistilledCoreAPI

protocol SplashInteractorInterface: AnyObject {
    func checkInternetConnection()
}

protocol SplashInteractorOutputInterface: AnyObject {
    func internetConnection(status: Bool)
}

final class SplashInteractor {
    var output: SplashInteractorOutputInterface?

    private let networkManager: NetworkManager<MovieDBEndpoint>

    init(networkManager: NetworkManager<MovieDBEndpoint> = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension SplashInteractor: SplashInteractorInterface {
    func checkInternetConnection() {
        output?.internetConnection(status: networkManager.isConnectedToInternet())
    }
}
