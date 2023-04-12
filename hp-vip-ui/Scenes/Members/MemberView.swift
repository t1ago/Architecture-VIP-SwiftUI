//
//  MemberView.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 06/04/23.
//

import SwiftUI

protocol MemberViewLogic {
    func fetch(_ viewModel: MemberModels.Fetch.ViewModel)
}

struct MemberView: View {
    @ObservedObject var model = MemberModels.Fetch.ViewModel()
    @State var houseName: String = ""
    @State var ordenedName: Bool = false
    
    var memberslist: [ArmsModel] {
        if ordenedName {
            return model.members.sorted { modelA, modelB in
                return modelA.name < modelB.name
            }
        } else {
            return model.members
        }
    }
    
    var interactor: MemberInteractorLogic?
    
    static func configure(houseName: String) -> some View {
        var view = MemberView(houseName: houseName)
        let interactor = MemberInteractor()
        let presenter = MemberPresenter()
        
        interactor.presenter = presenter
        presenter.view = view
        view.interactor = interactor
        view.interactor?.fetch(request: MemberModels.Fetch.Request(houseName: houseName))
        
        return view
    }
    
    var body: some View {
        List {
            Toggle(isOn: $ordenedName) {
                Text("Ordenar membros por nome")
            }
            .padding([.bottom, .top], 10)
            
            
            ForEach(memberslist, id: \.self) { arms in
                HStack (alignment: .center, spacing: 10) {
                    
                    if arms.imageData?.count ?? 0 > 0 {
                        Arms(selected: .constant(arms.name), arms: arms)
                            .padding([.bottom, .trailing, .top], 10)
                    }
                    
                    Text(arms.name)
                        .font(.headline)
                }
            }
        }
    }
}

extension MemberView: MemberViewLogic {
    func fetch(_ viewModel: MemberModels.Fetch.ViewModel) {
        DispatchQueue.main.sync {
            model.members = viewModel.members
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        let model = MemberModels.Fetch.ViewModel()
        model.members = [
            ArmsModel(imageName: "hogwarts", name: "Hogwarts"),
            ArmsModel(imageName: "hogwarts", name: "Hogwarts"),
            ArmsModel(imageName: "hogwarts", name: "Hogwarts")
        ]
        
        return MemberView(houseName: "")
    }
}
