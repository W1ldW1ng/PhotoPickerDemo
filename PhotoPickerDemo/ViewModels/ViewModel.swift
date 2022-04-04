//
//  ViewModel.swift
//  PhotoPickerDemo
//
//  Created by Eddy Franco on 4/4/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
}
