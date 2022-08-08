//
//  EmployeeModel.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//

import Foundation

// MARK: - EmployeeElemnet
struct EmployeeElemnet: Codable {
    let id: Int
    let name, username, email: String
    let profileImage: String?
    let address: EmpAddress
    let phone, website: String?
    let company: EmpCompany?

    enum CodingKeys: String, CodingKey {
        case id, name, username, email
        case profileImage = "profile_image"
        case address, phone, website, company
    }
}

// MARK: - EmpAddress
struct EmpAddress: Codable {
    let street, suite, city, zipcode: String
    let geo: EmpGeo
}

// MARK: - EmpGeo
struct EmpGeo: Codable {
    let lat, lng: String
}

// MARK: - EmpCompany
struct EmpCompany: Codable {
    let name, catchPhrase, bs: String
}

typealias Employess = [EmployeeElemnet]
