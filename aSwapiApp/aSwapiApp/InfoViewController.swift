//
//  InfoViewController.swift
//  aSwapiApp
//
//  Created by Kaelen Cook on 1/15/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    
    var itemInfo: Any = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let itemInfoAsString = itemInfo as? String
        if let itemInfoAsString = itemInfoAsString {
            if itemInfoAsString.contains("https:") {
                let output = getURL(theString:itemInfoAsString)
                if let output = output {
                    Label.text! = output
                }
                else {
                    Label.text! = itemInfoAsString
                }
            }
            else {
                Label.text! = itemInfoAsString
            }
        }
        else {
            let itemInfoAsArray = itemInfo as? [String]
            if let itemInfoAsArray = itemInfoAsArray {
                var output:String = ""
                for each in itemInfoAsArray {
                    if each.contains("https:") {
                        let pout = getURL(theString:each)
                        if let pout = pout {
                            output += pout
                        }
                        else {
                            output += each
                        }
                    }
                    else {
                        output += each
                    }
                    output += "\n"
                }
                Label.text! = output
            }
        }
    }
    
    func getURL(theString: String) -> String? {
        let url: URL? = URL(string: theString)
        
        if let url = url {
            let responseData:Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary {
                        let name = dictionary["name"] as? String
                        if let name = name {
                            return name
                        }
                    }
                }
            }
        }
        return nil
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
