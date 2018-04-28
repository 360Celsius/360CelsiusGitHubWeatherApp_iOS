//
//  ViewController.swift
//  Weather
//
//  Created by Dennis Shar on 07/04/2018.
//  Copyright © 2018 Dennis Shar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!


    @IBOutlet weak var responceView: UILabel!
    var requests: HttpRequests?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        requests = HttpRequests()
        
        
        requests?.runHttpRequestGetExternalIp(){ (resultGetExternalIp: ExternalIPObject) in
            
            CoreDataManager.coreDataManagerInstance.deleteFromExternalIpEntitie()
            CoreDataManager.coreDataManagerInstance.addDataToExternalIpEntitie(externalIPObject: resultGetExternalIp)
            
            var externalIPfromCoreData: String?
            externalIPfromCoreData = CoreDataManager.coreDataManagerInstance.getDataFromExternalIpEntitie()[0].ip
            
            self.requests?.runHttpRequestGetCityNameByIp(externalIP: externalIPfromCoreData!){ (resultGetCityNameByIp: CityByIPObject) in
                
                CoreDataManager.coreDataManagerInstance.deleteFromCityByExternalIpEntitie()
                CoreDataManager.coreDataManagerInstance.addDataToCityByExternalIpEntitie(cityByExternalIpObject: resultGetCityNameByIp)
                
                var cityNamefromCoreData: String?
                cityNamefromCoreData = CoreDataManager.coreDataManagerInstance.getDataFromFromCityByExternalIpEntitie()[0].city
                
                print(cityNamefromCoreData!)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

