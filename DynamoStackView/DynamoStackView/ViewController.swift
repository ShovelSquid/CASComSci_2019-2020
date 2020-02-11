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
        if button.titleLabel!.text! != "5000" {
            let ksvc = segue.destination as! KingStackVC
            let number:Int? = Int(button.titleLabel!.text!)
            ksvc.labelCount = number!
        }
        else {
            return
        }

    }

}

