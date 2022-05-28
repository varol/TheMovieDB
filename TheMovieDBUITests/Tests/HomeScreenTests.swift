//
//  HomeScreenTests.swift
//  TheMovieDBUITests
//
//  Created by Varol Aksoy on 28.05.2022.
//
import XCTest

public final class HomeTest: BaseTest {

    func test_navigationBarTitleIsCorrect() {
        homeScreen
            .checkNavigationTitleIsCorrect(title: "🍿 Top Rated TV Shows")
    }

    func test_sortButtonTitleIsCorrect() {
        homeScreen
            .checkSortButtonText(text: "Sort ⇅")
    }
}
