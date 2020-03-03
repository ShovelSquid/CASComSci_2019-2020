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
    @IBOutlet weak var scrollView: UIScrollView!
    
    var buttonNames = ["Press Me!", "No, Press Me!", "Dude, Me!", "Press Me!", "Press Me!", "No, Press Me!", "Press Me Instead!", "No no no, Press Me!", "You know you want to press me."]
    
    var incorrectResponses: KeyValuePairs = [
        "Really?": "You pressed me? ME? What kind of IDIOT Are you? Who do you think I am? You must be some kind of--",
        "You tried really hard...": "but in the end you failed.",
        "Wrong!": "Mister Strong! Think of tomorrow, mister strong!",
        "Thanks, but...": "haha. butt. Go somewhere else.",
        "Incorrect": "These are not the droids you are looking for",
        "I appreciate the sentiment,": "But you are really quite lame",
        "Nope.": "Not here.",
        "Not here.": "really. No secrets here.",
        "Leave": "You aren't welcome",
        "Maybe someday.": "But that day is not today.",
        "GO! GET OUT!": "GET OOUOOUUUUUUT!!!",
        "Oh--": "hehe, didn't see you there. Want to play with my toys? No? Well, poopy.",
        "This is a restricted area.": "Please vacate the premises immediately.",
        "YOU FOUND ME": "Oh wait, no you didn't.",
        "Sorry.": "Just sorry."
    ]
    
    var correctResponses: KeyValuePairs = [
        "Huzzah!": "You found me!",
        "Good Job!": "You got the needle out of the haystack!",
        "Good Job.": "You performed admirably.",
        "I like your style kid.": "You found the truth.",
        "You tried really hard...": "and succeeded! Good job!"
    ]
    
    var rats:[String] = ["Rats", "Moving On...", "Not this one", "Maybe the next?", "What?", "That's not right", "Let's try again", "Whoops", "Sorry...", "Not this one", "That's not right"]
    
    var buttonCount = 25
    
    var correctNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        correctNum = Int.random(in: 1...buttonCount)
        print(correctNum)
        for i in 1...buttonCount {
            addButton(i: i)
        }
        buttonStacks.frame = CGRect(x: 0, y: 0, width: 400, height: 90*buttonCount)
        scrollView.contentSize = CGSize(width: 400, height: 90*buttonCount)
    }
    
    
    @objc func buttonAlert(sender:GuesserButton) {
        let num = sender.incorrectGreeting
        let random = Int.random(in: 0...rats.count-1)
        print(num)
        
        let message = UIAlertController(title: incorrectResponses[num].key, message: incorrectResponses[num].value, preferredStyle: .alert)
        message.addAction(UIAlertAction(title: rats[random], style: .default, handler: {(_) in return}))
        self.present(message, animated: true, completion: {})
    }
    
    @objc func correctButtonAlert(sender:GuesserButton) {
        let num = sender.correctGreeting
        print(num)
        
        let message = UIAlertController(title: correctResponses[num].key, message: correctResponses[num].value, preferredStyle: .alert)
        message.addAction(UIAlertAction(title: "I won!", style: .default, handler: {(_) in return}))
        self.present(message, animated: true, completion: {})
    }
    
    
    @objc func addButton(i: Int) {
        let newButton = GuesserButton()
        let num = Int.random(in: 0...buttonNames.count-1)
        
        newButton.title = buttonNames[num]
        newButton.number = i
        
        newButton.setTitle(newButton.title, for: .normal)
        newButton.setTitleColor(UIColor.red, for: .normal)
        newButton.frame = CGRect(x: 0, y: 0, width: 400, height: 90)
        buttonStacks.addArrangedSubview(newButton)
        
        if newButton.number == correctNum {
            newButton.correctGreeting = Int.random(in: 0...correctResponses.count-1)
            newButton.addTarget(self, action: #selector(correctButtonAlert(sender:)), for: .touchUpInside)
        }
        else {
            newButton.incorrectGreeting = Int.random(in: 0...incorrectResponses.count-1)
            newButton.addTarget(self, action: #selector(buttonAlert(sender:)), for: .touchUpInside)
        }

    }
    
    
}
