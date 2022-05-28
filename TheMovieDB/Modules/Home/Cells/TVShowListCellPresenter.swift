//
//  MovieListPresenter.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import Foundation

protocol TVShowListCellPresenterInterface {
    func load()

    var showItem: TVShow? { get set }
}

extension TVShowListCellPresenter {
    fileprivate enum Constants {
        static let placeholderImage: String = "no-image-available"
        static let defaultPosterImagePath: String = "https://image.tmdb.org/t/p/w500"
    }
}

final class TVShowListCellPresenter {
    weak var view: TVShowListCellInterface?
    var showItem: TVShow?

    init(view: TVShowListCellInterface?,
         showItem: TVShow?) {
        self.view = view
        self.showItem = showItem
    }
}

extension TVShowListCellPresenter : TVShowListCellPresenterInterface {
    func load() {
        if let posterPath = showItem?.posterPath {
            view?.setTVShowImageView(Constants.defaultPosterImagePath + posterPath,
                                     placeholderImage: Constants.placeholderImage)
        }

        if let title = showItem?.name {
            view?.setTVShowTitle(title)
        }

        if let description = showItem?.overview {
            view?.setTVShowDescription(description)
        }
    }
}
