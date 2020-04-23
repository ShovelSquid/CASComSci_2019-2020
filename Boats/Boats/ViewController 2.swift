//
//  ViewController.swift
//  Boats
//
//  Created by Kaelen Cook on 11/8/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var TextLabel: UILabel!
    
    var boat:Boat?
    
    var output = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = boat!.name
        
        output += "Color: \(boat!.color)"
        output += "\n"
        output += "Size: \(boat!.size)"
        output += "\n"
        output += "Dolphin Power: \(boat!.dolphinPower)"
        output += "\n"
        
        TextLabel.text = output

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
