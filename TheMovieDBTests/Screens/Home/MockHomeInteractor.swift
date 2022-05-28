//
//  MockHomeInteractor.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 28.05.2022.
//

@testable import TheMovieDB
import Foundation

final class MockHomeInteractor: HomeInteractorInterface {

    var invokedFetchTVShows = false
    var invokedFetchTVShowsCount = 0
    var invokedFetchTVShowsParameters: (page: Int, Void)?
    var invokedFetchTVShowsParametersList = [(page: Int, Void)]()

    func fetchTVShows(page: Int) {
        invokedFetchTVShows = true
        invokedFetchTVShowsCount += 1
        invokedFetchTVShowsParameters = (page, ())
        invokedFetchTVShowsParametersList.append((page, ()))
    }
}
