//
//  HouseAPIWorker.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 05/04/23.
//

import Foundation

class HouseAPIWorker {
    var API_URL: String { "https://legacy--api.herokuapp.com/api/v1/houses" }
    
    func fetch(completed: @escaping ([HouseAPIModel]) -> Void) {

        let url = URL(string: "\(API_URL)")!

        let task = URLSession.shared.dataTask(with: url) { value, response, error in
            if let value = value {
                let houses = try? JSONDecoder().decode([HouseAPIModel].self, from: value)
                completed(houses ?? [])
            } else {
                completed([])
            }
        }
        task.resume()
    }
}
