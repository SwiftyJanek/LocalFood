//
//  User.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import Foundation

// MARK: - User Eigenschaften
struct User: Codable {
    let firstname: String
    let lastname: String
    let age: Int
    let sex: String
    let status: String
    let totalRecepies: Int
    let totalArticles: Int
}
