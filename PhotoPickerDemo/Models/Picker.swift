//
//  Picker.swift
//  PhotoPickerDemo
//
//  Created by Eddy Franco on 4/4/22.
//

import SwiftUI
import AVFoundation

enum Picker {
    enum Source: String {
        case library, camera
    }
    
    enum PickerError: Error, LocalizedError {
        case unavilable
        case restricted
        case denied
        
        var errorDescription: String? {
            switch self {
            case .unavilable:
                return NSLocalizedString("There is no avilable camera on this davice", comment: "")
            case .restricted:
                return NSLocalizedString("You are not allowed to access media capture devices", comment: "")
            case .denied:
                return NSLocalizedString("You have explicitly denied permission for media capture.", comment: "")
            }
        }
    }
    
    static func checkPermissions()throws {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .restricted:
                throw PickerError.restricted
            case .denied:
                throw PickerError.denied
            default:
                break
            }
        } else {
            throw PickerError.unavilable
        }
    }
    
    struct CameraErrorType {
        let error: Picker.PickerError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {}
    }
}
