//
//  MovieListCell.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit
import Kingfisher

protocol TVShowListCellInterface: AnyObject {
    func setTVShowImageView(_ imageUrl: String, placeholderImage: String)
    func setTVShowTitle(_ text: String)
    func setTVShowDescription(_ text: String)
}

final class TVShowListCell: BaseCollectionViewCell {
    @IBOutlet private weak var posterImageView: BaseImageView!
    @IBOutlet private weak var showTitleLabel: BaseLabel!
    @IBOutlet private weak var showDescriptionLabel: BaseLabel!
    
    var presenter: TVShowListCellPresenterInterface! {
        didSet {
            presenter.load()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension TVShowListCell: TVShowListCellInterface {
    func setTVShowImageView(_ imageUrl: String, placeholderImage: String) {

        let url = URL(string: imageUrl)
        let placeholder = UIImage(named: placeholderImage)
        posterImageView.kf.indicatorType = .activity
        posterImageView.kf.setImage(with: url,
                                  placeholder: placeholder,
                                  options: [.transition(.fade(0.3))])
    }

    func setTVShowTitle(_ text: String) {
        showTitleLabel.text = text
    }

    func setTVShowDescription(_ text: String) {
        showDescriptionLabel.text = text
    }
}
