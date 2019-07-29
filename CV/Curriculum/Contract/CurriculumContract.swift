//
//  CurriculumContract.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/22/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

protocol CurriculumViewProtocol {
    // PRESENTER -> VIEW
    func showCV(with cv: Curriculum)
}

protocol CurriculumPresenterProtocol {

    var view: CurriculumViewProtocol? {get set}
    var router: CurriculumRouterProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    
    func getNumberOfSections() -> Int
    func getTitleSection(at index: Int) -> String
    func getSectionType(at index: Int) -> CVSections
    func getNumberOfRows(in section: Int) -> Int
    func getDataCell(at indexPath: IndexPath) -> Decodable
    func getPerson() -> Person?
    
    func navigateToInfoView(from view: UIViewController, with person: Person)
}

protocol CurriculumRouterProtocol: AnyObject {
    static func createCurriculumModule(ref: CurriculumViewController, curriculum: Curriculum)
    
    func pushInfoView(from view: UIViewController, with person: Person)
}
