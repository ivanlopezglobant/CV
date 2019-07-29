//
//  CurriculumRepository.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

enum CurriculumFeed {
    case resume
}
extension CurriculumFeed: Endpoint {
    
    var base: String {
        return KeyNetwork.baseURL
    }
    
    var path: String {
        switch self {
        case .resume: return KeyNetwork.pathURL
        }
    }
}

class CurriculumRepository: Respository<Curriculum> {
    
    static let shared = CurriculumRepository()
    
    private init() {
        super.init()
    }
}
