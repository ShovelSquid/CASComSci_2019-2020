//
//  KingStackVC.swift
//  DynamoStackView
//
//  Created by Kaelen Cook on 2/6/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class KingStackVC: UIViewController {
    @IBOutlet weak var LordStackView: UIStackView!
    
    var labelCount = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({ (x) in UILabel() })
        for (i, label) in labels.enumerated() {
            let a = i + 1
            if a == 1 {
                label.text = "Sir label the \(a)st"
            }
            if a == 2 {
                label.text = "Sir label the \(a)nd"
            }
            if a == 3 {
                label.text = "Sir label the \(a)rd"
            }
            if a > 3 {
                label.text = "Sir Label the \(a)th"
            }
            label.textAlignment = .center
            LordStackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 1)
            
            if label != labels[0] {
                LordStackView.addConstraint(constraint)
            }
        }
    }
    
}
