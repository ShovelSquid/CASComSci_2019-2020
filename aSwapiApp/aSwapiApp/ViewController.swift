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
    @IBOutlet weak var Text: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    var myMovies:[String] = [""]
    var selectedMov:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button.setTitle("Search", for: .normal)
        Button2.setTitle("", for: .normal)
        Button3.setTitle("", for: .normal)
        Label.text = "Search for any Star Wars Film!"
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        if Text.text != "" {
            search()
        }
        else {
            Label.text = "Please enter a Star Wars Film"
        }
        
    }
    
    func displaySearch(u:URL, d:[String:Any], c:Int, r:[[String:Any]]) {
        Label.text = "\(c) results."
        for each in r {
            let title: String? = each["title"] as? String
            Label.text! += "2"
            if let title = title {
                Label.text! += "3"
                myMovies.append(title)
                Label.text = title
            }
            else {
                Label.text = "Googgo"
            }
        }
        Button.setTitle("Learn More", for: .normal)
        Button2.setTitle("Next Movie", for: .normal)
        Button3.setTitle("Previous Movie", for: .normal)
    }
    
    @IBAction func nextMovie(_ sender: UIButton) {
        if myMovies != [""] {
            if selectedMov > myMovies.count {
                Label.text = "That's All!"
            }
            else {
                selectedMov += 1
                Label.text = myMovies[selectedMov]
            }
        }
        else {
            Label.text = "Nil"
        }
    }
    
    @IBAction func prevMovie(_ sender: UIButton) {
        if myMovies != [""] {
            if selectedMov <= 0 {
                Label.text = myMovies[0]
                selectedMov = 0
            }
            else {
                selectedMov -= 1
                Label.text = myMovies[selectedMov]
            }
        }
        else {
            Label.text = "Nil"
        }
    }
    
    func search() {
        let url: URL? = URL(string: "https://swapi.co/api/films/?search=A%20New%20Hope")
        if let url = url {
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary {
                        let count: Int? = dictionary["count"] as? Int
                        if let count = count {
                            let results: [[String:Any]]? = dictionary["results"] as? [[String:Any]]
                            if let results = results {
                                displaySearch(u:url, d:dictionary, c:count, r:results)
                            }
                        }
                    }
                }
            }
        }
        else {
            Label.text = "Nonexistent"
        }
        
        myMovies = [""]
        selectedMov = 0


    }


}

