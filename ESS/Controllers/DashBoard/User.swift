//
//  User.swift
//  ESS
//
//  Created by wido technologies on 03/06/22.
//


import Foundation

let User = [Welcome]()

// MARK: - Welcome
struct Welcome: Codable {
    let contacts: [Contact]
}

// MARK: - Contact
struct Contact: Codable {
    let id, name, email: String
 
}
