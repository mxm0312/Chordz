//
//  ProfileActionsManager.swift
//  Chordz
//
//  Created by Maxim Perehod on 15.12.2021.
//

import Foundation
import Firebase

/// Протокол работающий с изменениями и добавлением аттрибутов профиля
protocol ProfileActionsManagerProtocol {
    /// Изменение аватарки на профиле
    func changePhoto(data: Data, uid: String)
    /// Загрузка аватарки профиля
    func loadPhoto(uid: String, complition: @escaping (Data?) -> Void)
}

class ProfileActionsManager: ProfileActionsManagerProtocol {
    
    let storage = Storage.storage()
    let imageRef: StorageReference?
    static let shared = ProfileActionsManager()
    
    func changePhoto(data: Data, uid: String) {
       
        let uploadTask = imageRef?.child(uid).putData(data, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            return
          }
        }
    }
    
    func loadPhoto(uid: String, complition: @escaping (Data?) -> Void) {
       
        let uploadTask = imageRef?.child(uid).getData(maxSize: 5 * 1024 * 1024, completion: { (data, error) in
            if error == nil {
                complition(data)
            }
        })
    }
    
    private init() {
        imageRef = storage.reference().child("profileImages")
    }
    
}
