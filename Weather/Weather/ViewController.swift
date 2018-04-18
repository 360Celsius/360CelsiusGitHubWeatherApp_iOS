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

    @IBOutlet weak var responceView: UILabel!
    var requests: HttpRequests?
    var coreDataManager:CoreDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requests = HttpRequests()
        coreDataManager = CoreDataManager()
        
        
        requests?.runHttpRequestGetExternalIp(){ (resultGetExternalIp: ExternalIPObject) in
            
            self.coreDataManager?.deleteFromExternalIpEntitie()
            self.coreDataManager?.addDataToExternalIpEntitie(externalIPObject: resultGetExternalIp)
            
            var externalIPfromCoreData: String?
            externalIPfromCoreData = self.coreDataManager?.getDataFromExternalIpEntitie()[0].ip
            
            self.requests?.runHttpRequestGetCityNameByIp(externalIP: externalIPfromCoreData!){ (resultGetCityNameByIp: CityByIPObject) in
                
                self.coreDataManager?.deleteFromCityByExternalIpEntitie()
                self.coreDataManager?.addDataToCityByExternalIpEntitie(cityByExternalIpObject: resultGetCityNameByIp)
                
                var cityNamefromCoreData: String?
                cityNamefromCoreData = self.coreDataManager?.getDataFromFromCityByExternalIpEntitie()[0].city
                
                print(cityNamefromCoreData!)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

