//
//  InfoPresenterTest.swift
//  CVTests
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/30/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import XCTest
@testable import CV

class InfoPresenterTest: XCTestCase {

    var presenter: InfoPresenter!
    var person: Person!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        person = Person(firstName: "Ivan", lastName: "Lopez", age: 26, country: "Mexico", city: "Toluca", mail: "ivan.lopez@globant.com", phoneNumber: "7222641896", summary: "Nice guy")
        presenter = InfoPresenter()
    }
    
    func testGetFullName() {
        // Given
        presenter.person = person
        // When
        let fullName = presenter.getFullName()
        // Then
        XCTAssertEqual(fullName, "\(person.firstName) \(person.lastName)")
    }
    
    func testGetAge() {
        // Given
        presenter.person = person
        // When
        let age = presenter.getAge()
        // Then
        XCTAssertEqual(age, "\(person.age) \(AppConstants.years)")
    }
    
    func testGetCountry() {
        // Given
        presenter.person = person
        // When
        let country = presenter.getCountry()
        // Then
        XCTAssertEqual(country, person.country)
    }
    
    func testGetCity() {
        // Given
        presenter.person = person
        // When
        let city = presenter.getCity()
        // Then
        XCTAssertEqual(city, person.city)
    }
    
    func testGetMail() {
        // Given
        presenter.person = person
        // When
        let mail = presenter.getMail()
        // Then
        XCTAssertEqual(mail, person.mail)
    }
    
    func testGetPhoneNumber() {
        // Given
        presenter.person = person
        // When
        let phoneNumber = presenter.getPhoneNumber()
        // Then
        XCTAssertEqual(phoneNumber, person.phoneNumber)
    }
    
    func testGetSummary() {
        // Given
        presenter.person = person
        // When
        let summary = presenter.getSummary()
        // Then
        XCTAssertEqual(summary, person.summary)
    }

}
