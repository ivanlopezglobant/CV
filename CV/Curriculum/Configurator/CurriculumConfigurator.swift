//
//  CurriculumConfigurator.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/30/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class CurriculumConfigurator {
    
    func createCurriculumModule(curriculum: Curriculum) -> CurriculumViewController {
        let storyboard = UIStoryboard(name: AppConstants.curriculum, bundle: nil)
        let view = storyboard.instantiateInitialViewController() as! CurriculumViewController
        let presenter = CurriculumPresenter()
        let router = CurriculumRouter()
        
        presenter.cv = curriculum
        presenter.view = view
        presenter.router = router
        view.presenter = presenter
        
        return view
    }
}
