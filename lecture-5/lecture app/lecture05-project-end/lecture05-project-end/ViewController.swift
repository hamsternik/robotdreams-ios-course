//
//  ViewController.swift
//  lecture05-project-start
//
//  Created by hamsternik on 28.02.2021.
//

import UIKit

class KickstarterLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureContinueWithAppleButton()
        configureContinueWithFacebookButton()
        configureSignUpButton()
        configureLogInButton()
    }

    // MARK: - Private

    @IBOutlet private var continueWithAppleButton: UIButton!
    @IBOutlet private var continueWithFacebookButton: UIButton!
    @IBOutlet private var signUpButton: UIButton!
    @IBOutlet private var logInButton: UIButton!

    private func configureContinueWithAppleButton() {
        continueWithAppleButton.layer.cornerRadius = 12
    }

    private func configureContinueWithFacebookButton() {
        continueWithFacebookButton.layer.cornerRadius = 12
    }

    private func configureSignUpButton() {
        signUpButton.layer.cornerRadius = 12
    }

    private func configureLogInButton() {
        logInButton.layer.cornerRadius = 12
    }
}

