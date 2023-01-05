//
//  CarsListView.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 04/01/23.
//

import SwiftUI

struct CarsListView: View {
    
    @Binding var carsList: [CarViewModel]
    
    var body: some View {
        List($carsList) { $car in
            CarCell(car: car)
        }
    }
}

//struct CarsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarsListView()
//    }
//}
