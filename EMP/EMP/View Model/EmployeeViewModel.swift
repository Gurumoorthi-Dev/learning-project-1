//
//  EmployeeViewModel.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//

import Foundation

class EmployeeViewModel: NSObject {
    private var employee: Emp!
    init(model: Emp) {
        employee = model
    }
    
    var id : Int {
        return Int(employee.id)
    }
    
    var name: String {
        return employee.name ?? ""
    }
    
    var username: String {
        return employee.username ?? ""
    }
    
    var email: String {
        return employee.email ?? ""
    }
    
    var profileImage: String {
        return employee.profileImage ?? ""
    }
    
    var phone: String {
        return employee.phone ?? ""
    }
    
    var website: String {
        return employee.website ?? ""
    }
    
    var street: String {
        return employee.street ?? ""
    }
    
    var suite: String {
        return employee.suite ?? ""
    }
    
    var city: String {
        return employee.city ?? ""
    }
    
    var zipcode: String {
        return employee.zipcode ?? ""
    }
    
    var companyName: String {
        return employee.companyName ?? ""
    }
    
    var catchPhrase: String {
        return employee.catchPhrase ?? ""
    }
    var bs: String {
        return employee.bs ?? ""
    }
    
    var lat: String {
        return employee.lat ?? ""
    }
    
    var long: String {
        return employee.long ?? ""
    }
    
}
