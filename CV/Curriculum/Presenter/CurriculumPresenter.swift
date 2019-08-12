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
    
    func getCV() -> String? {
        var mycv = [String]()
        
        guard let cv = cv else {return nil}
        mycv.append("\(cv.person.firstName) \(cv.person.lastName)'s \(AppConstants.curriculum)")
        mycv.append("\n\(AppConstants.personalInformation):")
        mycv.append("\(cv.person.firstName) \(cv.person.lastName)")
        mycv.append("\(cv.person.city) - \(cv.person.country)")
        mycv.append(cv.person.mail)
        mycv.append(cv.person.phoneNumber)
        
        mycv.append("\n\(CVSections.education.description):")
        for education in cv.education {
            mycv.append(education.name)
            mycv.append(education.degree)
            let endDate = education.endDate ?? "\(AppConstants.current)"
            mycv.append("\(education.startDate) - \(endDate)\n")
        }
        
        mycv.append("\n\(CVSections.experience.description):")
        for experience in cv.experience {
            mycv.append(experience.name)
            mycv.append(experience.role)
            let endDate = experience.endDate ?? "\(AppConstants.current)"
            mycv.append("\(experience.startDate) - \(endDate)\n")
        }
        
        mycv.append("\n\(CVSections.skill.description):")
        for skill in cv.skills {
            mycv.append(skill.name)
        }
        
        mycv.append("\n\(CVSections.language.description):")
        for language in cv.languages {
            mycv.append("\(language.name) - \(language.level)")
        }
        
        mycv.append("\n\(CVSections.programmingLanguage.description):")
        for language in cv.programmingLanguages {
            mycv.append("\(language.name) - \(language.duration)")
        }
        
        let result  = mycv.joined(separator: "\n")
        
        return result
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
