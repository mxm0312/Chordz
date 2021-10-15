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
    func loadUser(uid: String) -> User
    
    /* Загрузка пользователя по niсk */
    func loadUser(nick: String) -> User
    
    /* Загрузка всех песен с таким названием */
    func loadSongs(name: String) -> [Song]
    
    /* Загрузка всех песен с таким исполнителем */
    func loadSongs(artist: String) -> [Song]
    
    /* Загрузка всех песен конкретного пользователя */
    func loadSongs(uid: String) -> [Song]

}


//class FirebaseLoadManager: LoadManagerProtocol {
//    
//    func loadUser(uid: String) -> User {
//        <#code#>
//    }
//    
//    func loadUser(nick: String) -> User {
//        <#code#>
//    }
//    
//    func loadSongs(name: String) -> [Song] {
//        <#code#>
//    }
//    
//    func loadSongs(artist: String) -> [Song] {
//        <#code#>
//    }
//    
//    func loadSongs(uid: String) -> [Song] {
//        <#code#>
//    }
//    
//}
