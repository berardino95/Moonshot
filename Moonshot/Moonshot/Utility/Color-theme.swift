//
//  Color-theme.swift
//  Moonshot
//
//  Created by CHIARELLO Berardino - ADECCO on 09/05/23.
//

import Foundation
import SwiftUI

//Extend ShapeStyle only when color are used in a modifier like .background(.red)
extension ShapeStyle where Self == Color {
    
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
    static var gold: Color {
        Color(red: 0.9, green: 0.8, blue: 0.03)
    }
    
}
