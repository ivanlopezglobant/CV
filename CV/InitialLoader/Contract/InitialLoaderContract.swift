//
//  InitialLoaderContract.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit



protocol InitialLoaderViewProtocol {
    // PRESENTER -> VIEW
    func update(status: StatusType, cv: Curriculum?, error: String?)
}

protocol InitialLoaderPresenterProtocol {
    
    var interactor: InitialLoaderInputInteractorProtocol? {get set}
    var view: InitialLoaderViewProtocol? {get set}
    var router: InitialLoaderRouterProtocol? {get set}
    
    //View -> Presenter
    func prepareSubViews()
    func showCurriculum(with cv: Curriculum, from view: UIViewController)
}

protocol InitialLoaderInputInteractorProtocol: class {
    var presenter: InitialLoaderOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getCurriculum()
}

protocol InitialLoaderOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func curriculumDidFetch(response: (Result<Curriculum?, APIError>))
}

protocol InitialLoaderRouterProtocol {
    //Presenter -> Wireframe
    func pushTo(cv: Curriculum, from view: UIViewController)
}
