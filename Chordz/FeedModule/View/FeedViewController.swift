//
//  FeedViewController.swift
//  Chordz
//
//  Created by Maxim Perehod on 01.11.2021.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let tableView = UITableView()
    var presenter: FeedViewPresenterProtocol?
    
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 73)
        return imageView
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(UIImage(named: "search"), for: .normal)
        button.addTarget(self,action:#selector(searchButtonTapped),
                         for:.touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = FeedViewPresenter(view: self, service: FirebaseNetworkService.shared)
        presenter?.loadContent()
        
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

    @objc func searchButtonTapped(sender: UIButton) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.content.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedTableViewCell else {
            return .init()
        }
        guard let presenter = presenter else {
            return .init()
        }
        cell.configure(with: presenter.content[indexPath.row])
        return cell
    }
    
    
    
    func setUI() {
        
        // HEADER
        view.addSubview(logoImage)
        logoImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        let searchView = UIView()
        view.addSubview(searchView)
        searchButton.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        searchButton.layer.cornerRadius = searchButton.frame.height / 2
        searchView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22).isActive = true
        searchView.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor).isActive = true
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        searchView.addSubview(searchButton)
        searchButton.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
        searchButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        
        // tableView
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
