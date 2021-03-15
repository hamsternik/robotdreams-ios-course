//
//  RatingControl.swift
//  lecture08-project
//
//  Created by hamsternik on 14.03.2021.
//

import UIKit

@IBDesignable
final class RatingControl: UIStackView {
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }

    @IBInspectable
    var starSize: CGSize = CGSize(width: 44, height: 44) {
        didSet {
            setupButtons()
        }
    }

    @IBInspectable
    var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }

    // MARK: Private

    private var ratingButtons = [UIButton]()

    private func setupButtons() {
        /// clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()

        /// Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)

        /// Iterate over each button in the `ratingButtons` property
        for index in 0..<starCount {
            /// Create buttons
            let button = UIButton()

            /// Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])

            button.accessibilityLabel = "Set \(index + 1) star rating"

            /// Read more about that property at the Apple documentation
            /// https://developer.apple.com/documentation/uikit/uiview/1622572-translatesautoresizingmaskintoco
            button.translatesAutoresizingMaskIntoConstraints = false

            /// Add constraints
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            /// Add the button to the stack
            addArrangedSubview(button)

            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped), for: .touchUpInside)

            ratingButtons.append(button)
        }
    }

    @objc
    private func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }

        /// Calculate the rating of the selected button
        let selectedRating = index + 1

        if selectedRating == rating {
            /// // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            /// Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }

    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            /// If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            setAcceesibility(for: button, of: index)
        }
    }

    private func setAcceesibility(for selectedButton: UIButton, of index: Int) {
        /// Set the hint string for the currently selected star
        let hintString: String?
        if rating == index + 1 {
            hintString = "Tap to reset the rating to zero."
        } else {
            hintString = nil
        }

        // Calculate the value string
        let valueString: String
        switch rating {
        case 0:
            valueString = "No rating set."
        case 1:
            valueString = "1 star set."
        default:
            valueString = "\(rating) stars set."
        }

        // Assign the hint string and value string
        selectedButton.accessibilityHint = hintString
        selectedButton.accessibilityValue = valueString
    }
}
