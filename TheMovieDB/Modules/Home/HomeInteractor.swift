//
//  HomeInteractor.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

protocol HomeInteractorInterface: AnyObject {

}

protocol HomeInteractorOutputInterface: AnyObject {

}

final class HomeInteractor {
    var output: HomeInteractorOutputInterface?
}

extension HomeInteractor: HomeInteractorInterface {

}
