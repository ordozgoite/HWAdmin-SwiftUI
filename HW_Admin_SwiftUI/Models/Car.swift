//
//  Car.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 04/01/23.
//

import Foundation
import UIKit

struct Car {
    var id: UUID = UUID()
    let name: String
    let brand: Brand
    let year: String
    let line: Line
    let color: Color
    let carCase: CarCase
    let image: UIImage
    let specialTag: SpecialTag
}

enum SpecialTag: CaseIterable {
    case none
    case treasureHunter
    case superTreasureHunter
    
    var name: String {
        switch self {
        case .none:
            return "none"
        case .treasureHunter:
            return "Treasure Hunter"
        case .superTreasureHunter:
            return "Super Treasure Hunter"
        }
    }
}

enum Brand {
    case hotWheels
}

enum Line: CaseIterable {
    case main
    
    var name: String {
        switch self {
        case .main:
            return "main"
        }
    }
}

enum Color: CaseIterable {
    case white
    case black
    case purple
    
    var name: String {
        switch self {
        case .white:
            return "white"
        case .black:
            return "black"
        case .purple:
            return "purple"
        }
    }
}

enum CarCase: CaseIterable {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case j
    case k
    case l
    case m
    case n
    case p
    case q
    
    var name: String {
        switch self {
        case .a:
            return "A"
        case .b:
            return "B"
        case .c:
            return "C"
        case .d:
            return "D"
        case .e:
            return "E"
        case .f:
            return "F"
        case .g:
            return "G"
        case .h:
            return "H"
        case .j:
            return "J"
        case .k:
            return "K"
        case .l:
            return "L"
        case .m:
            return "M"
        case .n:
            return "N"
        case .p:
            return "P"
        case .q:
            return "Q"
        }
    }
}
