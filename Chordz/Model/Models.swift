//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 08.10.2021.
//

import Foundation


// MARK: Класс аккорда
class Chord {
    var name: String?
    var index: Int?
    
    init(name: String, index: Int) {
        self.name = name
        self.index = index
    }
}

// MARK: Класс песни
class Song {
    var text: String?
    var chords: [Chord]?
    
    init(text: String, chords: [Chord]) {
        self.text = text
        self.chords = chords
    }
}

// MARK: Класс пользователя
class User {
    var nick: String?
    var songs: [String]? // массив идентификаторов песен
    
    init(nick: String, songs: [String]) {
        self.nick = nick
        self.songs = songs
    }
}
