//
//  AddCarScreen.swift
//  HW_Admin_SwiftUI
//
//  Created by Victor Ordozgoite on 05/01/23.
//

import SwiftUI

struct AddCarScreen: View {
    
    @ObservedObject private var addCarVM = AddCarViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        VStack {
            Form {
                Section("NAME") {
                    TextField("", text: $addCarVM.name, prompt: Text("Car's name"))
                }
                
                Section("RELEASE INFO") {
                    HStack {
                        Picker("Line", selection: $addCarVM.line) {
                            ForEach(Line.allCases, id: \.self) { line in
                                Text(line.name)
                            }
                        }
                        
                        Picker("Case", selection: $addCarVM.carCase) {
                            ForEach(CarCase.allCases, id: \.self) { carCase in
                                Text(carCase.name)
                            }
                        }
                    }
                }
                
                Section("COLOR") {
                    Picker("Color", selection: $addCarVM.color) {
                        ForEach(Color.allCases, id: \.self) { color in
                            Text(color.name)
                        }
                    }
                }
                
                Section("SPECIAL TAG") {
                    Picker("Special Tag", selection: $addCarVM.specialTag) {
                        ForEach(SpecialTag.allCases, id: \.self) { tag in
                            Text(tag.name)
                        }
                    }
                }
                
                Section("IMAGE") {
                    HStack {
                        Text("Add Image")
                        Spacer()
                        if let image = addCarVM.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                        }
                        
                        // CAMERA BUTTON
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "camera")
                        }
                        .confirmationDialog("Select Photo", isPresented: $showSheet) {
                            Button("Photo Library") {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            }
                            Button("Camera") {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            }
                            Button("Cancel", role: .cancel, action: {})
                        }
                    }
                }
                
                Button {
                    // add car
                } label: {
                    HStack {
                        Spacer()
                        Text("Add Car")
                        Spacer()
                    }
                }
                .disabled(!addCarVM.isCarValid())
            }
        }
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: $addCarVM.image, isShown: $showImagePicker, sourceType: self.sourceType)
        })
        .toolbar {
            Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Add Car")
        .embedInNavigationView()
    }
}

struct AddCarScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCarScreen()
    }
}
