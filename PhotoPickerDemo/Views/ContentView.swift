//
//  ContentView.swift
//  PhotoPickerDemo
//
//  Created by Eddy Franco on 4/4/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.6)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal)
            }
            HStack {
                Button {
                    vm.source = .camera
                    vm.showPhotoPicker()
                } label: {
                    Text("Camera")
                }
                Button {
                    vm.source = .library
                    vm.showPhotoPicker()
                } label: {
                    Text("Photos")
                }
            }
            Spacer()
        }
        .sheet(isPresented: $vm.showPicker) {
            ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
        }
        .navigationTitle("My Images")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
