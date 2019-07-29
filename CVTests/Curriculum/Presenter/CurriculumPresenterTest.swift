//
//  CurriculumPresenterTest.swift
//  CVTests
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/23/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import XCTest
@testable import CV

class CurriculumPresenterTest: XCTestCase {
    
    var presenter: CurriculumPresenter!
    var curriculum: Curriculum!
    var experience: [ProfesionalExperience]!
    var education: [Education]!
    var skills: [Skills]!
    var languages: [Language]!
    var programmingLanguages: [ProgrammingLanguage]!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let exp1 = ProfesionalExperience(name: "Softtek", role: "iOS Developer", startDate: "05/2018", endDate: "02/2019")
        let exp2 = ProfesionalExperience(name: "Broxel Fintech", role: "iOS Developer", startDate: "04/2017", endDate: "05/2018")
        let exp3 = ProfesionalExperience(name: "Nieu Technologies", role: "iOS Developer", startDate: "06/2017", endDate: "05/2018")
        experience = [exp1,exp2,exp3]
        
        let edu1 = Education(name: "Institute of Technology and Higher Education of Monterrey", degree: "Computer Systems Engineer", startDate: "07/2012", endDate: "05/2017")
        education = [edu1]
        
        let skill1 = Skills(name: "Team player")
        let skill2 = Skills(name: "Fast learner")
        let skill3 = Skills(name: "Commited")
        let skill4 = Skills(name: "Hard worker")
        let skill5 = Skills(name: "Listener")
        skills = [skill1,skill2,skill3,skill4,skill5]
        
        let language1 = Language(name: "Spanish", level: "native")
        let language2 = Language(name: "English", level: "intermediate")
        languages = [language1,language2]
        
        let programmingLanguage1 = ProgrammingLanguage(name: "Swift", duration: "2 years")
        let programmingLanguage2 = ProgrammingLanguage(name: "Java", duration: "1 year")
        let programmingLanguage3 = ProgrammingLanguage(name: "C++", duration: "1 year")
        programmingLanguages = [programmingLanguage1, programmingLanguage2, programmingLanguage3]
        
        let person = Person(firstName: "Ivan", lastName: "Lopez", age: 26, country: "Mexico", city: "Toluca", mail: "ivan.lopez@globant.com", phoneNumber: "7222641896", summary: "Nice guy")
        
        presenter = CurriculumPresenter()
        
        curriculum = Curriculum(person: person, experience: experience, education: education, skills: skills, languages: languages, programmingLanguages: programmingLanguages)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testNumberOfRowsInEducationSection() {
        //Given
        presenter.cv = curriculum
        //When
        let rows = presenter.getNumberOfRows(in: 0)
        //Then
        XCTAssertEqual(rows, curriculum.education.count)
    }
    
    func testNumberOfRowsInExperienceSection() {
        //Given
        presenter.cv = curriculum
        //When
        let rows = presenter.getNumberOfRows(in: 1)
        //Then
        XCTAssertEqual(rows, curriculum.experience.count)
    }
    
    func testNumberOfRowsInSkillsSection() {
        //Given
        presenter.cv = curriculum
        //When
        let rows = presenter.getNumberOfRows(in: 2)
        //Then
        XCTAssertEqual(rows, curriculum.skills.count)
    }
    
    func testNumberOfRowsInLanguagesSection() {
        //Given
        presenter.cv = curriculum
        //When
        let rows = presenter.getNumberOfRows(in: 3)
        //Then
        XCTAssertEqual(rows, curriculum.languages.count)
    }
    
    func testNumberOfRowsInProgrammingLanguagesSection() {
        //Given
        presenter.cv = curriculum
        //When
        let rows = presenter.getNumberOfRows(in: 4)
        //Then
        XCTAssertEqual(rows, curriculum.programmingLanguages.count)
    }
    
    func testNumberOfSections() {
        //Given
        presenter.cv = curriculum
        //When
        let sections = presenter.getNumberOfSections()
        //Then
        XCTAssertEqual(sections, 5)
    }
    
    func testGetEducationSectionType() {
        //Given
        presenter.cv = curriculum
        //When
        let section = presenter.getSectionType(at: 0)
        //Then
        XCTAssertEqual(section, CVSections.education)
    }
    
    func testGetExperienceSectionType() {
        //Given
        presenter.cv = curriculum
        //When
        let section = presenter.getSectionType(at: 1)
        //Then
        XCTAssertEqual(section, CVSections.experience)
    }
    
    func testGetSkillsSectionType() {
        //Given
        presenter.cv = curriculum
        //When
        let section = presenter.getSectionType(at: 2)
        //Then
        XCTAssertEqual(section, CVSections.skill)
    }
    
    func testGetLanguageSectionType() {
        //Given
        presenter.cv = curriculum
        //When
        let section = presenter.getSectionType(at: 3)
        //Then
        XCTAssertEqual(section, CVSections.language)
    }
    
    func testGetProgrammingLanguageSectionType() {
        //Given
        presenter.cv = curriculum
        //When
        let section = presenter.getSectionType(at: 4)
        //Then
        XCTAssertEqual(section, CVSections.programmingLanguage)
    }
}
