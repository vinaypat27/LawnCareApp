//
//  ViewController.swift
//  LawnCare(UploadImage Feature2)
//
//  Created by Vinay Pattanashettar on 6/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var field: UITextField!
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        field.returnKeyType = .done
        field.autocorrectionType = .yes
        field.becomeFirstResponder()
        field.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func uploadDescriptionButton() {
        field.resignFirstResponder()
        
    }
    
    @IBAction func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let text = textField.text
        print("\(text)")
        return true
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let image = info[UIImagePickerController.InfoKey(rawValue:"UIImagePickerControllerEditedImage")] as? UIImage {
             imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

