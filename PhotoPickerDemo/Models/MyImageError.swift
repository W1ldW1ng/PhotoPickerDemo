//
//  MyImageError.swift
//  PhotoPickerDemo
//
//  Created by Eddy Franco on 4/6/22.
//

import SwiftUI

enum MyImageError: Error, LocalizedError {
    case readError
    case decodingError
    case encodingError
    case saveError
    
    var errorDescription: String? {
        switch self {
            
        case .readError:
            return NSLocalizedString("Could not load MyImage.json, please reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your list of images, please create a new image to start over.", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not sabe your MyImage data, please reinstall the app..", comment: "")
        case .saveError:
            return NSLocalizedString("Could not save MyImage Json file, please reinstall the app.", comment: "")
        }
    }
    
    struct ErrorType: Identifiable {
        let id = UUID()
        let error: MyImageError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {}
    }
}
