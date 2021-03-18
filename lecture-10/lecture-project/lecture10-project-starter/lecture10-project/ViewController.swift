//
//  ViewController.swift
//  lecture10-project
//
//  Created by hamsternik on 17.03.2021.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // TODO 1
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // TODO 2
    }

    // MARK: Private

    private let storyboardID = "LoginViewController"

    private let label = UILabel()
    private let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
    private let spinner = UIActivityIndicatorView(style: .large)
    private let status = UIImageView(image: UIImage(named: "banner"))

    private var statusPosition = CGPoint.zero

    // MARK: Outlets

    @IBOutlet private var cloud1ImageView: UIImageView!
    @IBOutlet private var cloud2ImageView: UIImageView!
    @IBOutlet private var cloud3ImageView: UIImageView!
    @IBOutlet private var cloud4ImageView: UIImageView!
    @IBOutlet private var cloud1LeadingConstraint: NSLayoutConstraint!
    @IBOutlet private var cloud2TrailingConstraint: NSLayoutConstraint!
    @IBOutlet private var cloud3TrailingConstraint: NSLayoutConstraint!
    @IBOutlet private var cloud4LeadingConstraint: NSLayoutConstraint!
    @IBOutlet private var headerLabel: UILabel!
    @IBOutlet private var headerLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var loginButtonCenterConstraint: NSLayoutConstraint!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var passwordTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var usernameTextFieldCenterConstraint: NSLayoutConstraint!

    // MARK: Methods

    @IBAction private func login() {
        view.endEditing(true)
    }

    private func setUpUI() {
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true

        spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        loginButton.addSubview(spinner)

        status.isHidden = true
        status.center = loginButton.center
        view.addSubview(status)

        label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18.0)
        label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
        label.textAlignment = .center
        status.addSubview(label)
    }
}

// MARK: - Text Field Delegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextField = textField === usernameTextField ? passwordTextField : usernameTextField
        nextField?.becomeFirstResponder()

        return true
    }
}
