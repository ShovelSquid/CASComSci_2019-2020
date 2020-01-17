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
    @IBOutlet weak var Button4: UIButton!
    
    var myMovies:[String] = []
    var selectedMov:Int = 0
    var movieItemStuff: [String:Any] = [:]
    var baseMovieURL: String = ""
    
    var finalMovieDictionary: [String:Any] = [:]
    
    var moviesNum:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Button.setTitle("Search", for: .normal)
        Button2.setTitle("", for: .normal)
        Button3.setTitle("", for: .normal)
        Button4.setTitle("", for: .normal)
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
        moviesNum = "\(c) results."
        movieItemStuff = d
        for each in r {
            let title: String? = each["title"] as? String
            if let title = title {
                myMovies.append(title)
                selectedMov = -1
                Label.text = moviesNum
            }
            else {
                Label.text = "Googgo"
            }
        }
        Button2.setTitle("Next Movie", for: .normal)
    }
    
    @IBAction func nextMovie(_ sender: UIButton) {
        if myMovies != [] {
            selectedMov += 1
            if selectedMov >= myMovies.count {
                Label.text = "That's all!"
                selectedMov = myMovies.count
                Button2.setTitle("", for: .normal)
                Button3.setTitle("Previous Movie", for: .normal)
                Button4.setTitle("", for: .normal)
            }
            else {
                Label.text = myMovies[selectedMov]
                let turkey = movieItemStuff["results"]! as! [[String:Any]]
                baseMovieURL = turkey[selectedMov]["url"] as! String
                Button2.setTitle("Next Movie", for: .normal)
                Button3.setTitle("Previous Movie", for: .normal)
                Button4.setTitle("Find Out More", for: .normal)
            }
        }
        else {
            Label.text = "Nil"
        }
    }
    
    
    @IBAction func prevMovie(_ sender: UIButton) {
        if myMovies != [] {
            selectedMov -= 1
            if selectedMov < 0 {
                Label.text = moviesNum
                selectedMov = -1
                Button2.setTitle("Next Movie", for: .normal)
                Button3.setTitle("", for: .normal)
                Button4.setTitle("", for: .normal)
            }
            else {
                Label.text = myMovies[selectedMov]
                let turkey = movieItemStuff["results"]! as! [[String:Any]]
                baseMovieURL = turkey[selectedMov]["url"] as! String
                Button2.setTitle("Next Movie", for: .normal)
                Button3.setTitle("Previous Movie", for: .normal)
                Button4.setTitle("Find Out More", for: .normal)
            }
        }
        else {
            Label.text = "Nil"
        }
    }
    
    @IBAction func findOut(_ sender: Any) {
        let url: URL? = URL(string: baseMovieURL)
        
        if let url = url {
            let responseData:Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary {
                        finalMovieDictionary = dictionary
                    }
                }
            }
        }
    }
    
    
    func search() {
        myMovies = []
        selectedMov = 0
        let baseUrlString = "https://swapi.co/api/films/?search=\(Text.text!)"
        let newString = baseUrlString.replacingOccurrences(of: " ", with: "%20")
        let url: URL? = URL(string: newString)
        

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
                            else {
                                Label.text = "Apologies."
                            }
                        }
                        else {
                            Label.text = "That's not a movie"
                        }
                    }
                    else {
                        Label.text = "Nada"
                    }
                }
                else {
                    Label.text = "Sorry"
                }
            }
            else {
                Label.text = "It doesn't exist"
            }
        }
        else {
            Label.text = "Nonexistent"
        }


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TableViewController {
            destination.myDict = finalMovieDictionary
        }
    }


}

