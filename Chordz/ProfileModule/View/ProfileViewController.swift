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
    
    var songs: [Song] = []

    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logoIcon
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 73)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(.settingsIcon, for: .normal)
        button.addTarget(self,action:#selector(settingsButtonTapped),
                         for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nickLabel: UILabel = {
        let label = UILabel()
        label.text = "nick"
        label.textColor = .black
        label.font =  UIFont(name: "Montserrat-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        //fixme
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        label.font =  UIFont(name: "Montserrat-Regular", size: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mySongsButton: UIButton = {
        let button = UIButton()
        button.setTitle("My Songs", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 15)
        //        button.addTarget(self,action:#selector(signInButton),for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,action:#selector(mySongsTapped),
                         for:.touchUpInside)
        return button
    }()
    
    private let savedSongsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Saved songs", for: .normal)
        button.setTitleColor(UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,action:#selector(savedSongsTapped),
                         for:.touchUpInside)
        return button
    }()
    
    @objc func mySongsTapped(sender: UIButton) {
        songs = []
        savedSongsButton.setTitleColor(UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1), for: .normal)
        mySongsButton.setTitleColor(.black, for: .normal)
        presenter?.loadMySongs()
    }
    
    @objc func savedSongsTapped(sender: UIButton) {
        songs = []
        mySongsButton.setTitleColor(UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1), for: .normal)
        savedSongsButton.setTitleColor(.black, for: .normal)
        presenter?.loadSavedSongs()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = ProfilePresenter(view: self, service: FirebaseNetworkService.shared)
        overrideUserInterfaceStyle = .light
        
        let nib = UINib(nibName: "SongView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "songView")
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        setUI()
        
        presenter?.loadInfo()
        presenter?.loadMyProfileImage()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "songView") as? SongView else {
            return .init()
        }
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self,action:#selector(deleteButtonTapped),for:.touchUpInside)
        cell.selectionStyle = .none
        let song = songs[indexPath.row]
        cell.configure(with: song)
        presenter?.loadAlbumImage(songID: songs[indexPath.row].id ?? "", complition: { data in
            if let data = data {
                cell.albumImage.image = UIImage(data: data)
            } else {
                cell.albumImage.image = .none
            }
        })
        return cell
    }
    
    func setMyProfileImage(data: Data?) {
        guard let data = data else {
            profileImage.image = UIImage.account
            return
        }
        profileImage.image = UIImage(data: data)

    }
    
    @objc func settingsButtonTapped(sender: UIButton) {
        presenter?.navigateToSettings()
    }
    
    @objc func deleteButtonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Delete the song?", message: nil, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.presenter?.deleteSong(songId: sender.tag)
            //self.songs = self.presenter?.loadSongs() ?? []

            self.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func setUI() {
        // logo
        view.addSubview(logoImage)
        logoImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
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
        
        // тут должен быть мем "оно не работает, и я не знаю почему. оно работает, и я не знаю почему"
        // оно реально не работает и я реально не знаю почему...(((
        profileImage.layoutIfNeeded()
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        
        profileImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePicture))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(gesture)
        
        
        view.addSubview(statusLabel)
        statusLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        // some user info
        view.addSubview(nickLabel)
        nickLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -10).isActive = true
        nickLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 10).isActive = true
        
        // buttons
        view.addSubview(mySongsButton)
        mySongsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        mySongsButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 26).isActive = true
        
        view.addSubview(savedSongsButton)
        savedSongsButton.leftAnchor.constraint(equalTo: mySongsButton.rightAnchor, constant: 32).isActive = true
        savedSongsButton.centerYAnchor.constraint(equalTo: mySongsButton.centerYAnchor).isActive = true
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SongViewingViewController(nibName: "SongViewingViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        let presenter = SongViewingPresenter(view: vc, service: FirebaseNetworkService.shared)
        presenter.song = self.songs[indexPath.row]
        vc.presenter = presenter
        guard let tabBar = self.parent as? UITabBarController else {
            return
        }
        tabBar.navigationController?.pushViewController(vc, animated: true)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Прячу нав бар")
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        presenter?.changeMyProfileImage(data: selectedImage.jpegData(compressionQuality: 0.5)!)
        self.profileImage.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setNick(nick: String?) {
        guard let nick = nick else {
            return
        }
        nickLabel.text = nick
    }
}
