//
//  ViewController.swift
//  LayoutExcercise
//
//  Created by Kaelen Cook on 1/29/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    var buttonColor = UIColor.systemPink
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressing(_ sender: Any) {
        button.backgroundColor! = UIColor.white
        button.tintColor! = UIColor.gray
    }
    
    @IBAction func pressed(_ sender: Any) {
        button.backgroundColor! = buttonColor
        button.tintColor! = UIColor.white
    }
    
}

