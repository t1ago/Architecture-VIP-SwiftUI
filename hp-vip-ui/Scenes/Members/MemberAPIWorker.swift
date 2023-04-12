//
//  MemberAPIWorker.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 10/04/23.
//

import Foundation

class MemberAPIWorker {
    var API_URL: String { "https://hp-api.onrender.com/api/characters/house" }
    
    func fetch(houseName: String, completed: @escaping ([MemberAPIModel]) -> Void) {

        let url = URL(string: "\(API_URL)/\(houseName)")!

        let task = URLSession.shared.dataTask(with: url) { value, response, error in
            if let value = value {
                let members = try? JSONDecoder().decode([MemberAPIModel].self, from: value)
                completed(members ?? [])
            } else {
                completed([])
            }
        }
        task.resume()
    }
}
