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

    // singelton
    static let coreDataManagerInstance = CoreDataManager()
    
    var persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext?
    
    private init() {
        
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
        
    }
    
    
    ///////////////////////// ecternal ip //////////////////////////////////////
    func addDataToExternalIpEntitie(externalIPObject: ExternalIPObject)->Void{
        let entity = NSEntityDescription.entity(forEntityName: "ExternalIpData", in: context!)!
        let newIPdata = NSManagedObject(entity: entity, insertInto: context)
        
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
    
    func getDataFromExternalIpEntitie()->[ExternalIPObject]{
        
        var externalIPObjects: [ExternalIPObject] = []
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ExternalIpData")
        request.returnsObjectsAsFaults = false
    
        do {
            let result = try context?.fetch(request)
            for data in result as! [NSManagedObject] {
                
                let externalIPObject: ExternalIPObject = ExternalIPObject()
                
                externalIPObject.city = data.value(forKey: "city") as? String
                externalIPObject.country = data.value(forKey: "country") as? String
                externalIPObject.ip = data.value(forKey: "ip") as? String
                externalIPObject.loc = data.value(forKey: "loc") as? String
                externalIPObject.org = data.value(forKey: "org") as? String
                externalIPObject.region = data.value(forKey: "region") as? String
                
                externalIPObjects.append(externalIPObject)
                
            }
            
            
            
        } catch {
            print("Failed")
        }
        
        return externalIPObjects
    }
    
    /////////////////////// City by external IP //////////////////////////////
    func addDataToCityByExternalIpEntitie(cityByExternalIpObject: CityByIPObject)->Void{
        let entity = NSEntityDescription.entity(forEntityName: "CityByExternalIpData", in: context!)!
        let newIPdata = NSManagedObject(entity: entity, insertInto: context)
        
        newIPdata.setValue(cityByExternalIpObject.ip, forKey: "ip")
        newIPdata.setValue(cityByExternalIpObject.city, forKey: "city")
        newIPdata.setValue(cityByExternalIpObject.region, forKey: "region")
        newIPdata.setValue(cityByExternalIpObject.region_code, forKey: "region_code")
        newIPdata.setValue(cityByExternalIpObject.country, forKey: "country")
        newIPdata.setValue(cityByExternalIpObject.country_name, forKey: "country_name")
        newIPdata.setValue(cityByExternalIpObject.continent_code, forKey: "continent_code")
        newIPdata.setValue(cityByExternalIpObject.postal, forKey: "postal")
        newIPdata.setValue(cityByExternalIpObject.latitude, forKey: "latitude")
        newIPdata.setValue(cityByExternalIpObject.longitude, forKey: "longitude")
        newIPdata.setValue(cityByExternalIpObject.timezone, forKey: "timezone")
        newIPdata.setValue(cityByExternalIpObject.utc_offset, forKey: "utc_offset")
        newIPdata.setValue(cityByExternalIpObject.country_calling_code, forKey: "country_calling_code")
        newIPdata.setValue(cityByExternalIpObject.currency, forKey: "currency")
        newIPdata.setValue(cityByExternalIpObject.languages, forKey: "languages")
        newIPdata.setValue(cityByExternalIpObject.asn, forKey: "asn")
        newIPdata.setValue(cityByExternalIpObject.org, forKey: "org")
        
        do {
            try context?.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func deleteFromCityByExternalIpEntitie()->Void{
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CityByExternalIpData")
        
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
    
    func getDataFromFromCityByExternalIpEntitie()->[CityByIPObject]{
        
        var cityByExternalIPObjects: [CityByIPObject] = []
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CityByExternalIpData")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context?.fetch(request)
            for data in result as! [NSManagedObject] {
                
                let cityByExternalIPObject: CityByIPObject = CityByIPObject()
                
                cityByExternalIPObject.ip = data.value(forKey: "ip") as? String
                cityByExternalIPObject.city = data.value(forKey: "city") as? String
                cityByExternalIPObject.region = data.value(forKey: "region") as? String
                cityByExternalIPObject.region_code = data.value(forKey: "region_code") as? String
                cityByExternalIPObject.country = data.value(forKey: "country") as? String
                cityByExternalIPObject.country_name = data.value(forKey: "country_name") as? String
                cityByExternalIPObject.continent_code = data.value(forKey: "continent_code") as? String
                cityByExternalIPObject.postal = data.value(forKey: "postal") as? String
                cityByExternalIPObject.latitude = data.value(forKey: "latitude") as? Double
                cityByExternalIPObject.longitude = data.value(forKey: "longitude") as? Double
                cityByExternalIPObject.timezone = data.value(forKey: "timezone") as? String
                cityByExternalIPObject.utc_offset = data.value(forKey: "utc_offset") as? String
                cityByExternalIPObject.country_calling_code = data.value(forKey: "country_calling_code") as? String
                cityByExternalIPObject.currency = data.value(forKey: "currency") as? String
                cityByExternalIPObject.languages = data.value(forKey: "languages") as? String
                cityByExternalIPObject.asn = data.value(forKey: "asn") as? String
                cityByExternalIPObject.org = data.value(forKey: "org") as? String
                
                cityByExternalIPObjects.append(cityByExternalIPObject)
                
            }
            
            
            
        } catch {
            print("Failed")
        }
        
        return cityByExternalIPObjects
    }
    
    ///////////////////////////////////////////////////////////////////////////////////
}
