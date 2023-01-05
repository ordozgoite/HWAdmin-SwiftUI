//
//  AddCarViewModel.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 05/01/23.
//

import Foundation
import UIKit

class AddCarViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var color: Color = .black
    @Published var line: Line = .main
    @Published var specialTag: SpecialTag = .none
    @Published var carCase: CarCase = .a
    @Published var image: UIImage?
    
    func addCar() {
        
    }
    
    func isCarValid() -> Bool {
        if name == "" {
            return false
        } else {
            return true
        }
    }
}
