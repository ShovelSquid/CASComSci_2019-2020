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
    
    var BoatName:String = ""
    var BoatStuff:[String] = [""]
    
    var output = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = BoatName
        
        output += "Color: \(BoatStuff[0])"
        output += "\n"
        output += "Size: \(BoatStuff[1])"
        output += "\n"
        output += "Dolphin Power: \(BoatStuff[2])"
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
