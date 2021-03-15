//
//  NewMealViewController.swift
//  lecture08-project
//
//  Created by hamsternik on 14.03.2021.
//

import UIKit
import os.log

class NewMealViewController: UIViewController, UINavigationControllerDelegate {
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()

        /// **IMPORTANT**
        /// Did not set the `delegate` property for the `nameTextField` as we did so in the _Main.storyboard_

        /// Enable the Save button only whether the text field has a valid Meal name.
        updateSaveButtonState()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling.", log: OSLog.default, type: .debug)
            return
        }

        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating

        /// Set the meal to be passed to MealTableViewController after the unwind segue.
        meal = Meal(name: name, photo: photo, rating: rating)
    }

    // MARK: Private

    @IBOutlet
    private var nameTextField: UITextField!

    @IBOutlet
    private var photoImageView: UIImageView!

    @IBOutlet
    private var ratingControl: RatingControl!

    @IBOutlet
    private var saveButton: UIBarButtonItem!

    @IBAction
    private func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        /// Hide the keyboard.
        nameTextField.resignFirstResponder()

        /// UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()

        /// Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self

        /// Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary

        /// Present image picker controller on the screen covering target view controller.
        present(imagePickerController, animated: true, completion: nil)
    }

    private func updateSaveButtonState() {

    }
}

// MARK: - UIImagePickerControllerDelegate

extension NewMealViewController: UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage

        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
}

extension NewMealViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        /// disable the Save button while editing.
        saveButton.isEnabled = false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        saveButton.isEnabled = true
        return true
    }
}
