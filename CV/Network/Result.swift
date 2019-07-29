//
//  Result.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

/// Result Enum which is the response of fetch method
///
/// - success: (T: Decodable)
/// - failure: (U: Error)
enum Result<T,U> where T:Decodable, U: Error{
    case success(T)
    case failure(U)
}
