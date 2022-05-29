//
//  MockSplashInteractor.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 29.05.2022.
//

@testable import TheMovieDB
import Foundation

final class MockSplashInteractor: SplashInteractorInterface {

    var invokedCheckInternetConnection = false
    var invokedCheckInternetConnectionCount = 0

    func checkInternetConnection() {
        invokedCheckInternetConnection = true
        invokedCheckInternetConnectionCount += 1
    }
}
