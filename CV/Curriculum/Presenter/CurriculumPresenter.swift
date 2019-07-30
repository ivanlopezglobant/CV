//
//  CurriculumPresenter.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/22/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class CurriculumPresenter: CurriculumPresenterProtocol {
    var view: CurriculumViewProtocol?
    var router: CurriculumRouterProtocol?
    var cv: Curriculum? {
        didSet {createAvailableSections()}
    }
    var availableSections: [CVSections] = []
    
    func prepareSubViews() {
        view?.showCV(with: cv!)
    }
    
    func getNumberOfSections() -> Int {
        return availableSections.count
    }
    
    func getTitleSection(at index: Int) -> String {
        return availableSections[index].description
    }
    
    func getSectionType(at index: Int) -> CVSections {
        return availableSections[index]
    }
    
    func getDataCell(at indexPath: IndexPath) -> Decodable {
        switch availableSections[indexPath.section] {
        case .education:
            return cv?.education[indexPath.row]
        case .experience:
            return cv?.experience[indexPath.row]
        case .language:
            return cv?.languages[indexPath.row]
        case .programmingLanguage:
            return cv?.programmingLanguages[indexPath.row]
        case .skill:
            return cv?.skills[indexPath.row]
        }
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        let section = availableSections[section]
        switch section {
        case .education:
            return cv?.education.count ?? 0
        case .experience:
            return cv?.experience.count ?? 0
        case .language:
            return cv?.languages.count ?? 0
        case .programmingLanguage:
            return cv?.programmingLanguages.count ?? 0
        case .skill:
            return cv?.skills.count ?? 0
        }
    }
    
    func getPerson() -> Person? {
        return cv?.person
    }
    
    func navigateToInfoView(from view: UIViewController, with person: Person) {
        router?.pushInfoView(from: view, with: person)
    }
    
    private func createAvailableSections() {
        if cv?.education.count ?? 0 > 0 { availableSections.append(.education) }
        if cv?.experience.count ?? 0 > 0 { availableSections.append(.experience) }
        if cv?.skills.count ?? 0 > 0 { availableSections.append(.skill) }
        if cv?.languages.count ?? 0 > 0 { availableSections.append(.language) }
        if cv?.programmingLanguages.count ?? 0 > 0 { availableSections.append(.programmingLanguage) }
    }
}
