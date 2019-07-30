//
//  InfoPresenter.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/29/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class InfoPresenter: InfoPresenterProtocol {
    weak var view: InfoViewProtocol?
    var router: InfoRouterProtocol?
    var person: Person?
    
    func prepareSubViews() {
        view?.showInfo()
    }
    
    func getFullName() -> String? {
        guard let person = person else {return nil}
        return "\(person.firstName) \(person.lastName)"
    }
    
    func getAge() -> String? {
        guard let person = person else {return nil}
        return "\(person.age) \(AppConstants.years)"
    }
    
    func getCountry() -> String? {
        guard let person = person else {return nil}
        return person.country
    }
    
    func getCity() -> String? {
        guard let person = person else {return nil}
        return person.city
    }
    
    func getMail() -> String? {
        guard let person = person else {return nil}
        return person.mail
    }
    
    func getPhoneNumber() -> String? {
        guard let person = person else {return nil}
        return person.phoneNumber
    }
    
    func getSummary() -> String? {
        guard let person = person else {return nil}
        return person.summary
    }
}
