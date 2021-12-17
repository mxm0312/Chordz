//
//  SongViewingViewController.swift
//  Chordz
//
//  Created by Maxim Perehod on 07.12.2021.
//

import UIKit

protocol SongViewingViewControllerProtocol: AnyObject {
    func setSongInTextView(text: String)
}

class SongViewingViewController: UIViewController, SongViewingViewControllerProtocol {
    
    @IBOutlet var roundedViewOnTop: UIView!
    @IBOutlet var songName: UILabel!
    @IBOutlet var artistName: UILabel!
    @IBOutlet var albumName: UILabel!
    @IBOutlet var albumImage: UIImageView!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var songTextView: UITextView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var nickLabel: UILabel!
    
    
    var presenter: SongViewingPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundedViewOnTop.layer.cornerRadius = 5
        albumImage.layer.cornerRadius = 5
        albumImage.clipsToBounds = true
        songTextView.text = presenter?.song?.content
        likeLabel.text = String(presenter?.song?.likes ?? 0)
        songName.text = presenter?.song?.name
        albumName.text = presenter?.song?.album
        artistName.text = presenter?.song?.artist
        nickLabel.text = "@" + (presenter?.song?.nick ?? "")
        presenter?.loadAlbumImage(songID: presenter?.song?.id ?? "", complition: { data in
            if let data = data {
                self.albumImage.image = UIImage(data: data)
            } else {
                self.albumImage.image = .none
            }
        })
        
        
        overrideUserInterfaceStyle = .light
        
        
        let likedSongsID = UserDefaults.standard.array(forKey: "likedSongs") ?? []
        if likedSongsID.contains(where: { id in
            guard let id = id as? String else {
                return false
            }
            if id == presenter?.song?.id {
                return true
            } else {
                return false
            }
        }) {
            presenter?.songIsLiked = true
            likeButton.tintColor = .red
            likeLabel.textColor = .red
            
        } else {
            presenter?.songIsLiked = false
        }
        
        
        let addedSongs = UserDefaults.standard.array(forKey: "addedSongs") ?? []
        
        if addedSongs.contains(where: { id in
            guard let id = id as? String else {
                return false
            }
            if id == presenter?.song?.id {
                return true
            } else {
                return false
            }
        }) {
            addButton.isHidden = true
        } else {
            addButton.isHidden = false
        }
    }


    @IBAction func likeButton(_ sender: Any) {
        if presenter?.songIsLiked ?? false == false {
            presenter?.songIsLiked = true
            presenter?.likeTapped()
            presenter?.song?.likes? += 1
            likeLabel.text = String(presenter?.song?.likes ?? 0)
            UIView.animate(withDuration: 0.3, animations: {
                self.likeLabel.textColor = .red
                self.likeButton.tintColor = .red
            })
        } else {
            presenter?.songIsLiked = false
            presenter?.unlikeTapped()
            presenter?.song?.likes? -= 1
            likeLabel.text = String(presenter?.song?.likes ?? 0)
            UIView.animate(withDuration: 0.3, animations: {
                self.likeLabel.textColor = .gray
                self.likeButton.tintColor = .gray
            })
        }
    }
    
    @IBAction func commentButton(_ sender: Any) {
        presenter?.commentTapped()
    }
    @IBAction func addButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.addButton.alpha = 0
        }, completion: { _ in
            self.presenter?.addTapped()
        })
    }
    func setSongInTextView(text: String) {
        songTextView.text = text
    }
}
