//
//  HTTPMethod.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Alamofire

public typealias HTTPMethod = Alamofire.HTTPMethod

public extension Endpoint {
    var encoding: ParameterEncoding {
        switch method {
        case .get: return URLEncoding.default
        default: return JSONEncoding.default
        }
    }
}
