//
//  ViewController.swift
//  DyButtons
//
//  Created by Kaelen Cook on 2/7/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var adventureButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adventureButton.addTarget(self, action: #selector(addButton), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Hey! Listen!", message: "It's dangerous out there. Take this.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: {(_) in return}))
        alert.addAction(UIAlertAction(title: "No!", style: .destructive, handler: {(_) in return}))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func addButton() {
        let newButton = UIButton()
        newButton.setTitle("Explore", for: .normal)
        newButton.setTitleColor(UIColor(displayP3Red: 1, green: 0, blue: 1, alpha: 1), for: .normal)
        stackView.addArrangedSubview(newButton)
    }


}

