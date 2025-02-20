//
//  Favorite.swift
//  Archivea
//
//  Created by found on 17/02/25.
//

import SwiftData
import Foundation

@Model
class FavoriteFolder {
    var name: String
    var image: Data?
    
    @Relationship(deleteRule: .cascade) var favorites: [Favorite]
    
    init(name: String, image: Data? = nil) {
        self.name = name
        self.image = image
        self.favorites = []
    }
}

@Model
class Favorite {
    var post: Post
    @Relationship var folder: FavoriteFolder
    
    init(post: Post, folder: FavoriteFolder) {
        self.post = post
        self.folder = folder
    }
}
