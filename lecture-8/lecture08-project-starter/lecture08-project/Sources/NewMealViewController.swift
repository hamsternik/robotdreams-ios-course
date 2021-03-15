//
//  NewMealViewController.swift
//  lecture08-project
//
//  Created by hamsternik on 14.03.2021.
//

import UIKit

class NewMealViewController: UIViewController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Private

    @IBOutlet
    private var nameTextField: UITextField!

    @IBOutlet
    private var photoImageView: UIImageView!

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
    func textFieldDidEndEditing(_ textField: UITextField) {
        /// TBD
    }
}
