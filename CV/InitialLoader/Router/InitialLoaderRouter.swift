//
//  InitialLoaderRouter.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/19/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class InitialLoaderRouter: InitialLoaderRouterProtocol {
    
    func pushTo(cv: Curriculum, from view: UIViewController) {
        let storyboard = UIStoryboard(name: AppConstants.curriculum, bundle: nil)
        let curriculumViewController = storyboard.instantiateInitialViewController() as! CurriculumViewController
        CurriculumRouter.createCurriculumModule(ref: curriculumViewController, curriculum: cv)
        view.navigationController?.pushViewController(curriculumViewController, animated: true)
    }
    
    static func createInitialLoaderModule(ref: InitialLoaderViewController) {
        var presenter: InitialLoaderPresenterProtocol & InitialLoaderOutputInteractorProtocol = InitialLoaderPresenter()
        let router = InitialLoaderRouter()
        let interactor = InitialLoaderInteractor()
        
        presenter.router = router
        presenter.view = ref
        presenter.interactor = interactor
        interactor.presenter = presenter
        ref.presenter = presenter
    }
}
