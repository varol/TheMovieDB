//
//  MockTVShowListCell.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 28.05.2022.
//

@testable import TheMovieDB
import Foundation

final class MockTVShowListCell: TVShowListCellInterface {

    var invokedSetTVShowImageView = false
    var invokedSetTVShowImageViewCount = 0
    var invokedSetTVShowImageViewParameters: (imageUrl: String, placeholderImage: String)?
    var invokedSetTVShowImageViewParametersList = [(imageUrl: String, placeholderImage: String)]()

    func setTVShowImageView(_ imageUrl: String, placeholderImage: String) {
        invokedSetTVShowImageView = true
        invokedSetTVShowImageViewCount += 1
        invokedSetTVShowImageViewParameters = (imageUrl, placeholderImage)
        invokedSetTVShowImageViewParametersList.append((imageUrl, placeholderImage))
    }

    var invokedSetTVShowTitle = false
    var invokedSetTVShowTitleCount = 0
    var invokedSetTVShowTitleParameters: (text: String, Void)?
    var invokedSetTVShowTitleParametersList = [(text: String, Void)]()

    func setTVShowTitle(_ text: String) {
        invokedSetTVShowTitle = true
        invokedSetTVShowTitleCount += 1
        invokedSetTVShowTitleParameters = (text, ())
        invokedSetTVShowTitleParametersList.append((text, ()))
    }

    var invokedSetTVShowDescription = false
    var invokedSetTVShowDescriptionCount = 0
    var invokedSetTVShowDescriptionParameters: (text: String, Void)?
    var invokedSetTVShowDescriptionParametersList = [(text: String, Void)]()

    func setTVShowDescription(_ text: String) {
        invokedSetTVShowDescription = true
        invokedSetTVShowDescriptionCount += 1
        invokedSetTVShowDescriptionParameters = (text, ())
        invokedSetTVShowDescriptionParametersList.append((text, ()))
    }
}
