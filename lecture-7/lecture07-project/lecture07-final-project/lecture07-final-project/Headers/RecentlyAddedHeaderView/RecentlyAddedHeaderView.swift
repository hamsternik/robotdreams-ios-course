//
//  RecentlyAddedHeaderView.swift
//  lecture07-final-project
//
//  Created by hamsternik on 10.03.2021.
//

import UIKit

final class RecentlyAddedHeaderView: UICollectionReusableView {
    static let reusableIdentifier = "RecentlyAddedHeaderView"

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        /// 'required' initializer 'init(coder:)' must be provided by subclass of 'UITableViewCell'
    }
}
