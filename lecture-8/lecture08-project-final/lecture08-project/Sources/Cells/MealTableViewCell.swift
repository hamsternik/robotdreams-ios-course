//
//  MealTableViewCell.swift
//  lecture08-project
//
//  Created by hamsternik on 15.03.2021.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    struct ViewModel {
        let name: String
        let photo: UIImage?
        let rating: Int
    }

    static let reusableIdentifier = "MealTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        photoImageView.image = viewModel.photo
        ratingControl.rating = viewModel.rating
    }

    // MARK: Private

    @IBOutlet
    private var nameLabel: UILabel!

    @IBOutlet
    private var photoImageView: UIImageView!

    @IBOutlet
    private var ratingControl: RatingControl!
}
