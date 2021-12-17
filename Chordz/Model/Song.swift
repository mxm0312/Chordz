//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 08.10.2021.
//

import Foundation


/// структура песни
struct Song: Codable {
    /// Имя артиста
    var artist: String?
    /// Название песни
    var name: String?
    /// Название альбома
    var album: String?
    /// Описание к песне
    var description: String?
    /// Ник автора разбора этой песни
    var nick: String?
    /// Тэги к данной песни
    var tags: [String]?
    /// Фотография альбома
    var image: String?
    /// Количество лайков
    var likes: Int?
    /// Комментарии других пользователей
    var comments: [Comment]?
    /// Текст разбора песни
    var content: String?
    /// Дата разбора
    var date: Int?
    /// айдишник песни
    var id: String?
}

/// Структура комментария
struct Comment: Codable {
    var nick: String?
    var text: String?
    var date: Int?
}
