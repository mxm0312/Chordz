//
//  FeedTableViewCell.swift
//  Chordz
//
//  Created by Maxim Perehod on 01.11.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nickLabel: UILabel!
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var albumLabel: UILabel!
    @IBOutlet var albumImage: UIImageView!
    @IBOutlet var descriptionText: UILabel!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        albumImage.layer.cornerRadius = 5
        albumImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with song: Song) {
        songNameLabel.text = song.name
        artistLabel.text = song.artist
        albumLabel.text = song.album
        descriptionText.text = song.description
        likesLabel.text = String(song.likes ?? 0)
        albumImage.image = UIImage(named: song.image ?? "none")
    }
    
}
