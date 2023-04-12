//
//  HousePresenter.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 05/04/23.
//

import Foundation

protocol HousePresenterLogic: AnyObject {
    func fetch(_ response: HouseModels.Fetch.Response)
}

class HousePresenter: HousePresenterLogic {
    var view: HousesViewLogic?
    
    func fetch(_ response: HouseModels.Fetch.Response) {
        let houses = response.houses.map { house in
            let arms = ArmsModel(imageName: "", imageData: house.image_url.toNSData(), name: house.name)
            return arms
        }
        
        let viewModel = HouseModels.Fetch.ViewModel()
        viewModel.houses = houses
        view?.fetch(viewModel)
    }
}
