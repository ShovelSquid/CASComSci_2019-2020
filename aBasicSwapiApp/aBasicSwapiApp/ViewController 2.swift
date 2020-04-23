//
//  ViewController.swift
//  aBasicSwapiApp
//
//  Created by Kaelen Cook on 1/16/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Movie1: UIButton!
    @IBOutlet weak var Movie2: UIButton!
    @IBOutlet weak var Movie3: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    
    var myMovieDict: [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NextButton.setTitle("", for: .normal)
    }
    
    
    @IBAction func pressButton1(_ sender: Any) {
        getURL(urlData:"7")
        NextButton.setTitle("Next", for: .normal)
    }
        
    @IBAction func pressButton2(_ sender: Any) {
        getURL(urlData:"1")
        NextButton.setTitle("Next", for: .normal)
    }
    
    @IBAction func pressButton3(_ sender: Any) {
        getURL(urlData:"4")
        NextButton.setTitle("Next", for: .normal)
    }
    
    func getURL(urlData: String) {
        let baseUrl = "https://swapi.co/api/films/\(urlData)/"
        let newString = baseUrl.replacingOccurrences(of: " ", with: "%20")
        let url: URL? = URL(string: newString)
        
        print("1")
        if let url = url {
            print("2")
            let data: Data? = try? Data(contentsOf: url)
            if let data = data {
                print("3")
                let json: Any? = try? JSONSerialization.jsonObject(with: data, options: [])
                if let json = json {
                    print("4")
                    let dictionary: [String:Any]? = json as? [String:Any]
                    if let dictionary = dictionary {
                        print("5")
                        myMovieDict = dictionary
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as? DetailsViewController
        if let dvc = dvc {
            dvc.movieData = myMovieDict
        }
    }
    
}

