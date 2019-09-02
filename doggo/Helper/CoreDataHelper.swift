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
    func save(model: DogModel) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return print("Error : Could not get AppDelegate file!")
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let dog = Dog(context: managedContext)
        
        let dogWeight = Weight(context: managedContext)
        
        dog.name = model.name
        dog.birthdate = model.birthDate
        dog.breed = model.breedType
        dog.size = model.breedSize
        dog.gender = model.gender
        
        dogWeight.amount = model.weight.amount
        dogWeight.date = model.weight.date
        dog.addToWeight(dogWeight)
        
        dog.picture = model.picture
        
        do {
            try managedContext.save()
            print("Success saving data")
        }
        catch {
            print("Error : Saving data")
        }
    }
    
    
    func update(entityName : String, searchString: String, updatedWeight: Weight) {
        let result:[Dog] = fetch(entityName: entityName)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return print("Error : Could not get AppDelegate file!")
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let dogWeight = Weight(context: managedContext)
        
        dogWeight.amount = updatedWeight.amount
        dogWeight.date = updatedWeight.date
        
        var isDataFound = false
        for data in result {
            if data.name == searchString {
                let dog = data as Dog
                dog.addToWeight(dogWeight)
                isDataFound = true
                break
            }
        }
        if !isDataFound {
            print("Dog not found")
        }
        else {
            do {
                try managedContext.save()
                print("Success saving data")
            }
            catch {
                print("Error : Saving data")
            }
        }
    }
}
