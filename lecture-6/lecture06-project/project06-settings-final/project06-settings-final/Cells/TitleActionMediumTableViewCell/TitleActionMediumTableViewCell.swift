//
//  TitleActionMediumTableViewCell.swift
//  project06-settings-final
//
//  Created by hamsternik on 04.03.2021.
//

import UIKit

final class TitleActionMediumTableViewCell: UITableViewCell {
    struct ViewModel {
        let iconName: String
        let title: String
        let actionStatus: String
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        /// 'required' initializer 'init(coder:)' must be provided by subclass of 'UITableViewCell'
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        leftIconImageView.image = UIImage(named: viewModel.iconName)
        titleLabel.text = viewModel.title
        rightActionStatus.text = viewModel.actionStatus
    }

    static let reusableIdentifier = "TitleActionMediumTableViewCell"

    // Private

    private var viewModel = ViewModel(iconName: "", title: "", actionStatus: "")
    @IBOutlet private var leftIconImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var rightActionStatus: UILabel!
    @IBOutlet private var rightArrow: UIImageView!
}
