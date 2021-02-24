//
//  ViewController.swift
//  lecture04
//
//  Created by hamsternik on 23.02.2021.
//

import UIKit

class ViewController: UIViewController {

    // UIViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad()")

        configureTextFields()
        configureSignInButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear(_ animated: Bool)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear(_ animated: Bool)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear(_ animated: Bool)")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear(_ animated: Bool)")
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("updateViewConstraints()")
    }

    // Additional methods to operate view and its subviews

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews()")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews()")
    }

    // Private: properties

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var signInButton: UIButton!

    private var passwordTextIsHidden: Bool = true

    // Private: Configuration methods

    private func configureTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    private func configureSignInButton() {
        signInButton.layer.cornerRadius = 8
    }

    // Private: IBAction methods

    @IBAction private func didTapShowPassword(_ button: UIButton) {
        passwordTextIsHidden = !passwordTextIsHidden
        passwordTextField.isSecureTextEntry = passwordTextIsHidden
        if passwordTextIsHidden == true {
            passwordTextField.text = "Show"
        } else {
            passwordTextField.text = "Hide"
        }
    }

    @IBAction private func didTapForgotPassword(_ button: UIButton) {
        print("User has tapped Forgot Password button.")
    }

    @IBAction private func didTapSignIn(_ button: UIButton) {
        print("User has tapped Sign In button.")
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
