//
//  SongView.swift
//  Chordz
//
//  Created by Алена Захарова on 14.11.2021.
//

import UIKit

class SongView: UITableViewCell {
    @IBOutlet var containerView: UIView!
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var albumNameLabel: UILabel!
    @IBOutlet var albumImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var deleteButton: UIButton!
    
    
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
        artistNameLabel.text = song.artist
        albumNameLabel.text = song.album
        descriptionLabel.text = song.description
        albumImage.backgroundColor = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumImage.image = .none
    }
    
}
