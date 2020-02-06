//
//  ViewController.swift
//  HardCoding
//
//  Created by Kaelen Cook on 2/3/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        let button = sender as! UIButton
        if button.titleLabel!.text == "Death Paint" {
            dvc.selectedHero = [
                "name": "Death Paint",
                "description": "a hero who uses variously colored paints to stun, immobilize and neutralize his opponents",
                "ranking": "B class rank 73"
            ]
        }
        else if button.titleLabel!.text == "Turtle Rider" {
            dvc.selectedHero = [
                "name": "Turtle Rider",
                "description": "a hero who utilizes the turtle gun to fire turtle shells at near sonic speeds at his enemies",
                "ranking": "C class rank 46"
            ]
        }
        else if button.titleLabel!.text == "Yolk Molder" {
            dvc.selectedHero = [
                "name": "Yolk Molder",
                "description": "a hero who can psychically manipulate any and all egg yolks",
                "ranking": "A class rank 17"
            ]
        }
    }
}

