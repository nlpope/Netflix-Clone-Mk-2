//
//  Extensions.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 4/5/23.
//

import Foundation

//this is actually really cool. You can add functions to type
extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
