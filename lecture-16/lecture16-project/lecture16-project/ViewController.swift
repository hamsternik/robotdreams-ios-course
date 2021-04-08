//
//  ViewController.swift
//  lecture16-project
//
//  Created by hamsternik on 08.04.2021.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        print("Step #1. Read Data From UserDefaults")
        readDataFromUserDefaults(defaults: defaults)

        print("Step #2. Write Data For UserDefaults")
        writeDataForUserDefaults(defaults: defaults)

        print("Step #3. Write Data For UserDefaults (Person)")
        encodeAndWriteDataForUserDefaults(defaults: defaults)

        print("Step #4. Write Data For UserDefaults (Person)")
        decodeAndReadDataFromUserDefaults(defaults: defaults)
    }

    private let defaults = UserDefaults.standard
}

// MARK: - Private method

extension ViewController {
    private func readDataFromUserDefaults(defaults: UserDefaults) {
        let age = defaults.integer(forKey: "age")
        print("age: \(age)")
        let isUserAdmin = defaults.bool(forKey: "isUserAdmin")
        print("isUserAdmin: \(isUserAdmin)")
        // print Pi
        let lecture = defaults.string(forKey: "lectureNumber")
        print("lecture number: \(String(describing: lecture))")
        let array = defaults.array(forKey: "array")
        print("array: \(String(describing: array))")
        print("dictionary: \(String(describing: defaults.dictionary(forKey: "nikita.dictionary")))")
    }

    private func writeDataForUserDefaults(defaults: UserDefaults) {
        defaults.set(25, forKey: "age")
        defaults.set(true, forKey: "isUserAdmin")
        defaults.set(Double.pi, forKey: "pi")
        defaults.set("Lecture #16", forKey: "lectureNumber")

        let array = ["Hello", "World"]
        defaults.set(array, forKey: "array")

        let dictionary = [
            "name": "Nikita",
            "age": "25"
        ]
        defaults.set(dictionary, forKey: "nikita.dictionary")
    }
}

extension ViewController {
    struct Person: Encodable {
        let name: String
        let age: Int
    }

    private func encodeAndWriteDataForUserDefaults(defaults: UserDefaults) {
        let nikita = Person(name: "Nikita", age: 25)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(nikita) {
            defaults.set(encoded, forKey: "nikita.person")
        }
    }

    private func decodeAndReadDataFromUserDefaults(defaults: UserDefaults) {
        // TBD: homework
    }
}
