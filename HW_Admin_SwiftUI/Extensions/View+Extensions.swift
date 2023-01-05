//
//  View+Extensions.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 05/01/23.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
