//
//  HouseModels.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 05/04/23.
//

import Foundation

enum HouseModels {
    enum Fetch {
        struct Request {}
        struct Response { var houses: [HouseAPIModel] }
        class ViewModel: ObservableObject {
            @Published var houses: [ArmsModel] = []
        }
    }
}
