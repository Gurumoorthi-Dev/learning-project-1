//
//  CoreDataManager.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//

import Foundation
import CoreData

let sharedDataManager = CoreDataManager.shared

class CoreDataManager {
    
    fileprivate static let shared: CoreDataManager = {
        return CoreDataManager()
    }()
    
    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EMP")
        
        container.loadPersistentStores { storeDesription, error in
            precondition(error == nil, "Error: \(error!)\nCould not load PersistentStore ")
        }
        
        // Merge the changes from other contexts automatically.
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    /**
     A main context of the Core Data stack.
     */
    private lazy var mainContext: NSManagedObjectContext = {
        let mainContext = persistentContainer.viewContext
        mainContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return mainContext
    }()
    
    // MARK: - Create Recorder
    
    func createNewEmployeee(employeeData: EmployeeElemnet) -> Emp {
        let employee = Emp.init(context: mainContext)
        
        mainContext.performAndWait {
            employee.id = Int32(employeeData.id)
            employee.email = employeeData.email
            employee.phone = employeeData.phone
            employee.website = employeeData.website
            employee.name = employeeData.name
            employee.companyName = employeeData.company?.name
            employee.profileImage = employeeData.profileImage
            employee.catchPhrase = employeeData.company?.catchPhrase
            employee.bs = employeeData.company?.bs
            employee.lat = employeeData.address.geo.lat
            employee.long = employeeData.address.geo.lng
            employee.street = employeeData.address.street
            employee.city = employeeData.address.city
            employee.zipcode = employeeData.address.zipcode
            employee.suite = employeeData.address.suite
            
            mainContext.insert(employee)
            save()
        }
        
        return employee
    }
    
    // MARK: - Read Recorder
    
    func fetchAllEmployess() -> [Emp] {
        var employess = [Emp]()
        mainContext.performAndWait {
            let fetchRequest: NSFetchRequest<Emp> = Emp.fetchRequest()
            do {
                employess = try mainContext.fetch(fetchRequest)
            } catch {
                print(error)
            }
        }
        
        if employess.count == 0 {
            WebService.getData { success, data in
                if success {
                    employess = self.updateDate(employess: data)
                }
            }
        }
        
        return employess
    }
    
    func updateDate(employess: Employess) -> [Emp] {
        var employesData : [Emp] = []
        for employee in employess {
            employesData.append(createNewEmployeee(employeeData: employee))
        }
        return employesData
    }
    
    // MARK: - Update Employee
    
    func save() {
        mainContext.performAndWait {
            if mainContext.hasChanges {
                do {
                    try mainContext.save()
                } catch {
                    print("Error: \(error)\nCould not save Core Data context.")
                    return
                }
                // Reset the mainContext to free the cache and lower the memory footLogger.log.
                // mainContext.reset()
            }
        }
    }

}
