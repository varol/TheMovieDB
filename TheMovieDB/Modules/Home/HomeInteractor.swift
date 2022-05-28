//
//  HomeInteractor.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation
import DistilledCoreAPI

protocol HomeInteractorInterface: AnyObject {
    func fetchTVShows(page: Int)
}

protocol HomeInteractorOutputInterface: AnyObject {
    func handleTopRatedTVShowsResult(_ result: TopRatedTVShowsResult)
}

typealias TopRatedTVShowsResult = Result<TopRatedTVShowsResponse, APIClientError>

final class HomeInteractor: HomeInteractorInterface {
    var output: HomeInteractorOutputInterface?
    private let networkManager: NetworkManager<MovieDBEndpoint>

    init(networkManager: NetworkManager<MovieDBEndpoint> = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchTVShows(page: Int) {
        networkManager.request(endpoint: .topRatedTVShows(page),
                               type: TopRatedTVShowsResponse.self) { [weak self] result in
            guard let self = self else { return }
            self.output?.handleTopRatedTVShowsResult(result)
        }
    }
}

