//
//  ActionLargeTableViewCell.swift
//  project06-settings-final
//
//  Created by hamsternik on 04.03.2021.
//

import UIKit

final class ActionLargeTableViewCell: UITableViewCell {
    struct ViewModel {
        let avatarImageName: String
        let title: String
        let description: String
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        /// 'required' initializer 'init(coder:)' must be provided by subclass of 'UITableViewCell'
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.size.width / 2
    }

    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        avatarImageView.image = UIImage(named: viewModel.avatarImageName)
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }

    static let reusableIdentifier = "ActionLargeTableViewCell"

    // Private

    private var viewModel = ViewModel(avatarImageName: "", title: "", description: "")
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
}
