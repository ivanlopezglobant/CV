//
//  BaseRepository.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

class Respository<T> : Network where T:Decodable {
    var session: URLSession
    var data: T?
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
    
    func getData(from feedType: CurriculumFeed, completion: @escaping (Result<T?, APIError>) -> Void) {
        
        if data != nil {
            completion(.success(data))
        } else {
            fetch(with: feedType.request, decode: {[weak self] (json) -> T? in
                guard let curriculumData = json as? T else {return nil}
                self?.data = curriculumData
                return self?.data
                }, completion: completion)
        }
    }
}
