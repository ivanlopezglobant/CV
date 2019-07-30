//
//  InitialLoaderPresenter.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/19/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

final class InitialLoaderPresenter: InitialLoaderPresenterProtocol {
    
    var interactor: InitialLoaderInputInteractorProtocol?
    var view: InitialLoaderViewProtocol?
    var router: InitialLoaderRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getCurriculum()
    }
    
    func showCurriculum(with cv: Curriculum, from view: UIViewController) {
        router?.pushTo(cv: cv, from: view)
    }
}

extension InitialLoaderPresenter: InitialLoaderOutputInteractorProtocol {
    func curriculumDidFetch(response: (Result<Curriculum?, APIError>)) {
        switch response {
        case .success(let data):
            guard let cv = data else {return}
            view?.update(status: .successfullyFinish, cv: cv, error: nil)
        case .failure(let error):
            view?.update(status: .failureFinish, cv: nil, error: error.localizedDescription)
        }
        
    }
}
