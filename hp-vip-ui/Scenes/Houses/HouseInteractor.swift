//
//  HouseInteractor.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 05/04/23.
//

import Foundation

protocol HouseInteractorLogic: AnyObject {
    func fetch()
}

class HouseInteractor: HouseInteractorLogic {
    let houseApiWorker: HouseAPIWorker
    var presenter: HousePresenterLogic?
    
    init(houseApiWorker: HouseAPIWorker = HouseAPIWorker()) {
        self.houseApiWorker = houseApiWorker
    }
    
    func fetch() {
        houseApiWorker.fetch { [weak self] houses in
            let response = HouseModels.Fetch.Response(houses: houses)
            self?.presenter?.fetch(response)
        }
    }
}
