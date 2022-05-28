//
//  MoviesEndpoint.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation
import DistilledCoreAPI

enum MoviesEndpoint: Endpoint {
    case topRatedMovies(_ page: String)

    var baseUrl: String { "https://api.themoviedb.org/" }

    var path: String {
        switch self {
        case .topRatedMovies:
            return "3/tv/top_rated"
        }
    }

    var parameters: [String : Any] {
        switch self {
        case .topRatedMovies(let page):
            return [
                    "api_key" : "25a8f80ba018b52efb64f05140f6b43c",
                    "language" : "en-US",
                    "page": page
            ]
        }
    }

    var method: HTTPMethod {
        switch self {
        case .topRatedMovies:
            return .get
        }
    }

    var headers: [String : String] {
        [:]
    }
}
