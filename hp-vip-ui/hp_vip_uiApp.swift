//
//  hp_vip_uiApp.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 03/04/23.
//

import SwiftUI

@main
struct hp_vip_uiApp: App {
    var body: some Scene {
        WindowGroup {
            createMainView()
        }
    }
    
    func createMainView() -> some View {
        var view = HouseView(model: HouseModels.Fetch.ViewModel())
        let interactor = HouseInteractor()
        let presenter = HousePresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
