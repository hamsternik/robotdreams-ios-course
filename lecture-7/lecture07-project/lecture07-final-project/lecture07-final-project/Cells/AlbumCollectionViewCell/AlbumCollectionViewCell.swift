//
//  AlbumCollectionViewCell.swift
//  lecture07-final-project
//
//  Created by hamsternik on 09.03.2021.
//

import UIKit

final class AlbumCollectionViewCell: UICollectionViewCell {
    struct ViewModel {
        let coverImageName: String
        let albumTitle: String
        let artist: String
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        /// 'required' initializer 'init(coder:)' must be provided by subclass of 'UITableViewCell'
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        coverImageView.layer.cornerRadius = 8
    }

    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        coverImageView.image = UIImage(named: viewModel.coverImageName)
        titleLabel.text = viewModel.albumTitle
        artistLabel.text = viewModel.artist
    }

    static let reusableIdentifier = "AlbumCollectionViewCell"

    // - Private

    private var viewModel = ViewModel(coverImageName: "", albumTitle: "", artist: "")

    @IBOutlet private var coverImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var artistLabel: UILabel!
}
