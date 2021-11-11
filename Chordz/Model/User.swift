//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 06.11.2021.
//

import Foundation


// MARK: структура пользователя
struct User {
    var nick: String?
    var songs: [String]? // массив идентификаторов песен
    var followingUsers: [String]?
    var followingTags: [String]?
}
