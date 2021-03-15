//
//  TutorialPageViewControlelr.swift
//  lecture09-project-final
//
//  Created by hamsternik on 15.03.2021.
//

import UIKit

final class TutorialPageViewControlelr: UIPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self

        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    // MARK: Private

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [
            coloredViewController(of: .purple),
            coloredViewController(of: .orange),
            coloredViewController(of: .teal)
        ]
    }()

    private func coloredViewController(of page: ColoredPage) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: page.description)
    }
}

// MARK: - ColoredPage

extension TutorialPageViewControlelr {
    enum ColoredPage: CustomStringConvertible {
        case purple
        case orange
        case teal

        var description: String {
            switch self {
            case .purple:
                return PurpleViewController.storyboardIndentifier
            case .orange:
                return OrangeViewController.storyboardIndentifier
            case .teal:
                return TealViewController.storyboardIndentifier
            }
        }
    }
}

// MARK: - UIPageViewControllerDataSource

extension TutorialPageViewControlelr: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let controllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = controllerIndex - 1

        guard previousIndex >= 0 else {
            return nil
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }

        return orderedViewControllers[previousIndex]
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let controllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let nextIndex = controllerIndex + 1
        let orderedControllerCount = orderedViewControllers.count

        guard orderedControllerCount != nextIndex else {
            return nil
        }

        guard orderedControllerCount > nextIndex else {
            return nil
        }

        return orderedViewControllers[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        orderedViewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard
            let firstController = viewControllers?.first,
            let firstControllerIndex = orderedViewControllers.firstIndex(of: firstController)
        else {
            return 0
        }

        return firstControllerIndex
    }
}
