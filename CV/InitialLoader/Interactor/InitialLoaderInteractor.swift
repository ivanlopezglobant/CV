//
//  InitialLoaderInteractor.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/19/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

class InitialLoaderInteractor: InitialLoaderInputInteractorProtocol {
    
    weak var presenter: InitialLoaderOutputInteractorProtocol?
    
    func getCurriculum() {
        let repository = Respository<Curriculum>()
        
        repository.getData(from: .resume) { result in
            self.presenter?.curriculumDidFetch(response: result)
        }
    }
}
