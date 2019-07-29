//
//  CVModel.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import Foundation

struct Curriculum: Decodable {
    let person: Person
    let experience: [ProfesionalExperience]
    let education: [Education]
    let skills: [Skills]
    let languages: [Language]
    let programmingLanguages: [ProgrammingLanguage]
}

struct Person: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
    let country: String
    let city: String
    let mail: String
    let phoneNumber: String
    let summary: String
}

struct ProfesionalExperience: Decodable {
    let name: String
    let role: String
    let startDate: String
    let endDate: String?
}

struct Education: Decodable {
    let name: String
    let degree: String
    let startDate: String
    let endDate: String?
}

struct Skills: Decodable {
    let name: String
}

struct Language: Decodable {
    let name: String
    let level: String
}

struct ProgrammingLanguage: Decodable {
    let name: String
    let duration: String
}
