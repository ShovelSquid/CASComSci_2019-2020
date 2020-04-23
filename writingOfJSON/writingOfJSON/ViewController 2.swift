//
//  ViewController.swift
//  writingOfJSON
//
//  Created by Kaelen Cook on 1/9/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var enemiesInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = GetFileURLmyBoyHYAAH() {
            let data = try? Data(contentsOf: url)
            if let data = data {
                let dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                nameInput.text = dictionary["name"]
                dateInput.text = dictionary["date"]
                enemiesInput.text = dictionary["enemies"]
            }
        }
        
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        let data: [String:String] = [
            "name": nameInput.text ?? "nil",
            "date": dateInput.text ?? "nil",
            "enemies": enemiesInput.text ?? "nil"
        ]
        
        let url = GetFileURLmyBoyHYAAH()
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try? jsonData.write(to: url!)
        } else {
            print("Failed to do the Save")
        }
        
    }
    
    
    @IBAction func loadAction(_ sender: Any) {
        
    }
    
    
    func GetFileURLmyBoyHYAAH() -> URL? {
        let docsDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        if docsDirectory != nil {
            return docsDirectory!.appendingPathComponent("SaveFile.json")
        }
        return nil
    }

}

