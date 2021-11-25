//
//  FeedViewController.swift
//  Chordz
//
//  Created by Maxim Perehod on 01.11.2021.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let tableView = UITableView()
    
    private var presenter: FeedViewPresenterProtocol?
    
    private let searchField: UITextField = {
        let field = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 45))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.placeholder = "Введите ник для поиска"
        field.font =  UIFont(name: "Montserrat-Regular", size: Constants.smallTextSize)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 45))
        field.leftViewMode = .always
        field.backgroundColor = .textFieldBgColor
        field.returnKeyType = .continue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var searchFieldTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
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
    
    // Отобразить всё для поиска
    func showSearch() {
        guard var searchFieldTopConstraint = searchFieldTopConstraint else {
            return
        }
        searchFieldTopConstraint.constant = 8
        UIView.animate(withDuration: 0.2, animations: {
            self.tableView.alpha = 0
            self.view.layoutIfNeeded()
        })
    }
    
    // Отобразить всё для поиска
    func hideSearch() {
        guard var searchFieldTopConstraint = searchFieldTopConstraint else {
            return
        }
        searchFieldTopConstraint.constant = -100
        UIView.animate(withDuration: 0.2, animations: {
            self.tableView.alpha = 1
            self.searchField.text = ""
            self.view.layoutIfNeeded()
        })
    }
    
    func setUI() {
        
        // tableView
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавление поиска в navigationBar
        guard let tabBar = self.parent as? UITabBarController else {
            return
        }
        tabBar.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.searchIcon, style: .plain, target: self, action: #selector(searchTapped))
        
        // searchField
        view.addSubview(searchField)
        searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        searchField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        searchFieldTopConstraint = NSLayoutConstraint(item: searchField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: -2*searchField.frame.height) // изначально поисковая строка вне зоны видимости
        view.addConstraint(searchFieldTopConstraint!)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    @objc func searchTapped() {
        presenter?.searchButtonTapped()
    }
    
    
}
