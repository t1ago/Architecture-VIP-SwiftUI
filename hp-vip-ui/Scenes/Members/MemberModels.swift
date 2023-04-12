//
//  MemberModels.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 06/04/23.
//

import Foundation

enum MemberModels {
    enum Fetch {
        struct Request {
            var houseName: String
        }
        struct Response {
            var members: [MemberAPIModel]
        }
        class ViewModel: ObservableObject {
            @Published var members: [ArmsModel] = []
        }
    }
}
