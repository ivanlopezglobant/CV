//
//  CurriculumRouter.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/22/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class CurriculumRouter: CurriculumRouterProtocol {
    class func createCurriculumModule(ref: CurriculumViewController, curriculum: Curriculum) {
        let presenter = CurriculumPresenter()
        let router = CurriculumRouter()
        
        presenter.cv = curriculum
        presenter.view = ref
        presenter.router = router
        ref.presenter = presenter
    }
    
    func pushInfoView(from view: UIViewController, with person: Person) {
        let storyboard = UIStoryboard(name: "Info", bundle: nil)
        let infoVC = storyboard.instantiateInitialViewController() as! InfoViewController
        InfoRouter.createInfoModule(ref: infoVC, person: person)
        
        view.navigationController?.pushViewController(infoVC, animated: true)
    }
}
