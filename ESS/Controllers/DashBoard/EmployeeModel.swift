//
//  EmployeeModel.swift
//  ESS
//
//  Created by wido technologies on 01/06/22.
//


import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let contacts: [Contact]
}

// MARK: - Contact
struct Contact: Codable {
    let id, name, email: String
 
}
