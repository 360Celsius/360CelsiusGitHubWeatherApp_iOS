//
//  ViewController.swift
//  Weather
//
//  Created by Dennis Shar on 07/04/2018.
//  Copyright © 2018 Dennis Shar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responceView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let requests:HttpRequests = HttpRequests()
        
        
//        requests.runHttpRequestCurrentWeatherData(cityName: "rehovot",tempUnits: "metric"){
//            (result: String) in
//            DispatchQueue.main.async {
//                self.responceView.text = result
//            }
//            
//            //print(result)
//        }
        
        
        
        requests.runHttpRequestGetExternalIp(){
            (result: String) in
            DispatchQueue.main.async {
                self.responceView.text = result
            }
            
            //print(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

