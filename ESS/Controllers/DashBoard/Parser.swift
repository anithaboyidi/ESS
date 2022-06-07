//
//  Parser.swift
//  ESS
//
//  Created by wido technologies on 03/06/22.
//

import Foundation

struct Parser {
    func parse(comp : @escaping ([Contact])->()) {
    let api = URL(string: "https://api.androidhive.info/contacts/")
        
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                comp(result.contacts)
            } catch {
                
            }
            
        }.resume()
    }
}
