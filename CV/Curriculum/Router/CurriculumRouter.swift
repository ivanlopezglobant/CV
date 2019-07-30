//
//  CurriculumRouter.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/22/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class CurriculumRouter: CurriculumRouterProtocol {
    func pushInfoView(from view: UIViewController, with person: Person) {
        let infoView = InfoConfigurator().createInfoModule(person: person)
        view.navigationController?.pushViewController(infoView, animated: true)
    }
}
