//
//  Image.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 11/04/23.
//

import SwiftUI

extension Image {
    static func fromNSData(data: NSData) -> Image {
        let value: Data = data as Data
        
        if value.count > 0 {
            return Image(uiImage: UIImage(data: value)!)
        } else {
            return Image(uiImage: UIImage())
        }
    }
}
