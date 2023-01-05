//
//  CarsListScreen.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 04/01/23.
//

import SwiftUI

struct CarsListScreen: View {
    
    @ObservedObject private var carsListVM = CarsListViewModel()
    @State private var addViewIsPresented: Bool = false
    
    var body: some View {
        CarsListView(carsList: $carsListVM.carsList)
            .onAppear {
                carsListVM.getCars()
            }
            .sheet(isPresented: $addViewIsPresented, onDismiss: {
                // on dismiss
            }, content: {
                AddCarScreen()
            })
            .navigationTitle("Cars")
            .toolbar {
                Button {
                    addViewIsPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .embedInNavigationView()
    }
}

struct CarsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CarsListScreen()
    }
}
