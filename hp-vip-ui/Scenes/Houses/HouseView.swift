//
//  HousesHome.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 05/04/23.
//

import SwiftUI

protocol HousesViewLogic {
    func fetch(_ viewModel: HouseModels.Fetch.ViewModel)
}

struct HouseView: View {
    let hogwartsArms = ArmsModel(imageName: "hogwarts", name: "Hogwarts")
    @ObservedObject var model: HouseModels.Fetch.ViewModel
    @State private var selected: String = "Hogwarts"
    
    var interactor: HouseInteractorLogic?
    
    var body: some View {
        VStack {
            if model.houses.count > 0 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(model.houses, id: \.self) { arms in
                            VStack (alignment: .center, spacing: 10) {
                                Arms(selected: $selected, arms: arms)
                                    .padding([.bottom, .trailing, .top], 10)
                                
                                Text(arms.name)
                                    .font(.headline)
                            }
                        }
                    }
                    .padding()
                }
                
                if selected != hogwartsArms.name {
                    MemberView.configure(houseName: selected)
                        .edgesIgnoringSafeArea(.bottom)
                }
                
                Spacer()
            } else {
                Arms(selected: $selected, arms: hogwartsArms)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear() {
            interactor?.fetch()
        }
    }
}

extension HouseView: HousesViewLogic {
    func fetch(_ viewModel: HouseModels.Fetch.ViewModel) {
        DispatchQueue.main.sync {
            model.houses = viewModel.houses
        }
    }
}

struct HousesHome_Previews: PreviewProvider {
    static var previews: some View {
        let model = HouseModels.Fetch.ViewModel()
        model.houses = [
            ArmsModel(imageName: "hogwarts", name: "Hogwarts"),
            ArmsModel(imageName: "hogwarts", name: "Hogwarts"),
            ArmsModel(imageName: "hogwarts", name: "Hogwarts")
        ]
        
        return Group {
            HouseView(model: HouseModels.Fetch.ViewModel())
                .previewDisplayName("iPhone 11 - Hogwarts")
            HouseView(model: model)
                .previewDisplayName("iPhone 11 - Houses")
        }.previewDevice(.init(rawValue: "iPhone 11"))
            
    }
}
