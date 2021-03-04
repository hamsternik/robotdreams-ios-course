//
//  ViewController.swift
//  project06-settings-final
//
//  Created by hamsternik on 03.03.2021.
//

import UIKit

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 64.0
        tableView.rowHeight = UITableView.automaticDimension

        registerActionLargeTableViewCell()
        registerSwitchMediumTableViewCell()
        registerTitleActionMediumTableViewCell()
        registerActionMediumTableViewCell()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .top:
            return 1
        case .bottom(let viewModels):
            return viewModels.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = dataSource[indexPath.section]

        let cell: UITableViewCell
        switch section {
        case .top(let type):
            cell = viewModel(from: type, and: indexPath)
        case .bottom(let types):
            let type = types[indexPath.row]
            cell = viewModel(from: type, and: indexPath)
        }

        cell.setNeedsLayout()
        cell.layoutIfNeeded()

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Private: cell registration

    private func registerActionLargeTableViewCell() {
        let nibName = ActionLargeTableViewCell.reusableIdentifier
        let cell = UINib(nibName: nibName, bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: nibName)
    }

    private func registerSwitchMediumTableViewCell() {
        let nibName = SwitchMediumTableViewCell.reusableIdentifier
        let cell = UINib(nibName: nibName, bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: nibName)
    }

    private func registerTitleActionMediumTableViewCell() {
        let nibName = TitleActionMediumTableViewCell.reusableIdentifier
        let cell = UINib(nibName: nibName, bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: nibName)
    }

    private func registerActionMediumTableViewCell() {
        let nibName = ActionMediumTableViewCell.reusableIdentifier
        let cell = UINib(nibName: nibName, bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: nibName)
    }

    // MARK: - Private: view model handling

    private func viewModel(from type: ViewModel, and indexPath: IndexPath) -> UITableViewCell {
        switch type {
        case .actionLarge(let viewModel):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ActionLargeTableViewCell.reusableIdentifier,
                for: indexPath
            ) as! ActionLargeTableViewCell
            cell.update(with: viewModel)
            return cell
        case .switchMedium(let viewModel):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchMediumTableViewCell.reusableIdentifier,
                for: indexPath
            ) as! SwitchMediumTableViewCell
            cell.update(with: viewModel)
            return cell
        case .titleActionMedium(let viewModel):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TitleActionMediumTableViewCell.reusableIdentifier,
                for: indexPath
            ) as! TitleActionMediumTableViewCell
            cell.update(with: viewModel)
            return cell
        case .actionMedium(let viewModel):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ActionMediumTableViewCell.reusableIdentifier,
                for: indexPath
            ) as! ActionMediumTableViewCell
            cell.update(with: viewModel)
            return cell
        }
    }
}

// MARK: - Data Structure Definitions

extension SettingTableViewController {
    enum ViewModel {
        case actionLarge(ActionLargeTableViewCell.ViewModel)
        case switchMedium(SwitchMediumTableViewCell.ViewModel)
        case titleActionMedium(TitleActionMediumTableViewCell.ViewModel)
        case actionMedium(ActionMediumTableViewCell.ViewModel)
    }

    enum Section {
        case top(ViewModel)
        case bottom([ViewModel])
    }
}

// MARK: - Data Instances

fileprivate let dataSource: [SettingTableViewController.Section] = [
    .top(
        .actionLarge(
            .init(
                avatarImageName: "acc-icon",
                title: "Nikita Khomitsevich",
                description: "Apple ID, iCloud, Media & Purchases"
            )
        )
    ),
    .bottom([
        .switchMedium(.init(iconName: "airplane-mode", title: "Airplane Mode")),
        .titleActionMedium(.init(iconName: "wi-fi", title: "Wi-Fi", actionStatus: "Peppa")),
        .titleActionMedium(.init(iconName: "bluetooth", title: "Bluetooth", actionStatus: "On")),
        .actionMedium(.init(iconName: "cellular-network", title: "Cellular")),
        .titleActionMedium(.init(iconName: "personal-hotspot", title: "Personal Hotspot", actionStatus: "Off")),
        .switchMedium(.init(iconName: "vpn", title: "VPN")),
    ])
]

