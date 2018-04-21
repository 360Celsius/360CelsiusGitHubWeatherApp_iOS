//
//  SixTeenViewController.swift
//  Weather
//
//  Created by Dennis Shar on 20/04/2018.
//  Copyright © 2018 Dennis Shar. All rights reserved.
//

import Foundation
import UIKit

class SixTeenViewController: UIViewController {
    
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        text.text = "16 Days"
    }
}
