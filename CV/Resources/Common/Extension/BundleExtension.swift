//
//  BundleExtension.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/19/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

enum KeyError: Error {
    case unknownValue
}

extension Bundle {
    static func getInfoPlistValue(for property: String) throws -> String {
        guard let value = Bundle.main.infoDictionary?[property] as? String else {
            throw KeyError.unknownValue
        }
        return value
    }
}
