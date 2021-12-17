//
//  CreateViewController.swift
//  Chordz
//
//  Created by Maxim Perehod on 13.12.2021.
//

import UIKit

protocol CreateViewProtocol: AnyObject {
    /// Успешная загрузка песни
    func success()
    /// Пользователь не указал обложку
    func showNoImageAlert()
}

class CreateViewController: UIViewController, CreateViewProtocol, UITextFieldDelegate {

    @IBOutlet var albumImage: UIImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var albumField: UITextField!
    @IBOutlet var artistField: UITextField!
    @IBOutlet var contentView: UITextView!
    @IBOutlet var albumLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var aritstLabel: UILabel!
    @IBOutlet var songBoxView: UIView!
    
    
    
    var presenter: CreateViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        albumField.delegate = self
        artistField.delegate = self
        nameField.delegate = self
        songBoxView.layer.cornerRadius = 5
        albumImage.layer.cornerRadius = 10
        albumImage.clipsToBounds = true
        presenter = CreateViewPresenter(view: self, service: FirebaseNetworkService.shared)
    }

    @IBAction func publishButton(_ sender: Any) {
        if artistField.text == "" || nameField.text == "" || albumField.text == "" || contentView.text == "" {
            let alert = UIAlertController(title: "Упс..", message: "Вы заполнили не все данные", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            presenter?.publish(name: nameField.text!, artist: artistField.text!, album: albumField.text!, content: contentView.text!)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func nameChanging(_ sender: UITextField) {
        nameLabel.text = sender.text
    }
    
    @IBAction func artistChanging(_ sender: UITextField) {
        aritstLabel.text = sender.text
    }
    
    @IBAction func albumChanging(_ sender: UITextField) {
        albumLabel.text = sender.text
    }
    
    func success() {
        let alert = UIAlertController(title: "Ура!", message: "Вы опубликовали песню", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        albumField.text = ""
        artistField.text = ""
        nameField.text = ""
        contentView.text = ""
        nameLabel.text = "Название песни"
        aritstLabel.text = "Исполнитель"
        albumLabel.text = "Название альбома"
        albumImage.image = .none
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        artistField.resignFirstResponder()
        albumField.resignFirstResponder()
        return true
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        presentPictureActionSheet()
    }
    
    func showNoImageAlert() {
        let alert = UIAlertController(title: "Упс", message: "Выберите абложку для альбома", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension CreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPictureActionSheet() {
        let actionSheet = UIAlertController(title: "Profile picture",
                                            message: "How would you like to set a profile picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
       
        actionSheet.addAction(UIAlertAction(title: "Select from camera roll",
                                            style: .default,
                                            handler: { [weak self] _ in
                                                self?.presentPicturePicker()
                                            }))
        present(actionSheet, animated: true)
    }
    
    func presentPicturePicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        presenter?.albumImageData = selectedImage.jpegData(compressionQuality: 0.5)!
        self.albumImage.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
