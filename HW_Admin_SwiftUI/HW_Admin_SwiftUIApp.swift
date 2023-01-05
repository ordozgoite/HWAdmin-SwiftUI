//
//  HW_Admin_SwiftUIApp.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 04/01/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        return true
    }
}

@main
struct HW_Admin_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            CarsListScreen()
        }
    }
}
