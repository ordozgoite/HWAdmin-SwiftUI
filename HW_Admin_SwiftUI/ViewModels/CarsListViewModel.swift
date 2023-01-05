//
//  CarsListViewModel.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 04/01/23.
//

import Foundation
import UIKit

class CarsListViewModel: ObservableObject {
    
    @Published var carsList: [CarViewModel] = []
    
    func getCars() {
        carsList = [
            CarViewModel(car: Car(name: "Carro 1", brand: .hotWheels, year: "2022", line: .main, color: .black, carCase: .a, image: UIImage(named: "example")!, specialTag: .none)),
            CarViewModel(car: Car(name: "Carro 2", brand: .hotWheels, year: "2022", line: .main, color: .black, carCase: .a, image: UIImage(named: "example")!, specialTag: .none)),
            CarViewModel(car: Car(name: "Carro 3", brand: .hotWheels, year: "2022", line: .main, color: .black, carCase: .a, image: UIImage(named: "example")!, specialTag: .none))
        ]
    }
    
}

struct CarViewModel: Identifiable {
    
    let car: Car
    
    var id: UUID {
        car.id
    }
    
    var name: String {
        car.name
    }
    
    var image: UIImage {
        car.image
    }
}
