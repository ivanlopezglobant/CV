//
//  InfoConfigurator.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/30/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class InfoConfigurator {
    func createInfoModule(person: Person) -> InfoViewController {
        
        let storyboard = UIStoryboard(name: "Info", bundle: nil)
        let view = storyboard.instantiateInitialViewController() as! InfoViewController
        let presenter = InfoPresenter()
        let router = InfoRouter()
        presenter.router = router
        presenter.view = view
        presenter.person = person
        view.presenter = presenter
        
        return view
    }
}
