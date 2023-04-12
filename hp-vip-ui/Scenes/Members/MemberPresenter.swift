//
//  MemberPresenter.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 11/04/23.
//

import Foundation

protocol MemberPresenterLogic {
    func fetch(response: MemberModels.Fetch.Response)
}

class MemberPresenter: MemberPresenterLogic {
    var view: MemberViewLogic?
    
    func fetch(response: MemberModels.Fetch.Response) {
        let viewModel = MemberModels.Fetch.ViewModel()
        viewModel.members = response.members.map({ member in
            let arms = ArmsModel(imageName: "", imageData: member.image?.toNSData(), name: member.name)
            return arms
        })
        view?.fetch(viewModel)
    }
}
