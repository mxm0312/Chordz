//
//  ProfileViewController.swift
//  Chordz
//
//  Created by Алена Захарова on 13.11.2021.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var presenter: ProfilePresenter?
    
    let tableView = UITableView()
    
    var songs: [Song] = [
        Song(artist: "Radiohead", name: "Fake Plastic Trees", album: "The Bends 1995", description: "The Bends is the second studio album by the English rock band Radiohead, released on 8 March 1995 by Parlophone.", nick: "nickname", tags: ["kshdad"], image: "radiohead", likes: 69, comments: nil),
        Song(artist: "Radiohead", name: "My Iron Lung", album: "The Bends 1995", description: "The Bends is the second studio album by the English rock band Radiohead, released on 8 March 1995 by Parlophone.", nick: "nickname", tags: ["kshdad"], image: "radiohead", likes: 69, comments: nil),
        Song(artist: "Radiohead", name: "High and Dry", album: "The Bends 1995", description: "The Bends is the second studio album by the English rock band Radiohead, released on 8 March 1995 by Parlophone.", nick: "nickname", tags: ["kshdad"], image: "radiohead", likes: 69, comments: nil),
    ]
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logoIcon
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 73)
        return imageView
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(.settingsIcon, for: .normal)
        button.addTarget(self,action:#selector(settingsButtonTapped),
                         for:.touchUpInside)
        return button
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    
    private let nickLabel: UILabel = {
        let label = UILabel()
        //fixme
        label.text = "@nickname"
        label.font =  UIFont(name: "Montserrat-Bold", size: 20)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        //fixme
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        label.font =  UIFont(name: "Montserrat-Regular", size: 13)
        label.numberOfLines = 0
        return label
    }()
    
    private let mySongsButton: UIButton = {
        let button = UIButton()
        button.setTitle("My Songs", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 15)
//        button.addTarget(self,action:#selector(signInButton),for:.touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(view: self, service: FirebaseNetworkService.shared)
        let nib = UINib(nibName: "SongView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "songView")
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        setUI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songView") as? SongView
        let song = songs[indexPath.row]
        cell?.configure(with: song)
        return cell!
    }
    
    @objc func settingsButtonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Yoohoo!", message: "Settings button was tapped", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUI() {
        // logo
        view.addSubview(logoImage)
        logoImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        // settings
        let searchView = UIView()
        view.addSubview(searchView)
        settingsButton.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        settingsButton.layer.cornerRadius = settingsButton.frame.height / 2
        searchView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22).isActive = true
        searchView.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor).isActive = true
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        searchView.addSubview(settingsButton)
        settingsButton.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        
        // profile image
        view.addSubview(profileImage)
        profileImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImage.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 23).isActive = true
        profileImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        // тут должен быть мем "оно не работает, и я не знаю почему. оно работает, и я не знаю почему"
        // оно реально не работает и я реально не знаю почему...(((
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        
        profileImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePicture))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(gesture)
        
        // some user info
        view.addSubview(nickLabel)
        nickLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16).isActive = true
        nickLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 10).isActive = true
        nickLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(statusLabel)
        statusLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        statusLabel.topAnchor.constraint(equalTo: nickLabel.bottomAnchor, constant: 10).isActive = true
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // buttons
        view.addSubview(mySongsButton)
        mySongsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        mySongsButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 26).isActive = true
        mySongsButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        // tableView
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: mySongsButton.bottomAnchor, constant: 26).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTapChangeProfilePicture() {
        presentPictureActionSheet()
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPictureActionSheet() {
        let actionSheet = UIAlertController(title: "Profile picture",
                                            message: "How would you like to set a profile picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
//        actionSheet.addAction(UIAlertAction(title: "Take photo",
//                                            style: .default,
//                                            handler: { [weak self] _ in
//                                                self?.presentCamera()
//                                            }))
        actionSheet.addAction(UIAlertAction(title: "Select from camera roll",
                                            style: .default,
                                            handler: { [weak self] _ in
                                                self?.presentPicturePicker()
                                            }))
        present(actionSheet, animated: true)
    }
    
//    func presentCamera() {
//        let vc = UIImagePickerController()
//        vc.sourceType = .camera
//        vc.delegate = self
//        vc.allowsEditing = true
//        present(vc, animated: true)
//    }
    
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
        self.profileImage.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
