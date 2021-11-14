//
//  ProfileViewController.swift
//  Chordz
//
//  Created by Алена Захарова on 13.11.2021.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    
    private var songs = [Song]()
    
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
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        //fixme
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        label.font = .boldSystemFont(ofSize: 13)
        label.numberOfLines = 0
        return label
    }()
    
    private let mySongsButton: UIButton = {
        let button = UIButton()
        button.setTitle("My Songs", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
//        button.addTarget(self,action:#selector(signInButton),for:.touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "feedCell")
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 350
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        setUI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedTableViewCell
        cell?.configure(with: Song(artist: "Radiohead", name: "Fake Plastic Trees", album: "The Bends 1995", description: "The Bends is the second studio album by the English rock band Radiohead, released on 8 March 1995 by Parlophone.", nick: "nickname", tags: ["kshdad"], image: "radiohead", likes: 69, comments: nil))
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
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
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
}
