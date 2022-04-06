//
//  Picker.swift
//  PhotoPickerDemo
//
//  Created by Eddy Franco on 4/4/22.
//

import UIKit

enum Picker {
    enum Source: String {
        case library, camera
    }
    
    static func checkPermissions() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return true
        } else {
            return false
        }
    }
}
