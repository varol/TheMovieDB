//
//  HomeViewController.swift
//  TheMovieDB
//
//  Created by Varol Aksoy on 28.05.2022.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func prepareCollectionView()
    func prepareNavigationBar(with buttonName: String)
    func setTitle(with title: String)
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func sortButtonTapped()
}

extension HomeViewController {
    fileprivate enum Constants {
        enum UI {
            static let fractionalWidth: CGFloat = 1
            static let estimatedHeight: CGFloat = 44
            static let groupCount: Int = 1
            static let textColor: UIColor = UIColor(named: "distilledTextColor") ?? .darkGray
        }
    }
}

final class HomeViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: HomePresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension HomeViewController: HomeViewControllerInterface {
    func prepareCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.delaysContentTouches = false
        collectionView.register(cellType: TVShowListCell.self)

        handleLayout()
    }

    func prepareNavigationBar(with buttonName: String) {
        if let navigationController = navigationController {
            navigationController.setTintColor(Constants.UI.textColor)
            navigationController.backgroundColor(.white)
        }

        let sortButton = UIBarButtonItem(title: buttonName,
                                         style: .plain,
                                         target: self,
                                         action: #selector(sortButtonTapped))
        navigationItem.rightBarButtonItems = [sortButton]
    }

    func setTitle(with title: String) {
        self.title = title
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func showLoadingView() {
        showLoading()
    }

    func hideLoadingView() {
        hideLoading()
    }

    func handleLayout() {
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(Constants.UI.fractionalWidth),
            heightDimension: NSCollectionLayoutDimension.estimated(Constants.UI.estimatedHeight)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size,
                                                       subitem: item,
                                                       count: Constants.UI.groupCount)

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout
    }

    @objc func sortButtonTapped() {
        presenter.sortTVShows()
    }
}

extension HomeViewController: UICollectionViewDelegate {}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        presenter.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeCell(cellType: TVShowListCell.self,
                                            indexPath: indexPath)

        if let showItem = presenter.getTVShow(indexPath.row) {
            cell.presenter = TVShowListCellPresenter(view: cell, showItem: showItem)
        }

        return cell
    }
}

extension HomeViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == collectionView,
            (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height else { return }
        presenter.scrollViewDidEndDecelerating()
    }
}
