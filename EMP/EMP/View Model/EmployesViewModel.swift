//
//  EmployesViewModel.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//

import Foundation

private(set) var employesViewModel = EmployesViewModel.shared
private(set) var employesViewModelList = employesViewModel.employesViewModelList

class EmployesViewModel {
    
    var employesViewModelList = [EmployeeViewModel]() {
        didSet {
            EMP.employesViewModelList = self.employesViewModelList
        }
    }
    
    fileprivate static let shared: EmployesViewModel = {
        let employesViewModel = EmployesViewModel()
        
        return employesViewModel
    }()
    
    private var employeesViewModelDictionary = [String : EmployeeViewModel]()
    
    private init() {
        let employes = sharedDataManager.fetchAllEmployess()
        employesViewModelList = employes.map({ (employee) -> EmployeeViewModel in
            let employeeViewModel = EmployeeViewModel.init(model: employee)
            employeesViewModelDictionary[employeeViewModel.name] = employeeViewModel
            return employeeViewModel
        })
    }
    
    func updateDataFromURL(employes: [Emp]) -> [EmployeeViewModel] {
        employesViewModelList = employes.map({ (employee) -> EmployeeViewModel in
            let employeeViewModel = EmployeeViewModel.init(model: employee)
            employeesViewModelDictionary[employeeViewModel.name] = employeeViewModel
            return employeeViewModel
        })
        return employesViewModelList
    }
}
