//
//  DetailsViewController.swift
//  HardCoding
//
//  Created by Kaelen Cook on 2/3/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsTextView: UITextView!
    var selectedHero = [
        "name": "Green Man",
        "description": "a hero who uses green paint to stun, immobilize and neutralize his opponents",
        "ranking": "Class B rank 542"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailsTextView.text = "\(selectedHero["name"] ?? "A Hero") is \(selectedHero["description"] ?? "Someone who protects the peace using force"). Ranked \(selectedHero["ranking"] ?? "depending on ability")."
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
