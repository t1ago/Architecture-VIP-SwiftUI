//
//  MemberInteractor.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 10/04/23.
//

import Foundation

protocol MemberInteractorLogic {
    func fetch(request: MemberModels.Fetch.Request)
}

class MemberInteractor: MemberInteractorLogic {
    let memberApiWorker: MemberAPIWorker
    var presenter: MemberPresenterLogic?
    
    init(memberApiWorker: MemberAPIWorker = MemberAPIWorker()) {
        self.memberApiWorker = memberApiWorker
    }
    
    func fetch(request: MemberModels.Fetch.Request) {
        memberApiWorker.fetch(houseName: request.houseName) { members in
            let response = MemberModels.Fetch.Response(members: members)
            self.presenter?.fetch(response: response)
        }
    }
}
