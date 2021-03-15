//
//  Meal.swift
//  lecture08-project
//
//  Created by hamsternik on 15.03.2021.
//

import UIKit

final class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int

    init?(name: String, photo: UIImage?, rating: Int) {
        guard name.isEmpty == false && rating >= 0 else { return nil }

        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
