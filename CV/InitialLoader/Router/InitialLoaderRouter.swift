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
        let curriculumView = CurriculumConfigurator().createCurriculumModule(curriculum: cv)
        view.navigationController?.pushViewController(curriculumView, animated: true)
    }
}
