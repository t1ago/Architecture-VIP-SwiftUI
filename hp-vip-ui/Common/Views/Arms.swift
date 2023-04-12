//
//  Arms.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 05/04/23.
//

import SwiftUI

struct Arms: View {
    @Binding var selected: String
    
    var arms: ArmsModel
    var image: Image {
        guard let nsData = arms.imageData else { return Image(arms.imageName) }
        return Image.fromNSData(data: nsData)
    }
    
    var isSelected: Bool {
        selected.elementsEqual(arms.name)
    }
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .padding()
            .clipShape(Circle())
            .overlay {
                if isSelected {
                    Circle().stroke(.white, lineWidth: 5)
                        .shadow(radius: 10)
                } else {
                    Circle().stroke(.white, lineWidth: 1)
                }
            }
            .grayscale(isSelected ? 0.2 : 0.8)
            .onTapGesture {
                selected = arms.name
            }
            
    }
}

struct Arms_Previews: PreviewProvider {
    static var previews: some View {
        let armsModel = ArmsModel(imageName: "hogwarts", name: "Hogwarts")
        Arms(selected: .constant("Hogwarts"), arms: armsModel)
        
    }
}
