//
//  CVUITests.swift
//  CVUITests
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/24/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import XCTest

class CVUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    var currentLanguage: (langCode: String, localeCode: String)? {
        let currentLocale = Locale(identifier: Locale.preferredLanguages.first!)
        guard let langCode = currentLocale.languageCode else {
            return nil
        }
        var localeCode = langCode
        if let scriptCode = currentLocale.scriptCode {
            localeCode = "\(langCode)-\(scriptCode)"
        } else if let regionCode = currentLocale.regionCode {
            localeCode = "\(langCode)-\(regionCode)"
        }
        return (langCode, localeCode)
    }
    
    func localizedString(_ key: String) -> String {
        let testBundle = Bundle(for: CVUITests.self)
        if let currentLanguage = currentLanguage,
            let testBundlePath = testBundle.path(forResource: currentLanguage.localeCode, ofType: "lproj") ?? testBundle.path(forResource: currentLanguage.langCode, ofType: "lproj"),
            let localizedBundle = Bundle(path: testBundlePath)
        {
            return NSLocalizedString(key, bundle: localizedBundle, comment: "")
        }
        return "?"
    }

    func testEducationLabelExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        let educationLabel = app.staticTexts[localizedString("Education")]
        // Then
        XCTAssertTrue(educationLabel.exists)
    }
    
    func testExperienceLabelExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        let experienceLabel = app.staticTexts[localizedString("Experience")]
        // Then
        XCTAssertTrue(experienceLabel.exists)
    }
    
    func testSkillLabelExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        app.swipeUp()
        let skillsLabel = app.staticTexts[localizedString("Skills")]
        // Then
        XCTAssertTrue(skillsLabel.exists)
    }
    
    func testLanguagesLabelExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        app.swipeUp()
        let languagesLabel = app.staticTexts[localizedString("Language")]
        // Then
        XCTAssertTrue(languagesLabel.exists)
    }
    
    func testProgrammingLanguagesLabelExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        app.swipeUp()
        let programmingLanguagesLabel = app.staticTexts[localizedString("Programming Language")]
        // Then
        XCTAssertTrue(programmingLanguagesLabel.exists)
    }
    
    func testProfileImageExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        let profileImage = app.images["profileImage"]
        // Then
        XCTAssertTrue(profileImage.exists)
    }
    
    func testProfileNameLabelExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        let profileNameLabel = app.staticTexts["profileNameLabel"]
        // Then
        XCTAssertTrue(profileNameLabel.exists)
    }
    
    func testProfileContactExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        let profileContact = app.staticTexts["profileContact"]
        // Then
        XCTAssertTrue(profileContact.exists)
    }
}
