//
//  CoreDataHelper.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import CoreData
import UIKit

class CoreDataHelper {
    
    func fetch<T>(entityName :String) -> [T] {
        var result:[T] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                print("Error : Could not open AppDelegate!")
                return result
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            result = try managedContext.fetch(request) as! [T]
            print("Success fetching data")
        }
        catch {
            print("Error : Failed when trying to fetch data")
        }
        
        return result
    }

          // TODO: Need to finish creating entity
    func save<T>(model: T, entityName: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return print("Error : Could not get AppDelegate file!")
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let dogDatas:[T] = fetch(entityName: entityName)
        let dog = Dog(context: managedContext)
        
        do {
            try managedContext.save()
            print("Success saving data")
        }
        catch {
            print("Error : Saving data")
        }
    }
}
