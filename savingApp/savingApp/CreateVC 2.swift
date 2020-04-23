//
//  CreateVC.swift
//  savingApp
//
//  Created by Kaelen Cook on 1/23/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class CreateVC: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        save()
    }
    
    func getSaveFileURL() -> URL? {
        let myURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        if let myURL = myURL {
            return myURL.appendingPathComponent("CharacterSaveFile.json")
        }
        return nil
    }
    
    @IBAction func saveAction(_ sender: Any) {
        save()
    }
    
    func save() {
        let url = getSaveFileURL()
        if let url = url {
            let data:[String:Any] = [
                "name" : textField1.text ?? "none",
                "class" : textField2.text ?? "none",
                "health" : 0
            ]
            if let returnvalue = try? JSONSerialization.data(withJSONObject: data, options: []) {
                try? returnvalue.write(to: url)
            }
            print("saved")
        }
        else {
            print("faled to sav")
        }
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
