//
//  ViewController.swift
//  aSwapiApp
//
//  Created by Kaelen Cook on 12/11/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        let url: URL = URL(string: "https://swapi.co/api/people/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let name: String? = dictionary["name"] as? String
                    if let name = name {
                        Label.text = name
                    }
                }
            }
        }
    }
    

}

