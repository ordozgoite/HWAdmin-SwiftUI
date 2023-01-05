//
//  WebServices.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 05/01/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import UIKit

enum NetworkError: Error {
    case badURL
    case noData
}

class WebServices {
    
    static var shared = WebServices()
    
    let db = Firestore.firestore()
    
    private init() {}
    
    func getAllCars(completionHandler: @escaping ([Car]) -> (Void)) {
        var carsToBeDisplayed = [Car]()
        db.collection("carsHW").document("2022").collection("lines").document("main").collection("cars").order(by: "name").getDocuments { querySnapshot, error in
            if let e = error {
                print("There was an issue retrieving data from Firestore: \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    let numberOfCars = snapshotDocuments.count
                    print("number of cars: \(numberOfCars)")
                    if numberOfCars != 0 {
                        var i: Int = 0 {
                            didSet {
                                print("\n\n\n\n\n\n\n\n=-=-=-=-=-=-=-=-i MUDOU=-=-=-=-=-=-=-=-=-=-=-")
                                if i == numberOfCars {
                                    print("\n\n\n+++++++++++++ AGORA CHEGOU +++++++++++++++++")
                                    completionHandler(carsToBeDisplayed)
                                }
                            }
                        }
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let name = data["name"] as? String, let color = data["color"] as? String, let carCase = data["case"] as? String, let photoURL = data["imageURL"] as? String, let specialTag = data["specialTag"] as? String, let id = doc.documentID as? String, let brand = data["brand"] as? String, let year = data["year"] as? String, let line = data["line"] as? String {
                                let storageRef = Storage.storage().reference()
                                let fileRef = storageRef.child(photoURL)
                                fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                                    if error == nil && data != nil {
                                        if let image = UIImage(data: data!) {
                                            let car = Car(name: name, brand: .hotWheels, year: "2022", line: .main, color: .white, carCase: .a, image: image, specialTag: .none)
                                            carsToBeDisplayed.append(car)
                                            i += 1
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        completionHandler(carsToBeDisplayed)
                    }
                }
            }
        }
    }
}
