//
//  SettingsPresenter.swift
//  Chordz
//
//  Created by Алена Захарова on 30.11.2021.
//

import Foundation
import Firebase

protocol SettingsPresenterProtocol: AnyObject {
    func logoutButtonTapped()
    func navigateToProfile()
    init(view: SettingsViewController)
}

class SettingsPresenter : SettingsPresenterProtocol {
    var view: SettingsViewController?
    
    required init(view: SettingsViewController) {
        self.view = view
    }
    
    func logoutButtonTapped() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let view = LoginViewController()
            view.modalPresentationStyle = .fullScreen
            self.view?.present(view, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func navigateToProfile() {
        let tabBarVC = UITabBarController()
        
        let feed = FeedViewController()
        let feedItem = UITabBarItem()
        feedItem.title = "feed"
        feedItem.image = UIImage.feedTapBarIcon
        feed.tabBarItem = feedItem
        
        let profile = ProfileViewController()
        let profileItem = UITabBarItem()
        profileItem.image = UIImage.profileTabBarIcon
        profileItem.title = "profile"
        profile.tabBarItem = profileItem
        
        tabBarVC.setViewControllers([feed, profile], animated: false)
        tabBarVC.tabBar.tintColor = .black
        let navContrtoller = UINavigationController(rootViewController: tabBarVC)
        
        let title = UILabel()
        title.text = "Chordz"
        title.textColor = .black
        title.font = UIFont(name: "Montserrat-Bold", size: 22)
        
        tabBarVC.navigationItem.titleView = title
        tabBarVC.tabBar.barTintColor = .white
        navContrtoller.navigationBar.barTintColor = .white
        
        navContrtoller.modalPresentationStyle = .fullScreen
        view?.present(navContrtoller, animated: true, completion: nil)
    }
}
