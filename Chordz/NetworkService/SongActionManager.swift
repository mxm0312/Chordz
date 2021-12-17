//
//  SongActionManager.swift
//  Chordz
//
//  Created by Maxim Perehod on 09.12.2021.
//

import Foundation
import Firebase

/// Протокол описыващий всё сетевое взаимодействие связанное с изменением и добавлением песен
protocol SongActionManagerProtocol {
    func addLike(songID: String)
    func unlike(songID: String)
    func removeSongFromAdded(songID: String)
    func puplishSong(song: Song, complition: @escaping () -> Void)
    func setAlbumImage(data: Data, songID: String)
    func loadAlbumImage(songID: String, complition: @escaping (Data?) -> Void)
}

class FirestoreSongActionManager: SongActionManagerProtocol {
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let userRef: CollectionReference?
    let songRef: CollectionReference?
    let albumImageRef: StorageReference?
    
    static let shared = FirestoreSongActionManager()
    
    private init() {
        userRef = db.collection("Users")
        songRef = db.collection("Songs")
        albumImageRef = storage.reference().child("albumImage")
    }
    
    func addLike(songID: String) {
        songRef?.whereField("id", isEqualTo: songID).getDocuments(completion: { snap, error in
            if error == nil {
                if let dict = snap?.documents[0].data() as? [String: Any] {
                    if var likes = dict["likes"] as? Int {
                        likes += 1
                        self.songRef?.document(songID).updateData(["likes": likes])
                    }
                }
            }
        })
    }
    
    func unlike(songID: String) {
        songRef?.whereField("id", isEqualTo: songID).getDocuments(completion: { snap, error in
            if error == nil {
                if let dict = snap?.documents[0].data() as? [String: Any] {
                    if var likes = dict["likes"] as? Int {
                        likes -= 1
                        self.songRef?.document(songID).updateData(["likes": likes])
                    }
                }
            }
        })
    }
    
    func puplishSong(song: Song, complition: @escaping () -> Void) {
        guard let id = song.id else {
            return
        }
        do {
            songRef?.document(id).setData(["artist": song.artist, "name": song.name, "album": song.album, "nick": song.nick, "image": song.image, "likes": song.likes, "date": song.date, "id": id, "content": song.content])
            complition()
        } catch let err {
            print(err)
        }
        
    }
    
    func setAlbumImage(data: Data, songID: String) {
        let uploadTask = albumImageRef?.child(songID).putData(data, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            return
          }
        }
    }
    
    func loadAlbumImage(songID: String, complition: @escaping (Data?) -> Void) {
        let uploadTask = albumImageRef?.child(songID).getData(maxSize: 5 * 1024 * 1024, completion: { (data, error) in
            if error == nil {
                complition(data)
            }
        })
    }
    
    func removeSongFromAdded(songID: String) {
        
    }
}
