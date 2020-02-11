//
//  DynamicAdditionController.swift
//  DynamoStackView
//
//  Created by Kaelen Cook on 2/10/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class DynamicAdditionController: UIViewController {
    @IBOutlet weak var buttonStacks: UIStackView!
    var buttonNames = ["Press Me!", "No, Press Me!", "Dude, Me!", "Press Me!", "Press Me!", "No, Press Me!", "Press Me Instead!", "No no no, Press Me!", "You know you want to press me."]
    
    var buttonResponses: KeyValuePairs = [
        "Aaaaaaaa...": "Thanks a lot man. That really helped",
        "Heheh": "That tickles",
        "Really?": "You pressed me? ME? What kind of IDIOT Are you? Who do you think I am? You must be some kind of--",
        "Thank you!": "Thank you very much!",
        "...": "... thanks...",
        "WOW! OH MY GOD!": "WOOHOOOOO! YEEEAAAAH!!! MMM!!!",
        "Good job.": "You performed admirably.",
        "Hey kid, ": "I like your spunk.",
        "You know, ": "All I wanted was to be pressed. Now that I have been pressed, I feel like I want something more in life."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let num = Int.random(in:1...15)
        for _ in 1...num {
            addButton()
        }
    }
    
    
    @objc func buttonAlert() {
        let num = Int.random(in: 0...buttonResponses.count-1)
        let message = UIAlertController(title: buttonResponses[num].key, message: buttonResponses[num].value, preferredStyle: .alert)
        message.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_) in return}))
        message.addAction(UIAlertAction(title: "Ok...", style: .default, handler: {(_) in return}))
        self.present(message, animated: true, completion: {})
    }
    
    
    @objc func addButton() {
        let newButton = UIButton()
        let num = Int.random(in: 0...buttonNames.count-1)
        if buttonStacks != nil {
            newButton.setTitle(buttonNames[num], for: .normal)
        }
        else {
            newButton.setTitle("Press Me!", for: .normal)
        }
        newButton.setTitleColor(UIColor.red, for: .normal)
        buttonStacks.addArrangedSubview(newButton)
        newButton.addTarget(self, action: #selector(buttonAlert), for: .touchUpInside)
    }
    
    
}
