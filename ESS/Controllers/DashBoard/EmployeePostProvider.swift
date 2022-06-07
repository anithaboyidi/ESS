//
//  EmployeePostProvider.swift
//  ESS
//
//  Created by wido technologies on 01/06/22.
//

import Foundation
import CoreData
import UIKit

class EmployeePostProvider {
    
    private(set) var managedObjectContext: NSManagedObjectContext
    private weak var fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?

    init(with managedObjectContext: NSManagedObjectContext,
         fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?)
    {
        self.managedObjectContext = managedObjectContext
        self.fetchedResultsControllerDelegate = fetchedResultsControllerDelegate
    }

   
    lazy var fetchedResultsController: NSFetchedResultsController<EmployeePosts> = {
        let fetchRequest: NSFetchRequest<EmployeePosts> = EmployeePosts.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(EmployeePosts.postID), ascending: false)]

        let controller = NSFetchedResultsController(
            fetchRequest: fetchRequest, managedObjectContext: managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        controller.delegate = fetchedResultsControllerDelegate

        do {
            try controller.performFetch()
        } catch {
            print("Fetch failed")
        }

        return controller
    }()
}
