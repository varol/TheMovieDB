//
//  MockSplashRouter.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 29.05.2022.
//

@testable import TheMovieDB
import Foundation

final class MockSplashRouter: SplashRouterInterface {

    var invokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: SplashRoutes, Void)?
    var invokedNavigateParametersList = [(route: SplashRoutes, Void)]()

    func navigate(_ route: SplashRoutes) {
        invokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
        invokedNavigateParametersList.append((route, ()))
    }
}
