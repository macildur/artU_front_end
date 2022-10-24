//
//  User.swift
//  ArtU
//
//  Created by Trav Feller on 10/19/22.
//

struct User: Codable, Identifiable {
    var id: String
    var username: String
    var first_name: String
    var last_name: String
    var password: String
    var profile_pic_URL: String
    var current_module: Int
    var current_streak: Int
}
