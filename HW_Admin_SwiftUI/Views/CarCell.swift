//
//  CarCell.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 04/01/23.
//

import SwiftUI

struct CarCell: View {
    
    var car: CarViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(uiImage: car.image)
                .resizable()
                .frame(width: 32, height: 32)
                .cornerRadius(8)
            
            Text(car.name)
                .font(.title3)
                .bold()
        }
    }
}

struct CarCell_Previews: PreviewProvider {
    static var previews: some View {
        CarCell(car: CarViewModel(car: Car(name: "Koenigsegg Gemera", brand: .hotWheels, year: "2022", line: .main, color: .black, carCase: .a, image: UIImage(named: "example")!, specialTag: .none)))
    }
}
