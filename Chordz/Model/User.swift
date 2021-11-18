//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 06.11.2021.
//

import Foundation


/// структура пользователя
struct User: Codable {
    /// Идентификатор пользователя
    var uid: String?
    /// Ник пользователя
    var nick: String?
    /// Массив из id песен пользователя
    var songs: [String]?
    /// Ники тех, на кого подписан пользователь
    var followingUsers: [String]?
    /// Тэги на которые подписан пользователь
    var followingTags: [String]?
}
