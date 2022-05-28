//
//  HomeInteractor.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation
import DistilledCoreAPI

protocol HomeInteractorInterface: AnyObject {
    func fetchMovies(page: String)
}

protocol HomeInteractorOutputInterface: AnyObject {
    func handleTopRatedMoviesResult(_ result: TopRatedMoviesResult)
}

typealias TopRatedMoviesResult = Result<TopRatedMoviesResponse, APIClientError>

final class HomeInteractor: HomeInteractorInterface {
    var output: HomeInteractorOutputInterface?
    private let networkManager: NetworkManager<MoviesEndpoint>

    init(networkManager: NetworkManager<MoviesEndpoint> = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchMovies(page: String) {
        networkManager.request(endpoint: .topRatedMovies(page),
                               type: TopRatedMoviesResponse.self) { [weak self] result in
            guard let self = self else { return }
            self.output?.handleTopRatedMoviesResult(result)
        }
    }

}

