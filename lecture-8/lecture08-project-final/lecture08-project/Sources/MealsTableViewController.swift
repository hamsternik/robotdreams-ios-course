//
//  MealsTableViewController.swift
//  lecture08-project
//
//  Created by hamsternik on 15.03.2021.
//

import UIKit

class MealsTableViewController: UITableViewController {
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        /// Load the sample data.
        loadSampleMeals()
    }

    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MealTableViewCell.reusableIdentifier,
            for: indexPath
        ) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }

        let meal = meals[indexPath.row]
        cell.update(
            with: .init(
                name: meal.name,
                photo: meal.photo,
                rating: meal.rating
            )
        )

        return cell
    }

    // MARK: Navigation

    @IBAction
    private func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NewMealViewController, let meal = sourceViewController.meal {
            let indexPath = IndexPath(row: meals.count, section: 0)

            /// Add a new meal.
            meals.append(meal)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: Private

    private func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")

        guard let firstMeal = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }

        guard let secondMeal = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }

        guard let lastMeal = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal3")
        }

        meals.append(contentsOf: [firstMeal, secondMeal, lastMeal])
    }
}
