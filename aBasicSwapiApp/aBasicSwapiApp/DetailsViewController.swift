//
//  DetailsViewController.swift
//  aBasicSwapiApp
//
//  Created by Kaelen Cook on 1/16/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    var movieData: [String:Any] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var output:String = ""
        
        output += "title: \(movieData["title"] ?? "title")"
        output += "\n"
        
        output += "director: \(movieData["director"] ?? "director")"
        output += "\n"
        
        output += "producer: \(movieData["producer"] ?? "producer")"
        output += "\n"
        
        output += "released: \(movieData["release_date"] ?? "release date")"
        output += "\n"
        
        output += "characters:"
        output += "\n"
        for each in movieData["characters"] as? [String] ?? ["character"] {
            let url: URL? = URL(string: each)
            if let url = url {
                let responseData:Data? = try? Data(contentsOf: url)
                if let responseData = responseData {
                    let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                    if let json = json {
                        let dictionary: [String: Any]? = json as? [String: Any]
                        if let dictionary = dictionary {
                            let name = dictionary["name"] as? String
                            if let name = name {
                                output += name
                                output += "\n"
                            }
                        }
                    }
                }
            }
        }
        
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
