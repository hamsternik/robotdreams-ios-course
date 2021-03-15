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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
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
