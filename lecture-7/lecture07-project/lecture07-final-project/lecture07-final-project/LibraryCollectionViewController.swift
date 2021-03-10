//
//  LibraryCollectionViewController.swift
//  lecture07-final-project
//
//  Created by hamsternik on 09.03.2021.
//

import UIKit

class LibraryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Register collection view cells and header views for the collection view.
        registerAlbumCollectionViewCell()
        registerLibraryTypeCollectionViewCell()
        registerLibrarySupplementaryHeaderView()
        registerRecentlyAddedSupplementaryHeaderView()

        /// Initialize basic Flow Layout from the UIKit.
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

    // MARK: - Data Source & Delegate

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = dataSource[section]
        switch section {
        case .library(let viewModels):
            return viewModels.count
        case .recentlyAdded(let viewModels):
            return viewModels.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = dataSource[indexPath.section]
        let cell = viewModel(for: section, and: indexPath, collectionView: collectionView)
        return cell
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let section = dataSource[indexPath.section]
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch section {
            case .library:
                return collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: LibraryHeaderView.reusableIdentifier,
                    for: indexPath
                ) as? LibraryHeaderView ?? UICollectionReusableView()
            case .recentlyAdded:
                return collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: RecentlyAddedHeaderView.reusableIdentifier,
                    for: indexPath
                ) as? RecentlyAddedHeaderView ?? UICollectionReusableView()
            }
        default:
            preconditionFailure("Failed to return not a Header supplementary view")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    // MARK: UICollectionViewDelegateFlowLayout

    /// Forming size (width and height)
    /// for `LibraryHeaderView` and `RecentlyAddedHeaderView` header views.
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50.0)
    }

    /// Forming additional space for each side (inset)
    /// for `LibraryHeaderView` and `RecentlyAddedHeaderView` header views.
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let section = dataSource[indexPath.section]
        switch section {
        case .library:
            return CGSize(width: screenSize.width, height: 50)
        case .recentlyAdded:
            let screenWidth = screenSize.width
            let numberOfItemsPerRow: CGFloat = 2
            let spacingBetweenCells: CGFloat = 16
            let sideSpacing: CGFloat = 16
            let cellWidth = (screenWidth - (2 * sideSpacing) - ((numberOfItemsPerRow - 1) * spacingBetweenCells)) / numberOfItemsPerRow
            let heightAspecRatio: CGFloat = 1.21
            return CGSize(width: cellWidth, height: cellWidth * heightAspecRatio)
        }
    }

    // MARK: - ViewModel Management

    private func viewModel(
        for section: LibraryCollectionViewController.Section,
        and indexPath: IndexPath,
        collectionView: UICollectionView
    ) -> UICollectionViewCell {
        switch section {
        case .library(let viewModels):
            let viewModel = viewModels[indexPath.item]
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LibraryTypeCollectionViewCell.reusableIdentifier,
                for: indexPath
            ) as? LibraryTypeCollectionViewCell else {
                preconditionFailure("Failed to load collection view cell")
            }
            cell.update(with: viewModel)
            return cell
        case .recentlyAdded(let viewModels):
            let viewModel = viewModels[indexPath.item]
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AlbumCollectionViewCell.reusableIdentifier,
                for: indexPath
            ) as? AlbumCollectionViewCell else {
                preconditionFailure("Failed to load collection view cell")
            }
            cell.update(with: viewModel)
            return cell
        }
    }

    // MARK: - Cells Registration

    private func registerAlbumCollectionViewCell() {
        registerCell(by: AlbumCollectionViewCell.reusableIdentifier)
    }

    private func registerLibraryTypeCollectionViewCell() {
        registerCell(by: LibraryTypeCollectionViewCell.reusableIdentifier)
    }

    private func registerCell(by nibName: String) {
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }

    private func registerLibrarySupplementaryHeaderView() {
        registerSupplementaryView(
            kind: UICollectionView.elementKindSectionHeader,
            by: LibraryHeaderView.reusableIdentifier
        )
    }

    private func registerRecentlyAddedSupplementaryHeaderView() {
        registerSupplementaryView(
            kind: UICollectionView.elementKindSectionHeader,
            by: RecentlyAddedHeaderView.reusableIdentifier
        )
    }

    private func registerSupplementaryView(kind: String, by nibName: String) {
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        collectionView.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: nibName)
    }
}

// MARK: - Data Structure

extension LibraryCollectionViewController {
    enum Section {
        case library([LibraryTypeCollectionViewCell.ViewModel])
        case recentlyAdded([AlbumCollectionViewCell.ViewModel])
    }
}

// MARK: Data Instances

fileprivate let dataSource: [LibraryCollectionViewController.Section] = [
    .library([
        .init(iconName: "albums", title: "Albums"),
        .init(iconName: "artists", title: "Artists")
    ]),
    .recentlyAdded([
        .init(coverImageName: "nickleback-album", albumTitle: "How You Remind Me", artist: "Nickelback"),
        .init(coverImageName: "nelly-furtado-maneater", albumTitle: "Maneater (Radio Version)", artist: "Nelly Furtado"),
        .init(coverImageName: "nickleback-album", albumTitle: "How You Remind Me", artist: "Nickelback"),
        .init(coverImageName: "nickleback-album", albumTitle: "How You Remind Me", artist: "Nickelback"),
        .init(coverImageName: "nickleback-album", albumTitle: "How You Remind Me", artist: "Nickelback"),
        .init(coverImageName: "nickleback-album", albumTitle: "How You Remind Me", artist: "Nickelback"),
        .init(coverImageName: "nickleback-album", albumTitle: "How You Remind Me", artist: "Nickelback")
    ])
]
