//
//  LoadManager.swift
//  Chordz
//
//  Created by Maxim Perehod on 13.10.2021.
//

import Foundation

// MARK: Протокол работы с БД
protocol LoadManagerProtocol {
    
    /* Загрузка пользователя по uid */
    func loadUser(uid: String, complitionHandler: @escaping (User?) -> Void)
    
    /* Загрузка пользователя по niсk */
    func loadUser(nick: String, complitionHandler: @escaping (User?) -> Void)
    
    /* Загрузка всех песен с таким названием */
    func loadSongs(name: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /* Загрузка всех песен с таким исполнителем */
    func loadSongs(artist: String, complitionHandler: @escaping ([Song]?) -> Void)
    
    /* Загрузка всех песен конкретного пользователя */
    func loadSongs(uid: String, complitionHandler: @escaping ([Song]?) -> Void)

}


