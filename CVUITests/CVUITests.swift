//
//  CVUITests.swift
//  CVUITests
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/24/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import XCTest
@testable import CV

class CVUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testEducationLabelExists() {
        // Given
        let expectation = XCTestExpectation(description: "navigation")
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
        // When
        let educationLabel = app.staticTexts["Education"]
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
        let experienceLabel = app.staticTexts["Experience"]
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
        let skillsLabel = app.staticTexts["Skills"]
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
        let languagesLabel = app.staticTexts["Languages"]
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
        let programmingLanguagesLabel = app.staticTexts["Programming Languages"]
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
