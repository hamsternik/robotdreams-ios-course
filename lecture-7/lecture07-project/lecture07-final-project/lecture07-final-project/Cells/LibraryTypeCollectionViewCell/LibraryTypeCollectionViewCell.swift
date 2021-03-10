//
//  LibraryTypeCollectionViewCell.swift
//  lecture07-final-project
//
//  Created by hamsternik on 09.03.2021.
//

import UIKit

final class LibraryTypeCollectionViewCell: UICollectionViewCell {
    struct ViewModel {
        let iconName: String
        let title: String
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        /// 'required' initializer 'init(coder:)' must be provided by subclass of 'UITableViewCell'
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.tintColor = UIColor(red: 229/255, green: 65/255, blue: 68/255, alpha: 1)
    }

    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        iconImageView.image = UIImage(named: viewModel.iconName)
        titleLabel.text = viewModel.title
    }

    static let reusableIdentifier = "LibraryTypeCollectionViewCell"

    // Private

    private var viewModel = ViewModel(iconName: "", title: "")

    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var rightArrowImageView: UIImageView!
}
