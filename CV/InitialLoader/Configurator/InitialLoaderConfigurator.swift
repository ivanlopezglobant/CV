//
//  InitialLoaderConfigurator.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/30/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class InitialLoaderConfigurator {
    
    func createInitialLoaderModule() -> UINavigationController {
        let view = InitialLoaderViewController()
        var presenter: InitialLoaderPresenterProtocol & InitialLoaderOutputInteractorProtocol = InitialLoaderPresenter()
        let router = InitialLoaderRouter()
        let interactor = InitialLoaderInteractor()
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        
        return UINavigationController(rootViewController: view)
    }
}
