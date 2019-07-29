//
//  APIError.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

/// Posible Errors in a request petition
enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    var localizedDescription: String {
        switch self {
        case .requestFailed: return NSLocalizedString("Request Failed", comment: "Error requesting service")
        case .invalidData: return NSLocalizedString("Invalid Data", comment: "Data is not valid")
        case .responseUnsuccessful: return NSLocalizedString("Response Unsuccessful", comment: "Response of service not satisfactory")
        case .jsonParsingFailure: return NSLocalizedString("JSON Parsing Failure", comment: "Error parsing data in model")
        case .jsonConversionFailure: return NSLocalizedString("JSON Conversion Failure", comment: "Could not make JSON conversion")
        }
    }
}
