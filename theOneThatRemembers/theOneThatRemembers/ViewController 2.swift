//
//  ViewController.swift
//  theOneThatRemembers
//
//  Created by Kaelen Cook on 1/7/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var rememberButton: UIButton!
    @IBOutlet weak var forgetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingName: String? = try? String(contentsOf: getNameFileURL())
        if let existingName = existingName {
            greetingLabel.text = "Welcome Back, \(existingName)."
        }
        else {
            greetingLabel.text = "You are unknown. IDENTIFY YOURSELF."
        }
    }
    
    func getNameFileURL() -> URL {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("UserName.txt")
    }
    
    @IBAction func Remember(_ sender: Any) {
        let name = inputField.text!
        try! name.write(to: getNameFileURL(), atomically: true, encoding: .utf8)
        greetingLabel.text = "Welcome Back, \(name)."
    }
    
    @IBAction func Forget(_ sender: Any) {
        try? FileManager.default.removeItem(at: getNameFileURL())
        greetingLabel.text = "You are forgotten. Identify yourself."
    }
    
}

