//
//  InfoRouter.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/29/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class InfoRouter: InfoRouterProtocol {
    
    static func createInfoModule(ref: InfoViewController, person: Person) {
        let presenter = InfoPresenter()
        let router = InfoRouter()
        presenter.router = router
        presenter.view = ref
        presenter.person = person
        ref.presenter = presenter
        
    }
}
