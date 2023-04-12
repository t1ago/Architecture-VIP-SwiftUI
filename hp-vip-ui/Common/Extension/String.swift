//
//  String.swift
//  hp-vip-ui
//
//  Created by Tiago Henrique Piantavinha on 11/04/23.
//

import Foundation

extension String {
    func toNSData() -> NSData {
        guard let url = URL(string: self) else { return NSData() }
        
        do {
            return try NSData(contentsOf: url)
        } catch {
            return NSData()
        }
    }
}
