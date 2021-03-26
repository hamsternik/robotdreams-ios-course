//
//  ViewController.swift
//  lecture12-project
//
//  Created by hamsternik on 25.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let queue = DispatchQueue(label: "com.robotdreams.lecture12-project.queue")

        print("=== block #1")

        queue.asyncAfter(deadline: .now() + .seconds(1)) {
            print("=== asyncAfter #4")
        }

        print("=== block #2")

        queue.async {
            let array: [Int] = (1...100_000_0).map { $0 * $0 }
            print(array.last)
            print("=== async #2")
        }

        print("=== block #3")

        queue.async {
            print("=== async #3")
        }

        print("=== block #4")

        queue.sync {
            print("=== sync #5")
        }

        print("=== block #5")
    }
}

