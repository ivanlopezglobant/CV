//
//  InfoContract.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/29/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

protocol InfoViewProtocol: class {
    func showInfo()
}

protocol InfoPresenterProtocol {
    var view: InfoViewProtocol? {get set}
    var router: InfoRouterProtocol? {get set}
    
    //View -> Presenter
    func prepareSubViews()
    func getFullName() -> String?
    func getAge() -> String?
    func getCountry() -> String?
    func getCity() -> String?
    func getMail() -> String?
    func getPhoneNumber() -> String?
    func getSummary() -> String?
}

protocol InfoRouterProtocol {
    
}
