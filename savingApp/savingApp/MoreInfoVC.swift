//
//  MoreInfoVC.swift
//  savingApp
//
//  Created by Kaelen Cook on 1/23/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class MoreInfoVC: UIViewController {
    @IBOutlet weak var Label: UILabel!
    
    var information: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var output:String = ""
        output += "Name: \(information!.name)"
        output += "\n"
        
        output += "Health: \(information!.health)"
        output += "\n"
        
        output += "Class: \(information!.klass)"
        output += "\n"
        
        Label.text! = output
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
