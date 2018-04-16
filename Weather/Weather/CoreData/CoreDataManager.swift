//
//  CoreDataManager.swift
//  Weather
//
//  Created by Dennis Shar on 14/04/2018.
//  Copyright © 2018 Dennis Shar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {


    var persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext?
    var entity: NSEntityDescription?
    
    init(){
        
        persistentContainer = {
            
            let container = NSPersistentContainer(name: "WheatherData")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error {
                    
                    fatalError("Unresolved error \(error)")
                }
            })
            return container
        }()
        
        context = persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "ExternalIpData", in: context!)
        
    }
    
    func addDataToExternalIpEntitie(externalIPObject: ExternalIPObject)->Void{
        
        let newIPdata = NSManagedObject(entity: entity!, insertInto: context)
        newIPdata.setValue(externalIPObject.city, forKey: "city")
        newIPdata.setValue(externalIPObject.country, forKey: "country")
        newIPdata.setValue(externalIPObject.ip, forKey: "ip")
        newIPdata.setValue(externalIPObject.loc, forKey: "loc")
        newIPdata.setValue(externalIPObject.org, forKey: "org")
        newIPdata.setValue(externalIPObject.region, forKey: "region")
        
        do {
            try context?.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func deleteFromExternalIpEntitie()->Void{
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExternalIpData")
        
        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try context?.fetch(fetchRequest) as! [NSManagedObject]
            
            for item in items {
                context?.delete(item)
            }
            
            // Save Changes
            try context?.save()
            
        } catch {
            // Error Handling
            // ...
        }
    }
    
    func getDataFromExternalIpEntitie()->Void{
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ExternalIpData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context?.fetch(request)
            for data in result as! [NSManagedObject] {
                print("city \(data.value(forKey: "city") as! String)")
                print("country \(data.value(forKey: "country") as! String)")
                print("ip \(data.value(forKey: "ip") as! String)")
                print("loc \(data.value(forKey: "loc") as! String)")
                print("org \(data.value(forKey: "org") as! String)")
                print("region \(data.value(forKey: "region") as! String)")
            }
            
        } catch {
            print("Failed")
        }
    }
    
}
