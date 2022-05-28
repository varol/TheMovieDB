//
//  BaseLabel.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

class BaseLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureFont()
    }

    func configureFont() {
        self.textColor = .darkGray
    }
}
