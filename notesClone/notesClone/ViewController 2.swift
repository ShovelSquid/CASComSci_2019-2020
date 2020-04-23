//
//  ViewController.swift
//  notesClone
//
//  Created by Kaelen Cook on 11/14/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var dateTitle: UINavigationItem!
    
    var note:Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = note!.note
        dateTitle.title = "\(note!.date)"
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        note!.note = textField.text
    }


}

