//
//  ViewController.swift
//  DynamoStackView
//
//  Created by Kaelen Cook on 2/6/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let button = sender as! UIButton
        let dyvc = segue.destination as! DynamicAdditionController
        if button.titleLabel!.text! == "Really Easy" {
            dyvc.buttonCount = 3
        }
        if button.titleLabel!.text! == "Easy" {
            dyvc.buttonCount = 10
        }
        if button.titleLabel!.text! == "Normal" {
            dyvc.buttonCount = 25
        }
        if button.titleLabel!.text! == "Hard" {
            dyvc.buttonCount = 65
        }
        if button.titleLabel!.text! == "Very Hard" {
            dyvc.buttonCount = 115
        }
        if button.titleLabel!.text! == "Why" {
            dyvc.buttonCount = 625
        }

    }

}

