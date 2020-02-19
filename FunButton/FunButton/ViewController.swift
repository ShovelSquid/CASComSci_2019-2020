//
//  ViewController.swift
//  FunButton
//
//  Created by Kaelen Cook on 2/11/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Snurpo: NamedButton!
    @IBOutlet weak var Quadrex: NamedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Snurpo.name = "Snurpo, Destroyer of Worlds"
        Snurpo.greeting = "AAAAAARGH!!!"
        Quadrex.name = "Quadrex, Keeper of the Knowledge"
        Quadrex.greeting = "Almea'tovno vegrad."
    }

    @IBAction func buttonPress(_ sender: Any) {
        let message: String
        let title: String
        if let sender = sender as? NamedButton {
            message = "Hello my name is \(sender.name)."
            title = sender.greeting
        }
        else {
            message = "Hello I do not know who I am."
            title = "Welcome"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

