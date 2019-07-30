//
//  Constants.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/19/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

enum AppConstants {
    static let mainStoryboard = "Main"
    static let curriculum = "Curriculum"
    static let initialLoaderViewController = "InitialLoaderViewController"
    static let current = "Current"
    static let tryAgain = NSLocalizedString("Try again", comment: "Try do something again")
    static let years = NSLocalizedString("years", comment: "Years old of a person")
    enum Color {
        static let main = #colorLiteral(red: 0.0227721706, green: 0.3414700627, blue: 0.3582882881, alpha: 1)
        static let secondary = #colorLiteral(red: 0.3996318579, green: 0.6436505914, blue: 0.6731247306, alpha: 1)
        static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let defaultBackground = #colorLiteral(red: 0.921494782, green: 0.9216086268, blue: 0.9214690328, alpha: 1)
    }
}

enum KeyNetwork {
    static let baseURL = try! Bundle.getInfoPlistValue(for: "BASE_URL")
    static let pathURL = try! Bundle.getInfoPlistValue(for: "PATH_URL")
}

enum StatusType {
    case initial
    case successfullyFinish
    case failureFinish
    
    var description: String {
        switch self {
        case .initial: return NSLocalizedString("Start Downloading Data", comment: "Start downloading data")
        case .successfullyFinish: return NSLocalizedString("Successful Download", comment: "Did Recive data")
        case .failureFinish: return NSLocalizedString("Download Failed", comment: "Did not Recieve data")
        }
    }
}

enum CVSections {
    case education
    case experience
    case language
    case programmingLanguage
    case skill
    
    var description: String {
        switch self {
        case .education: return NSLocalizedString("Education", comment: "Scolar education")
        case .experience: return NSLocalizedString("Experience", comment: "Professional Experience")
        case .skill: return NSLocalizedString("Skills", comment: "Personal Skills")
        case .language: return NSLocalizedString("Language", comment: "Known Languages")
        case .programmingLanguage: return NSLocalizedString("Programming Language", comment: "Technical Languages for programming")
        }
    }
    
    var cell: String {
        switch self {
        case .experience, .education:
            return "subtitleCell"
        case .language, .programmingLanguage:
            return "detailCell"
        case .skill:
            return "skillCell"
        }
    }
}

enum AccessibilityIdentifier: String {
    case profileImage
    case profileNameLabel
    case profileContact
}
