//
//  User.swift
//  ArtU
//
//  Created by Trav Feller on 10/19/22.
//

struct User: Codable, Identifiable {
    var id: Int
    var username: String
    var streak: String
    var firstname: String
    var lastname: String
    var password: String
    var profilePictureUrl: String
    var currentModule: Int
    var currentStreak: Int
}
