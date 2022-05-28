//
//  TVShowListCellPresenterTests.swift
//  TheMovieDBTests
//
//  Created by Varol Aksoy on 28.05.2022.
//

@testable import TheMovieDB
import XCTest

final class TVShowListCellPresenterTests: XCTestCase {
    var view: MockTVShowListCell!
    var tvShow: TVShow!
    var presenter: TVShowListCellPresenter!

    override func setUp() {
        super.setUp()
        view = .init()
        tvShow = TopRatedTVShowsResponse.response.results?.first
        presenter = .init(view: view, showItem: tvShow)
    }

    func test_setPosterImage() {
        XCTAssertFalse(view.invokedSetTVShowImageView)
        XCTAssertEqual(view.invokedSetTVShowImageViewCount, .zero)
        XCTAssertEqual(view.invokedSetTVShowImageViewParameters?.imageUrl, nil)
        presenter.load()
        XCTAssertTrue(view.invokedSetTVShowImageView)
        XCTAssertEqual(view.invokedSetTVShowImageViewCount, 1)
        XCTAssertEqual(view.invokedSetTVShowImageViewParameters?.imageUrl, "https://image.tmdb.org/t/p/w500" + (TopRatedTVShowsResponse.response.results?.first?.posterPath)!)
    }

    func test_setTvShowTitle() {
        XCTAssertFalse(view.invokedSetTVShowTitle)
        XCTAssertEqual(view.invokedSetTVShowTitleCount, .zero)
        XCTAssertEqual(view.invokedSetTVShowTitleParameters?.text, nil)
        presenter.load()
        XCTAssertTrue(view.invokedSetTVShowTitle)
        XCTAssertEqual(view.invokedSetTVShowTitleCount, 1)
        XCTAssertEqual(view.invokedSetTVShowTitleParameters?.text, TopRatedTVShowsResponse.response.results?.first?.name)
    }

    func test_setTvShowDescription() {
        XCTAssertFalse(view.invokedSetTVShowDescription)
        XCTAssertEqual(view.invokedSetTVShowDescriptionCount, .zero)
        XCTAssertEqual(view.invokedSetTVShowDescriptionParameters?.text, nil)
        presenter.load()
        XCTAssertTrue(view.invokedSetTVShowDescription)
        XCTAssertEqual(view.invokedSetTVShowDescriptionCount, 1)
        XCTAssertEqual(view.invokedSetTVShowDescriptionParameters?.text, TopRatedTVShowsResponse.response.results?.first?.overview)
    }

}
