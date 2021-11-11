//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 08.10.2021.
//

import Foundation


// MARK: структура песни
struct Song {
    var artist: String?
    var name: String?
    var album: String?
    var description: String?
    var nick: String?
    var tags: [String]?
    var image: String?
    var likes: Int?
    var comments: [Comment]?
    var text: String?
    var date: String?
    //var chords: [Chord]?
}

// MARK: Структура комментария
struct Comment {
    var nick: String?
    var text: String?
}
