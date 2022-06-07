//
//  EmployeePosts+CoreDataProperties.swift
//  
//
//  Created by wido technologies on 01/06/22.
//
//

import CoreData
import Foundation

public extension EmployeePosts {

    @nonobjc class func fetchRequest() -> NSFetchRequest<EmployeePosts> {
        return NSFetchRequest<EmployeePosts>(entityName: "EmployeePosts")
    }

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var empGmail: String?
    @NSManaged var jobTitleName: String?
    @NSManaged var postID: Int32
  

    internal class func createOrUpdate(item: EmployeeModelItem, with stack: CoreDataProvider) {
        
        let newsItemID = item.empId
        var currentEmpPost: EmployeePosts? // Entity name
        let newsPostFetch: NSFetchRequest<EmployeePosts> = EmployeePosts.fetchRequest()
        
        
        if let newsItemID = newsItemID {
            let newsItemIDPredicate = NSPredicate(format: "%K == %i", #keyPath(EmployeePosts.postID), newsItemID)
            newsPostFetch.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [newsItemIDPredicate])
        }
        do {
            let results = try stack.managedContext.fetch(newsPostFetch)
            if results.isEmpty {
                
                currentEmpPost = EmployeePosts(context: stack.managedContext)
                if let empID = newsItemID {
                    currentEmpPost?.postID = Int32(empID)
                }
            } else {
                
                currentEmpPost = results.first
            }
            currentEmpPost?.update(item: item)
            
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }

    internal func update(item: EmployeeModelItem) {
        // Title
        self.firstName = item.firstName
        // Thumbnail
        self.lastName = item.lastName
        // Date
        self.jobTitleName = item.jobTitleName
        // Source
        self.empGmail = item.empGmail
    
    }
}

extension EmployeePosts: Identifiable {}
