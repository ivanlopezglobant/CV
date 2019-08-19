//
//  Endpoint.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

/// Protocol to create EndPoints
protocol Endpoint {
    var base: String { get }
    var path: String? { get }
}
extension Endpoint {

    private var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        if path != nil {
            components.path = path!
        }
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
